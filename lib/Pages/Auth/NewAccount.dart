import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAlertDialog.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/Auth/Login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ForgetPasswordConfirmCode.dart';
import 'MessWelcome.dart';

class NewAccount extends StatefulWidget {
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {

  TextEditingController _firsName = TextEditingController();
  TextEditingController _familyName = TextEditingController();
  TextEditingController _phone = TextEditingController();
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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: AppColors.customGradient,
              image: DecorationImage(
                  image: AssetImage(Resources.FORGET_PASSWORD_BG3_IMAGE),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // appbar

                CustomAppBar(
                  title: LocalKeys.NEW_ACCOUNT,
                  onPressFilter:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage())),
                ),

                SvgPicture.asset(Resources.NEW_ACCOUNT_INFO_IMAGE),
                Expanded(
                  child: new Container(
                      margin:
                      const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Divider(
                       thickness: 1.5,
                        color: AppColors.whiteColor,
                        height: 50,
                      )),
                ),
                SvgPicture.asset(Resources.NEW_ACCOUNT_ICON_PERSON_IMAGE),

                SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: _firsName,
                          decoration: InputDecoration(
                            hintText: LocalKeys.FIRST_NAME,
                            hintStyle: Styles.loginTextStyle
                                .copyWith(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: _familyName,
                          decoration: InputDecoration(
                            hintText: LocalKeys.FAMILY_NAME,
                            hintStyle: Styles.loginTextStyle
                                .copyWith(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: _phone,
                          decoration: InputDecoration(
                            hintText: LocalKeys.PHONE_NO,
                            hintStyle: Styles.loginTextStyle
                                .copyWith(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: _email,
                          decoration: InputDecoration(
                            hintText: LocalKeys.EMAIL,
                            hintStyle: Styles.loginTextStyle
                                .copyWith(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                   /* Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: _six,
                          decoration: InputDecoration(
                            hintText: LocalKeys.SIX,
                            hintStyle: Styles.loginTextStyle
                                .copyWith(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),*/


                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
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
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
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


                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: _password,
                          decoration: InputDecoration(
                            hintText: LocalKeys.PASSWORD,
                            hintStyle: Styles.loginTextStyle
                                .copyWith(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: _newPassword,
                          decoration: InputDecoration(
                            hintText: LocalKeys.PASSWORD_DONE,
                            hintStyle: Styles.loginTextStyle
                                .copyWith(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Transform.scale(
                            scale: 1.0,
                            child: Checkbox(
                              value: isChecked,
                              onChanged: (value){toggleCheckbox(value);},
                              activeColor: AppColors.whiteColor,
                              checkColor:AppColors.PurpleColor,
                              tristate: false,
                            ),
                          ),

                          RichText(
                            text: TextSpan(
                              text: LocalKeys.I_AGREE_TO,
                              style: Styles.loginTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                    text: LocalKeys.TERMS_AND_CONDITIONS,
                                    style: Styles.loginTextStyle.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: 30,
                    ),
                    EduButton(
                      style: Styles.loginTextStyle,
                      title: LocalKeys.REGISTRATION,
                      onPressed: _newAccount,
                      bgColor: AppColors.YellowColor,
                      cornerRadius: 15,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _newAccount() {
    if (_firsName.text.isEmpty &&_familyName.text.isEmpty &&_phone.text.isEmpty &&_email.text.isEmpty &&
         _password.text.isEmpty && _newPassword.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.DATA_REQUERD,
        ),
      );
    } else if (_firsName.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.VALIDATION_FIRST_NAME,
        ),
      );
    } else if (_familyName.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.VALIDATION_FAMILY_NAME,
        ),
      );
    }else if (_phone.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.VALIDATION_PHONE_NO,
        ),
      );
    }else if (_email.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.ENTER_EMAIL,
        ),
      );
    } else if (_password.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.VALIDATION_PASSWORD,
        ),
      );
    } else if (_newPassword.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.VALIDATION_PASSWORD_DONE,
        ),
      );
    }  else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MessWelcome()));
    }
  }

  Future<void> selectDate(BuildContext context, DateTime initialDateTime,
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
}
}
