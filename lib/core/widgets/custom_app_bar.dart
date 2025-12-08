import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';

AppBar customAppBar(BuildContext context, {String? title}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(title ?? '', style: AppTextStyles.medium20),
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios_new),
    ),
  );
}
