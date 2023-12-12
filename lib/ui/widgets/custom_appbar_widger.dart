import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Positioned(
          top: 20,
          child: AppBar(
            backgroundColor: Colors.transparent, // Set transparent background
            elevation: 0, // Remove shadow
            leading: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Icon background color
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  // Handle left icon press
                },
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Icon background color
                ),
                child: IconButton(
                  icon: Icon(Icons.send, color: Colors.black),
                  onPressed: () {
                    // Handle right icon press
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}