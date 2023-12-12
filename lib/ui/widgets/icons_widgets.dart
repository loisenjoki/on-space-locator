import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';

class CustomIcons extends StatelessWidget {
   final IconData icon;
   final String text;


  CustomIcons({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28.0, color:baseGrey4,),
        SizedBox(width: 3.0),
        Text(text, style: TextStyle(fontSize: 10.0)),
      ],
    );
  }
}