import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../components/showMyBottomSheet.dart';
import '../utils/colors.dart';
import '../utils/text.dart';

class NewsBox extends StatelessWidget {
  final String imageurl, title, time, description, url;

  const NewsBox({
    Key? key,
    required this.imageurl,
    required this.title,
    required this.time,
    required this.description,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder: (context, imageprovider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageprovider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primary,
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                  errorWidget: (context, _, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    modifiedText(title, 16, AppColors.white),
                    const SizedBox(
                      height: 5,
                    ),
                    modifiedText(time, 10, AppColors.lightwhite)
                  ],
                ))
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Divider(
            color: AppColors.lightwhite,
          ),
        ),
      ],
    );
  }
}
