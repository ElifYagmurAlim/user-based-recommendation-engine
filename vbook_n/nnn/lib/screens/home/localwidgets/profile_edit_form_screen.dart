import 'package:flutter/material.dart';
import 'package:nnn/screens/home/localwidgets/appbar_widget.dart';

class ProfileEditFormScreen extends StatefulWidget {
  const ProfileEditFormScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileEditFormScreenState createState() => _ProfileEditFormScreenState();
}

class _ProfileEditFormScreenState extends State<ProfileEditFormScreen> {
  final double coverHeight = 256;
  final double profileHeight = 128;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 1.5;
    final bottom = profileHeight / 1.5;
    final color = Colors.blue;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          child: buildProfileImage(),
          top: top,
        ),
        Positioned(
          child: Padding(
            padding: EdgeInsets.only(left: 108),
            child: buildEditIcon(color),
          ),
          bottom: 0,
        )
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://www.pixsy.com/wp-content/uploads/2021/04/edi-libedinsky-1bhp9zBPHVE-unsplash-1-1024x683.jpeg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 1.5,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: profileHeight / 1.5 - 5,
          child: ClipOval(
            child: Image.network(
              'https://play-lh.googleusercontent.com/IeNJWoKYx1waOhfWF6TiuSiWBLfqLb18lmZYXSgsH1fvb8v1IYiZr5aYWe0Gxu-pVZX3',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Elif Alim',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: AboutContent(),
          ),
        ],
      );

  Widget AboutContent() => Column(
        children: const [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'About',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      );

  Widget buildEditIcon(Color color) => BuildCircle(
        color: Colors.white,
        all: 3,
        child: BuildCircle(
          color: color,
          all: 8,
          child: Icon(
            Icons.camera,
            size: 25,
            color: Colors.white,
          ),
        ),
      );

  Widget BuildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ));
}
