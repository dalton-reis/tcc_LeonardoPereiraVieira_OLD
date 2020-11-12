import 'package:flutter/material.dart';

class TagarelaCardWidget extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final double fonteSize;
  final Function action;

  const TagarelaCardWidget(this.image,
      {Key key,
      this.color = Colors.blue,
      this.title = '',
      this.fonteSize,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: RaisedButton(
        elevation: 1,
        color: color,
        onPressed: action,
        disabledColor: color,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Image.asset(
              image,
              width: MediaQuery.of(context).size.shortestSide * .12,
              height: MediaQuery.of(context).size.shortestSide * .12,
            ),
            Container(
              // height: 43,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: fonteSize,
                  fontFamily: 'Arial Rounded MT Bold Negrito',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
