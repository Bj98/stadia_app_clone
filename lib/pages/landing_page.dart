import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stadia_app_clone/common/content_heading_widget.dart';
import 'package:stadia_app_clone/common/last_played_game_tile.dart';
import 'package:stadia_app_clone/common/rounded_image.dart';
import 'package:stadia_app_clone/model/friends.dart';
import 'package:stadia_app_clone/model/last_played_game.dart';
import 'package:stadia_app_clone/pages/secondary_home_page.dart';
import 'package:stadia_app_clone/styleguide/colors.dart';
import 'package:stadia_app_clone/styleguide/image_asset.dart';
import 'package:stadia_app_clone/styleguide/text_styles.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.maybeOf(context).size.height;
    final screenWidth = MediaQuery.maybeOf(context).size.width;
    final logoHeight = screenHeight * 0.4;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(screenWidth * 0.4, 10),
              child: Transform.rotate(
                  angle: -0.1,
                  child: SvgPicture.asset(
                    logo,
                    height: logoHeight,
                    color: logoTintColor,
                  )),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Icon(
                            Icons.menu,
                            color: tertiaryTextColor,
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondaryHomePage()));
                          },
                        ),
                        Icon(Icons.search, color: tertiaryTextColor)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              children: <Widget>[
                                RoundedImage(
                                  imagePath: player1,
                                  ranking: 44,
                                  showRanking: true,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: 'Hello',
                                          style: userNameTextStyle),
                                      TextSpan(text: '\n'),
                                      TextSpan(
                                          text: 'Jon Snow',
                                          style: userNameTextStyle)
                                    ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 16.0, bottom: 16, top: 16),
                            child: Material(
                              elevation: 4,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 16, bottom: 32),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                                child: Text(
                                              "HOURS PLAYED",
                                              style: hoursPlayedLabelTextStyle,
                                            ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "300 Hours",
                                          style: hoursPlayedTextStyle,
                                        )
                                      ])),
                            ),
                          ),
                          ContentHeadingWidget(heading: "Last played games"),
                          for (var i = 0; i < lastPlayedGames.length; i++)
                            LastPlayedGameTile(
                              lastPlayedGame: lastPlayedGames[i],
                              screenWidth: screenWidth,
                              gameProgress: lastPlayedGames[i].gameProgress,
                            ),
                          ContentHeadingWidget(heading: "Friends"),
                        ]),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: <Widget>[
                          for (var i = 0; i < friends.length; i++)
                            RoundedImage(
                              imagePath: friends[i].imagePath,
                              isOnline: friends[i].isOnline,
                              name: friends[i].name,
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
