import 'package:flutter/material.dart';
import 'package:stadia_app_clone/styleguide/colors.dart';
import 'package:stadia_app_clone/styleguide/text_styles.dart';

class PopularWithFriendsGameWidget extends StatelessWidget {
  final String imagePath;

  const PopularWithFriendsGameWidget({Key key, this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 4),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom:12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(imagePath)),
          ),
          Positioned(
            bottom: 6,
            right: 8,
            left: 8,
            child: InkWell(
              onTap: null,
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Text(
                    "Play",
                    textAlign: TextAlign.center,
                    style: playWhiteTextStyle,
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
