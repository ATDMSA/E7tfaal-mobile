import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAlertDialogDone.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Pages/ControlBoard/ControlBoard.dart';
import 'package:celebration/Pages//Drawers/Drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PendingReservations extends StatefulWidget {
  @override
  _PendingReservationsState createState() => _PendingReservationsState();
}

class _PendingReservationsState extends State<PendingReservations> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CustomAppBar(
                title: 'الحجوزات المعلقة',
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
                      return pendingReservations();
                    })
              ),
            ],
          ),
        ));
  }
  Widget pendingReservations(){
    return Padding(
      padding: const EdgeInsets.only(top: 20),
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
                              text: ' معلق ',
                              style: Styles.loginTextStyle.copyWith(
                                  color: AppColors.YellowColor,
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
                      SizedBox(height: 13,),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundColor: AppColors.greenColor,
                            child: Text('قبول'),
                          ),
                          SizedBox(width: 20,),
                          InkWell(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (_) => CustomAlertDialogDone(
                                  mess: 'هل انت متأكد من الغاء الحجز',
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 27,
                              backgroundColor: AppColors.redColor,
                              child: Text('رفض'),
                            ),
                          ),
                        ],
                      )
                     ],
                  ) ),
            ],
         ),
      ),
    );
  }

}
