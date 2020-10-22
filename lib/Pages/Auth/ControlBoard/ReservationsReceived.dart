import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Pages/Auth/ControlBoard/ControlBoard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservationsReceived extends StatefulWidget {
  @override
  _ReservationsReceivedState createState() => _ReservationsReceivedState();
}

class _ReservationsReceivedState extends State<ReservationsReceived> {


  void whatsAppOpen(String number) async {
    var whatsappUrl = "whatsapp://send?phone=" + number;
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print(
        "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }

  showCallOptions(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          child: Text("cancel",style: TextStyle(color: AppColors.blackColor),),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text("call",style: TextStyle(color: AppColors.PurpleColor),),
            onPressed: () => launch("tel:${"+" + '01156087516'}"),
          ),
          CupertinoActionSheetAction(
            child: Text("whatsApp",style: TextStyle(color: AppColors.PurpleColor),),
            onPressed: () => whatsAppOpen('+201156087516'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CustomAppBar(
                title: 'الحجوزات المستلمه',
                onPressFilter:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ControlBoard())),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return pendingReservations(context);
                    }),
              )
            ],
          ),
        ));
  }
  Widget pendingReservations(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        padding:  EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.GreyLightColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 4,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SvgPicture.asset('assets/images/pro.svg'),
                    CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person)
                    ),
                    SizedBox(height: 13,),
                    Text('تركي الحربي',style: Styles.loginTextStyle.copyWith(
                        color: AppColors.PurpleColor,
                        fontWeight: FontWeight.bold,fontSize: 16),),
                    SizedBox(height: 5,),
                    RichText(
                      text: TextSpan(
                        text: 'حالة الطلب :',
                        style: Styles.loginTextStyle.copyWith(
                            color: AppColors.PurpleColor,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'تمت الموافقة ',
                            style: Styles.loginTextStyle.copyWith(
                                color: AppColors.greenColor,
                                fontWeight: FontWeight.bold),
                            // here link
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginToRooms()));
                              },
                          ),
                        ],
                      ),
                    ),

                  ],
                ) ),
            Expanded(
                flex: 4,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('التاريخ :',style: TextStyle(color: AppColors.PurpleColor, fontSize: 12,fontWeight: FontWeight.bold),),
                        Text('15/6/2020',style: TextStyle(color: AppColors.PurpleColor, fontSize: 12),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('الوقت :',style: TextStyle(color: AppColors.PurpleColor, fontSize: 12,fontWeight: FontWeight.bold),),
                        Text('PM 10:30 ',style: TextStyle(color: AppColors.PurpleColor, fontSize: 12),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('رقم الحجز :',style: TextStyle(color: AppColors.PurpleColor, fontSize: 12,fontWeight: FontWeight.bold),),
                        Text('1236541230',style: TextStyle(color: AppColors.PurpleColor, fontSize: 12),),
                      ],
                    ),
                    SizedBox(height: 20,),
                   InkWell(
                     onTap: (){
                       print('fffff');
                       showCallOptions(context);
                       //_launchURL("tel:+201156087516");
                     },
                     child: Row(
                       children: [
                         Text('تواصل مع العميل',style: TextStyle(color: AppColors.PurpleColor, fontSize: 14,fontWeight: FontWeight.bold),),
                         SizedBox(width: 5,),
                       Icon(Icons.call,color: AppColors.PurpleColor,size: 30,),
                       ],
                     ),
                   )
                  ],
                ) ),
          ],
        ),
      ),
    );
  }

}

