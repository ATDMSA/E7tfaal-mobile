import 'package:cached_network_image/cached_network_image.dart';
import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';

import 'package:celebration/Pages/Auth/Drawers/Drawer.dart';

import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectIndex;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _newPassword = TextEditingController();

  String selectedSix = 'ذكر';
  String selectedCity = 'مصر';

  bool _validateDOB = false;
  TextEditingController dobContainer = new TextEditingController();


  bool isChecked = false;
  var resultHolder = 'Checkbox is UN-CHECKED';

  bool toggleCheckbox(bool value) {
    if(isChecked == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        resultHolder = 'Checkbox is CHECKED';
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        resultHolder = 'Checkbox is UN-CHECKED';
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        drawer: AppDrawer(),
        body: Center(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.YellowColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image(
                              image: AssetImage(Resources.PROFILE_BG),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment:Alignment.bottomLeft,
                                    children: [
                                      Avatar(),
                                      CircleAvatar(
                                        radius: 20,
                                          backgroundColor: AppColors.YellowColor,
                                          child: Icon(Icons.camera_alt,size: 30,color: AppColors.whiteColor,)),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                    'تركي الحربي',
                                    style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomAppBar(
                    title: 'الملف الشخصى',
                    onPressFilter:()=> Navigator.pop(context),
                  ),
                ],
              ),

              Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              ),
                          child: TextField(
                            style: Styles.loginTextStyle,
                            controller: _email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.PurpleColor,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.GreyLightColor,),
                              ),
                                hintText: "رقم الإشتراك",
                                hintStyle: Styles.loginTextStyle.copyWith(color: AppColors.blackColor),
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: Styles.loginTextStyle,
                            controller: _email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.PurpleColor,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.GreyLightColor,),
                              ),
                              hintText: "البريد الإلكترونى",
                              hintStyle: Styles.loginTextStyle.copyWith(color: AppColors.blackColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            style: Styles.loginTextStyle,
                          //  controller: _email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.PurpleColor,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.GreyLightColor,),
                              ),
                              hintText: "رقم الجوال",
                              hintStyle: Styles.loginTextStyle.copyWith(color: AppColors.blackColor),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            style: Styles.loginTextStyle,
                            //  controller: _email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.PurpleColor,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.GreyLightColor,),
                              ),
                              hintText: "تاريخ الميلاد",
                              hintStyle: Styles.loginTextStyle.copyWith(color: AppColors.blackColor),
                            ),
                          ),
                        ),
                      ),
                     /* Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () => selectDate(context, DateTime.now()),
                            child:  Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  enabled: false,
                                  controller: dobContainer,
                                  decoration: InputDecoration(
                                    hintText: LocalKeys.BIRTH_DATE,
                                    hintStyle: Styles.loginTextStyle
                                        .copyWith(color: Colors.black),
                                    border: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _validateDOB == true
                              ? Text(
                            "برجاء ادخال تاريخ الميلاد",
                            style: TextStyle(color: AppColors.PurpleColor),
                          )
                              : Container()
                        ],
                      ),*/

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.GreyLightColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:  EdgeInsets.only(right: 10),
                            child: DropdownButton<String>(
                              hint:Text( LocalKeys.CITY),
                              value: selectedSix,
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 13),
                                child: Icon(Icons.arrow_drop_down, color: Colors.black,),
                              ),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              style: Styles.loginTextStyle.copyWith(color: Colors.black),
                              onChanged: (String newValue) {
                                setState(() {
                                  selectedSix = newValue;
                                });
                              },
                              underline: Container(),
                              items: <String>['ذكر', 'انثي']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(

                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.GreyLightColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:  EdgeInsets.only(right: 10),
                            child: DropdownButton<String>(
                              hint:Text( LocalKeys.CITY),
                              value: selectedCity,
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 13),
                                child: Icon(Icons.arrow_drop_down, color: Colors.black,),
                              ),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              style: Styles.loginTextStyle.copyWith(color: Colors.black),
                              onChanged: (String newValue) {
                                setState(() {
                                  selectedCity = newValue;
                                });
                              },
                              underline: Container(),
                              items: <String>['مصر', 'السعودية']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(

                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextField(
                            style: Styles.loginTextStyle,
                          //  controller: _email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.PurpleColor,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: AppColors.GreyLightColor,),
                              ),
                              hintText: "كلمة  المرور",
                              hintStyle: Styles.loginTextStyle.copyWith(color: AppColors.blackColor),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),
                      Text('تغير كلمة المرور',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.PurpleColor),),
                    ],
                  ))
            ],
          ),
        ));
  }
}
class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xffe3e3e3),
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 3.0, //extend the shadow
                offset: Offset(
                  1.0, // Move to right 10  horizontally
                  1.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          height: 120,
          width: 120,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
            "https://images.assetsdelivery.com/compings_v2/4zevar/4zevar1604/4zevar160400009.jpg",
            placeholder: (context, url) => Center(
                child: SizedBox(
                    height: 60,
                    width: 60,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      backgroundColor: AppColors.PurpleColor,
                    ))),
            //  errorWidget: (context, url, error) => Icon(Icons.error),
          )),
    );
  }

 /* Future<void> selectDate(BuildContext context, DateTime initialDateTime,
      {DateTime lastDate}) async {
    String format = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
//    print("Date : " +  DateFormat(format).format(DateTime.now()).toString());
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDateTime,
        firstDate: DateTime(1970),
        lastDate: DateTime(2101));
    setState(() {
      // dateAPI = DateFormat(format).format(picked);
      dobContainer.text = picked.toString().substring(0, 10);
      //  print("dateAPI : " +  dateAPI.toString());
//      ZonedDateTime
    });
  }*/
}