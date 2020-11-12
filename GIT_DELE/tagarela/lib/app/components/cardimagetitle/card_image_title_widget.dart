import 'package:flutter/material.dart';

class CardImageTitleWidget extends StatelessWidget {
  final String title;
  final String pathImage;
  final Color primaryColor;
  final Color secondaryColor;
  final Function onPressed;

  const CardImageTitleWidget(
      {Key key,
      this.title,
      this.pathImage,
      this.primaryColor,
      this.secondaryColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.longestSide * .2,
        width: MediaQuery.of(context).size.longestSide * .2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.longestSide * 0.1,
              child: Image.asset(pathImage),
            ),
            Container(
              height: MediaQuery.of(context).size.longestSide * .07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: secondaryColor,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'asap-vf-beta',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
