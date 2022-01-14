import json

from flask import Flask, jsonify, request
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

from scipy.sparse import csr_matrix
from sklearn.neighbors import NearestNeighbors

# GoodBooks-10K Data
books = pd.read_csv(r"C:\Users\elifa\Downloads\goodbooks-10k-master\goodbooks-10k-master/books.csv")
ratings = pd.read_csv(r"C:\Users\elifa\Downloads\goodbooks-10k-master\goodbooks-10k-master/ratings.csv")

# Show all columns in DataFrame
pd.set_option('display.max_columns', None)

books = books.dropna()

ratings = ratings.sort_values("user_id")
ratings.drop_duplicates(subset=["user_id","book_id"], keep='first', inplace=True)
books.drop_duplicates(subset='original_title', keep='first', inplace=True)

merged_df = pd.merge(books, ratings, how='left', left_on=['book_id'], right_on=['book_id'])
df = merged_df[['book_id','original_title', 'user_id', 'rating']]

df = df.rename(columns = {'id':'book_id'})
df.head(100)

ratings_df = df.pivot_table(index='book_id',columns='user_id',values='rating').fillna(0)

pd.set_option('display.max_columns', 100)
ratings_df.head()

ratings_matrix = csr_matrix(ratings_df.values)

model_knn = NearestNeighbors(metric='cosine', algorithm = 'brute')
model_knn.fit(ratings_matrix)

def get_book_id(book_title):
    target_df = df.loc[df['original_title'] == book_title]
    return target_df['book_id'].iloc[0]

id_TheHungerGames = get_book_id('The Hunger Games')
print(id_TheHungerGames)

def get_title(book_id):
    target_df = df.loc[df['book_id'] == book_id]
    return target_df['book_id'].iloc[0]

print(get_title(1))


def get_recomm(book_title, num_neighbors=10, display=False):
    book_ids = []

    query_index = get_book_id(book_title) - 1

    if num_neighbors > 0:
        distances, indices = model_knn.kneighbors(ratings_df.iloc[query_index, :].values.reshape(1, -1),
                                                  n_neighbors=num_neighbors + 1)
    else:
        distances, indices = model_knn.kneighbors(ratings_df.iloc[query_index, :].values.reshape(1, -1),
                                                  n_neighbors=10 + 1)

    for i in range(0, len(distances.flatten())):
        if display is True:
            if i == 0:
                print('Recommendations for ', book_title, '\n')
            else:
                print('{0}\t Book ID: {1}\t  Distance: {2}:\n'.format(i, ratings_df.index[indices.flatten()[i]],
                                                                      distances.flatten()[i]))

        book_ids.append(ratings_df.index[indices.flatten()[i]])

    return book_ids

recommendations_for_TheHungerGames = get_recomm('The Hunger Games', num_neighbors=10, display=True)

for b in recommendations_for_TheHungerGames[1:]:
    print('id:', b, '\t\tBook: ', get_title(b))

# Top 10 recommendations for Harry Potter and the Philosopher's Stone


app = Flask(__name__)
@app.route('/', methods=['GET', 'POST'])
def hello_world():
        return jsonify("hello")

@app.route('/jsondata', methods=['GET'])
def json_example():
    title = request.args.get('title')
    vara = ""
    book_ids_for_H = get_recomm(title, num_neighbors=10)
    # skip the first item
    json_file = {}

    for b in book_ids_for_H[1:]:
        if(vara == ""):
            vara += str(get_title(b))
        else:
            vara += ", "+str(get_title(b))
    json_file['query'] = vara
    return jsonify(json_file)

if __name__ == '__main__':
    app.run()

