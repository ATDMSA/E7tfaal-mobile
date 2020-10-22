import 'dart:io';

import 'package:celebration/Component/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageWidget extends StatefulWidget {
  final bool imageValidation;
  File imageFile;
  final String title;
  final VoidCallback onPressed;
  ImageWidget(
      {this.imageValidation, this.imageFile, this.title, this.onPressed});
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: widget.imageValidation == false
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).errorColor),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.PurpleColor),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: widget.imageFile != null
                        ? Stack(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:  MediaQuery.of(context).size.height,
                                  child: Image.file(widget.imageFile,
                                      fit: BoxFit.cover)),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  child:
                                      Icon(Icons.cancel, color: Colors.white),
                                  onTap: () {
                                    setState(() {
                                      widget.imageFile = null;
                                    });
                                  },
                                ),
                              )
                            ],
                          )
                        : Container(),
                  ),
                ),
                Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: widget.imageValidation == false
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).errorColor),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.transparent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  SvgPicture.asset('assets/images/ic_backup.svg'),

                        IconButton(
                            icon: widget.imageFile == null
                                ? CircleAvatar(
                              backgroundColor: AppColors.whiteColor,

                                child: Icon(Icons.arrow_upward,color: AppColors.PurpleColor,size: 22,))
                                : Icon(null),
                            onPressed: widget.onPressed
//                        onPressed: () => _chooseImageDialog(context, "idFaceImg")
                            ),
                        FittedBox(
                            child: widget.imageFile == null
                                ? Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.whiteColor,fontSize: 12),),
                                )
                                : Text(''))
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 7,
            ),
          ],
        ));
  }
}
