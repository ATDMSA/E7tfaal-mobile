import 'package:celebration/Component/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
class ApprovalSendingRequest extends StatefulWidget {
  @override
  _ApprovalSendingRequestState createState() => _ApprovalSendingRequestState();
}

class _ApprovalSendingRequestState extends State<ApprovalSendingRequest>  with SingleTickerProviderStateMixin {
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
          color: Colors.transparent.withOpacity(.7),
          child:
          ScaleTransition(scale: scaleAnimation, child: _buildDialog(context)),
        ));
  }

  Widget _buildDialog(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 0,
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
                CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.whiteColor,
                    child: SvgPicture.asset('assets/images/checkmark.svg')
                ),
                Text(
                  'تمت عملية الإرسال بنجاح',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
              decoration: new BoxDecoration(
                color: Color(0xff4CAF50),
                borderRadius: new BorderRadius.circular(10),
              ),
              child: FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "إنهاء",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 15),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
