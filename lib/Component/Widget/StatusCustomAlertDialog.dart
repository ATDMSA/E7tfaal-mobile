import 'package:celebration/Pages/AuthToRooms/NextNewAccountRooms.dart';
import 'package:flutter/material.dart';
import 'package:celebration/Component/Colors.dart';
class StatusCustomAlertDialog extends StatefulWidget {
  final String mess;
  StatusCustomAlertDialog({this.mess});
  @override
  _StatusCustomAlertDialogState createState() => _StatusCustomAlertDialogState();
}

class _StatusCustomAlertDialogState extends State<StatusCustomAlertDialog> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

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
              ],
            ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .35,
                  decoration: new BoxDecoration(
                    color: Color(0xffD75A4A),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "تراجع",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .35,
                  decoration: new BoxDecoration(
                    color: AppColors.YellowColor,
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NextNewAccountRooms(),));
                      },
                      child: Text(
                        "موافق",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}