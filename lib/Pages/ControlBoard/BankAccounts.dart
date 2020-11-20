import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/ControlBoard/ControlBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BankAccounts extends StatefulWidget {
  @override
  _BankAccountsState createState() => _BankAccountsState();
}

class _BankAccountsState extends State<BankAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        padding: EdgeInsets.zero,
        children: [
          // appbar
          CustomAppBar(
            onPressFilter:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ControlBoard())),
            title: 'سداد رسوم الإشتراك',
          ),

          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context , index){
                return bankAccount();
              })
        ],
      ),
    );
  }
  Widget bankAccount(){
    return  Form(
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/logooo.png'),height: 100,),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  // controller: _firsName,
                  decoration: InputDecoration(
                    hintText: 'رقم الحساب',
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
                  // controller: _firsName,
                  decoration: InputDecoration(
                    hintText: 'رقم الأيبان',
                    hintStyle: Styles.loginTextStyle
                        .copyWith(color: Colors.black),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
