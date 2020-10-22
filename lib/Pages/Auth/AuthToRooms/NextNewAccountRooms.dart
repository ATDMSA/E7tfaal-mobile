import 'dart:io';

import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAlertDialog.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Component/Widget/ImageWidget.dart';
import 'package:celebration/Pages/Auth/ControlBoard/ControlBoard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class NextNewAccountRooms extends StatefulWidget {
  @override
  _NextNewAccountRoomsState createState() => _NextNewAccountRoomsState();
}

class _NextNewAccountRoomsState extends State<NextNewAccountRooms> {

  File imageFile;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
                  image: AssetImage(Resources.FORGET_PASSWORD_BG_IMAGE),
                  fit: BoxFit.fitHeight),
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
                ),


            GridView.count(
             // primary: true,
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              children: List.generate(12, (index) {
                return ImageWidget(
                  imageFile: imageFile,
                  title: 'صورة مدخل قسم الرجال',
                  imageValidation: false,
                  onPressed: () => chooseImageDialog(context, "idFaceImg"),
//                    onPressed: () => selectImageProvider.chooseImageDialog(widget.scaffoldKey.currentContext, "idFaceImg"),
                );
              }),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: EduButton(
                    style: Styles.loginTextStyle,
                    title: LocalKeys.REGISTRATION,
                    onPressed: _newAccount,
                    bgColor: AppColors.YellowColor,
                    cornerRadius: 15,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget changeImageIcon() {
    return Padding(
        padding: EdgeInsets.only(top: 90.0, right: 100.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircleAvatar(
              backgroundColor: Color(0xffD9401C),
              radius: 25.0,
              child: new Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            )
          ],
        ));
  }

  Future<void> chooseImageDialog(BuildContext customContext, String imageType) async {
    return showCupertinoModalPopup<void>(
      context: customContext,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('اختار الصوره',style: TextStyle(color: AppColors.blackColor),),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('الاستوديو',style: TextStyle(color: AppColors.PurpleColor),),
              onPressed: () {
                _openImageSource(
                    context: customContext,
                    imageSource: ImageSource.gallery,
                    imageType: imageType);
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: Text('الكاميرا',style: TextStyle(color: AppColors.PurpleColor),),
              onPressed: () {
                _openImageSource(
                    context: customContext,
                    imageSource: ImageSource.camera,
                    imageType: imageType);
                Navigator.pop(context);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text('انهاء',style: TextStyle(color: AppColors.blackColor),),
            onPressed: () => Navigator.pop(context),
          ),
        );
      },
    );
  }

  _openImageSource({BuildContext context, ImageSource imageSource, String imageType}) async {
   // requestPermission(Permission.storage).then((value)  async {
      if (imageType == "idFaceImg") {
       setState(() async {
         imageFile = await ImagePicker.pickImage(source: imageSource, imageQuality: 50);
         saveImage(imageFile,imageType);
       });

      }
    //});
  }
  saveImage(var picture, String imageType) {
    if (imageType == "idFaceImg") {setState(() {
      imageFile = picture;
    });}
  }

  void _newAccount(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ControlBoard()));
  }

}
