import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

void showMyBottomSheet(BuildContext context, String title, String description,
    String imageUrl, String url) {
  showBottomSheet(
    backgroundColor: AppColors.black,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    )),
    elevation: 20,
    context: context,
    builder: (context) => MyBottomSheetLayout(
      title: title,
      description: description,
      url: url,
      imageUrl: imageUrl,
    ),
  );
}

_launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title;
  final String description;
  final String url;
  final String imageUrl;

  const MyBottomSheetLayout({
    Key? key,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(imageUrl: imageUrl, title: title),
          Container(
            padding: const EdgeInsets.all(10),
            child: modifiedText(description, 16, AppColors.white),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Read Full Article',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchUrl(url);
                      },
                    style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 0, 114, 208)))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetImage extends StatelessWidget {
  final String imageUrl;
  final String title;

  const BottomSheetImage({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(children: [
        Container(
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          bottom: 10,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 300,
            child: boldText(title, 18, AppColors.white),
          ),
        )
      ]),
    );
  }
}
