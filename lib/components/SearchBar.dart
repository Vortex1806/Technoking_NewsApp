import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../backend/functions.dart';
import '../utils/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  static var searchbarcontroller = TextEditingController(text: '');
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: AppColors.darkgrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: TextField(
                  controller: SearchBar.searchbarcontroller,
                  decoration: InputDecoration(
                      hintText: 'Search for a Keyword or a Phrase',
                      hintStyle: GoogleFonts.lato(),
                      border: InputBorder.none),
                ))
              ],
            ),
          ),
        )),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchnews();
          },
          child: CircleAvatar(
            backgroundColor: AppColors.darkgrey,
            maxRadius: 49 / 2,
            child: Icon(Icons.search),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
