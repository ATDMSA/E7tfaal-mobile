import 'package:celebration/Component/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> with SingleTickerProviderStateMixin {
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
  var rating = 0.0;
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
                 'قيم القاعه',
                  style: TextStyle(fontSize: 20,),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
            RatingBar(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
                SizedBox(
                  height: 20,
                ),
            Divider(thickness: 3,),
            SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,)
               ),
            child: TextField(
              maxLines: 7,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "اكتب رسالتك .....",
                contentPadding: EdgeInsets.all(3)
                 ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
                color: AppColors.YellowColor,
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0))),
            child: FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "قيم",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
