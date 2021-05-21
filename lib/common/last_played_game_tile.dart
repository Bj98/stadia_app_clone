import 'package:flutter/material.dart';
import 'package:stadia_app_clone/common/game_progress_widget.dart';
import 'package:stadia_app_clone/model/last_played_game.dart';
import 'package:stadia_app_clone/styleguide/text_styles.dart';

class LastPlayedGameTile extends StatelessWidget {

  final LastPlayedGame lastPlayedGame;
  final double screenWidth;
  final double gameProgress;

  const LastPlayedGameTile({Key key, this.lastPlayedGame, this.screenWidth, this.gameProgress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Stack(children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.asset(
                      lastPlayedGame.imagePath,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 8,
                      right: 8,
                      top:0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.red,
                        ),
                      )
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  child: RichText(
                    text:TextSpan(
                      children: [
                        TextSpan(text: lastPlayedGame.name,style: headingTwoTextStyle),
                        TextSpan(text: '\n'),
                        TextSpan(text: "${lastPlayedGame.hoursPlayed} hours played",style: bodyTextStyle),
                      ]
                    )
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: GameProgressWidget(screenWidth:screenWidth,gameProgress: gameProgress))
          //Expanded(GameProgressWidget())
        ],
      ),
    );
  }
}
