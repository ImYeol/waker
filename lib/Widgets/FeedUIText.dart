  
import 'package:flutter/material.dart';

class DefaultFeedUIText extends StatefulWidget {

  final String title;
  final String subTitle;
  final VoidCallback onPressed;

  DefaultFeedUIText({
    Key key,
    @required this.title,
    @required this.subTitle,
    this.onPressed,
  })
      : super(key: key);

  @override
  _DefaultFeedUITextState createState() => _DefaultFeedUITextState();
}

class _DefaultFeedUITextState extends State<DefaultFeedUIText> {

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${widget.title}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black
                  ),
                ),

                FlatButton(
                  child: Text(
                    "${widget.subTitle}",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: widget.onPressed
                ),
              ],
            );
  }
}