import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  const appbar({Key? key})
      : preferredSize = const Size.fromHeight(50),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boldText('Techno', 20, AppColors.primary),
            boldText('King', 20, AppColors.lightwhite)
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
