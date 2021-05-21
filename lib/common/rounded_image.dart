import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:stadia_app_clone/styleguide/colors.dart';
import 'package:stadia_app_clone/styleguide/text_styles.dart';
import 'package:vector_math/vector_math_64.dart' as math;


class RoundedImage extends StatelessWidget {

  final isOnline;
  final bool showRanking;
  final double ranking;
  final String imagePath;
  final imageSize=32.0;
  final String name;


  const RoundedImage({Key key, this.isOnline=false, this.showRanking=false, this.ranking,@required this.imagePath, this.name=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          height: imageSize+36,
          child: Stack(
            children: [
              CustomPaint(
                painter: RoundedImageBorder(isOnline: isOnline),
                child: CircleAvatar(
                  radius: imageSize,
                  backgroundImage: AssetImage(
                    imagePath
                  ),
                ),
              ),
              if(showRanking) Positioned(
                right: 0,
                bottom: 0,
                child: ClipOval(
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(gradient: appGradient),
                    child: Center(
                      child: Text(
                        ranking.toString(),
                        style: rankTextStyle,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        if(name!=null) Text(name,style: bodyTextStyle,)
      ],
    );
  }
}

class RoundedImageBorder extends CustomPainter{

  final bool isOnline;

  RoundedImageBorder({this.isOnline});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center= Offset(size.width/2, size.height/2);
    Paint borderPaint=Paint()
    ..strokeCap=StrokeCap.butt
    ..style=PaintingStyle.stroke
    ..strokeWidth=4.0;

    if(isOnline){
      borderPaint.shader=appGradient.createShader(Rect.fromCircle(center: center, radius: size.width/2));
    }else{
      borderPaint.color=tertiaryTextColor;
    }

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width/2), math.radians(-90), math.radians(360), false, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }

}
