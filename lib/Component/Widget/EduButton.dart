import 'package:celebration/Component/Colors.dart';
import 'package:flutter/material.dart';
class EduButton extends StatefulWidget {

  final String title ;
  final Function onPressed;
  final TextStyle style ;
  final double cornerRadius ;
  final Color bgColor , borderColor;

  EduButton({this.title , this.onPressed , this.style , this.bgColor , this.borderColor , this.cornerRadius});


  @override
  _EduButtonState createState() => _EduButtonState();
}

class _EduButtonState extends State<EduButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * .7,
      height: 50,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.cornerRadius ??  8),
          side: BorderSide(color: widget.borderColor ?? Colors.transparent),
        ),
        elevation: 2,
        color: widget.bgColor ?? Colors.white,
        onPressed: widget.onPressed,
        child: Text(widget.title ?? ''  , style: widget.style ?? Styles.loginTextStyle.copyWith(
          color: AppColors.whiteColor,
          fontSize: 13,
        ), textScaleFactor: 1,)
      ),
    );
  }

}