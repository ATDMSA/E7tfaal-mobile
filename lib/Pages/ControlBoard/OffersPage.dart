import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/ControlBoard/ControlBoard.dart';
import 'package:flutter/material.dart';

import 'BankAccounts.dart';
import 'PayTheSubscriptionFees.dart';

class OffersPage extends StatefulWidget {
  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    CustomAppBar(
                      title: 'الباقات',
                      onPressFilter:()=> Navigator.pop(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 6,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return offersPage();
                          })
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *.4,
                      child: EduButton(
                        title: LocalKeys.NEXT,
                        onPressed: _next,
                        bgColor: AppColors.PurpleColor,
                        cornerRadius: 15,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *.4,
                      child: EduButton(
                        title: 'رجوع',
                        onPressed: _exit,
                        bgColor: AppColors.PurpleColor,
                        cornerRadius: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  void _next() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PayTheSubscriptionFees()));
  }
  void _exit() {
    Navigator.pop(context);
  }
  Widget offersPage(){
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding:EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.YellowColor),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Text('الباقة المجانية ',style: Styles.loginTextStyle.copyWith(
                          color: AppColors.GreyColor,
                          fontSize: 16),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding:EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.YellowColor),
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Text('قيمة الإشتراك',style: Styles.loginTextStyle.copyWith(
                          color: AppColors.GreyColor, fontSize: 16),),
                    ),

                    SizedBox(height: 15,),
                    Container(
                      padding:EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.GreyLightColor),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('SAR 40',style: Styles.loginTextStyle.copyWith(
                          color: AppColors.PurpleColor, fontSize: 21),),
                    ),
                  ],
                ) ),
            Expanded(
                flex: 4,
                child:Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.PurpleColor,width: 15),
                    shape: BoxShape.circle
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('30',style: TextStyle(fontSize: 40,color: AppColors.PurpleColor,fontWeight: FontWeight.bold),),
                        Text('يوم',style: TextStyle(fontSize: 22,color: AppColors.PurpleColor,height: 0.5),),
                      ],
                    ),
                  ),
                ) ),
          ],
        ),
      ),
    );
  }

}
