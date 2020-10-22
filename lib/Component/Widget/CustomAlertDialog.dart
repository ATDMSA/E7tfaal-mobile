import 'dart:io';
import 'package:celebration/Component/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomAlertDialog extends StatefulWidget {
  String mess;

  @override
  State<StatefulWidget> createState() => CustomAlertDialogState();

  CustomAlertDialog({this.mess});
}

class CustomAlertDialogState extends State<CustomAlertDialog> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
              scale: scaleAnimation, child: _buildDialog(context)),
        ));
  }

  Widget _buildDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      insetAnimationCurve: Curves.easeInOutCubic,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Text(
                  widget.mess,
                  style: TextStyle(fontSize: 16,),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: ()=>Navigator.pop(context),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor:Color(0xffD75A4A) ,
                    child: Icon(Icons.close,color: AppColors.whiteColor,),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
                color: Colors.red,
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0))),
            child: FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "موافق",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
