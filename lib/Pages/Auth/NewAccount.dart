import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAlertDialog.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/Auth/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:celebration/Component/Widget/ProfilePageTextFileds.dart';
import 'package:celebration/Component/Widget/KeyBoardType.dart';
import 'package:provider/provider.dart';
import 'package:celebration/AppState/SelectCountryProvider.dart';
import 'package:celebration/APIS/WebServices.dart';
class NewAccount extends StatefulWidget {
  final String comingFrom;
  NewAccount({this.comingFrom});
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
  String selectedSixAPI = "male";
  String selectedCity = 'مصر';

  bool _validateDOB = false;
  TextEditingController dobContainer = new TextEditingController();
  String dobApi;
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
                        child: ProfilePageTextFiled(
                          controller: _firsName,
                          hint: LocalKeys.FIRST_NAME,
                          keyBoardType: KeyBoard_Type.text,
                        )
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
                        child: ProfilePageTextFiled(
                          controller: _familyName,
                          hint: LocalKeys.FAMILY_NAME,
                          keyBoardType: KeyBoard_Type.text,
                        )

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
                        child:  ProfilePageTextFiled(
                          controller: _phone,
                          hint: LocalKeys.PHONE_NO,
                          keyBoardType: KeyBoard_Type.number,
                        )
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
                        child:
                        ProfilePageTextFiled(
                          controller: _email,
                          hint: LocalKeys.EMAIL,
                          keyBoardType: KeyBoard_Type.text,
                        )

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
                              child: ProfilePageTextFiled(
                                controller: dobContainer,
                                hint: LocalKeys.BIRTH_DATE,
                                keyBoardType: KeyBoard_Type.text,
                                keyboardEnabled: false,
                              )
                            ),
                          ),
                        ),
                      ],
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
                              print("newValue : " + newValue);
                              if (newValue == "انثي") {
                                selectedSixAPI = "female";
                                selectedSix = newValue;
                              } else {
                                selectedSixAPI = "male";
                                selectedSix = newValue;
                              }
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


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () => Provider.of<SelectCountryProvider>(context, listen: false).selectCountryFun(context),
                          child:  Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ProfilePageTextFiled(
                                  controller: Provider.of<SelectCountryProvider>(context, listen: true).countryController,
                                  hint: LocalKeys.CITY,
                                  keyBoardType: KeyBoard_Type.text,
                                  keyboardEnabled: false,
                                )
                            ),
                          ),
                        ),
                      ],
                    ),

//                    Container(
//                      width: MediaQuery.of(context).size.width * 0.85,
//                      decoration: BoxDecoration(
//                          color: Colors.white,
//                          border: Border.all(color: Colors.black),
//                          borderRadius: BorderRadius.circular(10)),
//                      child: Padding(
//                        padding:  EdgeInsets.only(right: 10),
//                        child: DropdownButton<String>(
//                          hint:Text( LocalKeys.CITY),
//                          value: selectedCity,
//                          icon: Padding(
//                            padding: const EdgeInsets.only(left: 13),
//                            child: Icon(Icons.arrow_drop_down, color: Colors.black,),
//                          ),
//                          iconSize: 24,
//                          elevation: 16,
//                          isExpanded: true,
//                          style: Styles.loginTextStyle.copyWith(color: Colors.black),
//                          onChanged: (String newValue) {
//                            setState(() {
//                              selectedCity = newValue;
//                            });
//                          },
//                          underline: Container(),
//                          items: <String>['مصر', 'السعودية']
//                              .map<DropdownMenuItem<String>>((String value) {
//                            return DropdownMenuItem<String>(
//
//                              value: value,
//                              child: Text(value),
//                            );
//                          }).toList(),
//                        ),
//                      ),
//                    ),


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
                        child: ProfilePageTextFiled(
                          controller: _password,
                          hint: LocalKeys.PASSWORD,
                          keyBoardType: KeyBoard_Type.text,
                        )

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
                        child: ProfilePageTextFiled(
                          controller: _newPassword,
                          hint: LocalKeys.PASSWORD_DONE,
                          keyBoardType: KeyBoard_Type.text,
                        )
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

    if (_firsName.text.isEmpty &&_familyName.text.isEmpty &&_phone.text.isEmpty &&_email.text.isEmpty && _password.text.isEmpty && _newPassword.text.isEmpty && dobContainer.text.isEmpty) {
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
    } else if (dobContainer.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess: LocalKeys.ENTER_DOB,
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
      print("start hit end point");
      registFun();
//      Navigator.of(context)
//          .pushReplacement(MaterialPageRoute(builder: (context) => MessWelcome()));
    }
  }

   registFun() {

     WebServices.registerApi(
       firstName: _firsName.text,
       lastName: _familyName.text,
       phone: _phone.text,
       email: _email.text,
       birthDay: dobApi,
       cityId: Provider.of<SelectCountryProvider>(context, listen: false).selectedCountryCode,
       six: selectedSixAPI,
       password: _password.text,
       passwordConfirm: _newPassword.text,
       device: "android",
       token: "111",
       socialId: "123456",
       provider: "facebook"
     ).then((response) {
       print("response : " + json.decode(response.body).toString());
       if (json.decode(response.body)['value'] == true) {

       } else {
         print("errrrrrrrrrrrrrorrrrrrorrrorrorrorrorrorrorrrrorrorrorrorrorrorrorrorrorrrrorrorro");
         print("from error : " + json.decode(response.body)['msg']);
         showDialog(
           context: context,
           builder: (_) => C\ustomAlertDialog(
             mess: json.decode(response.body)['msg'],
           ),
         );
       }

     });
  }
  Future<void> selectDate(BuildContext context, DateTime initialDateTime,
      {DateTime lastDate}) async {
    String format = "dd-MM-yyyy";
//    print("Date : " +  DateFormat(format).format(DateTime.now()).toString());
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    setState(() {
      dobApi = DateFormat(format).format(picked).toString();
      dobContainer.text = picked.toString().substring(0, 10);
//      ZonedDateTime
    });
}
}