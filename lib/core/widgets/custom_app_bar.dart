  import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context) {
    return AppBar(
     backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
