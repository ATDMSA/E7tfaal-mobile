import 'dart:async';
import 'dart:convert';
import 'package:celebration/APIS/WebServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Component/Colors.dart';
class SelectAreas extends StatefulWidget {
  @override
  _SelectAreasState createState() => _SelectAreasState();
}

class _SelectAreasState extends State<SelectAreas> {
  int _categoryIndex;
  bool _isSearching;
  String _searchText = "";
  var countiesResult = [];
  var areasResult = [];

  bool isLoading = false;


  int countryId;
  String countryCode;
  String countryName;
  var countries = [];

  final TextEditingController _searchQuery = new TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  _SelectAreasState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries();
    countryName = '';
    countryId = null;
    countryCode = '';
  }

  void getCountries() {
    setState(() => isLoading = true);
    WebServices.getCountries(scaffoldKey: scaffoldKey).then((response) {
      print(response.body);
      var boolValue = json.decode(response.body)['value'];
      if (boolValue == true ) {
        setState(() {
          countries = json.decode(response.body)['data'];
          print(countries);
          isLoading = false;
        });
      } else {

      }

    }).catchError((e) {
      if (e.toString().contains("SocketException")) {
      //  showAlertMessage(Constants.NETWORK_CONNECTION_ERROR_MESSAGE, scaffoldKey.currentContext, AppColors.errorColor);
      }
      print(e.toString());
      return null;
    }).whenComplete(() {
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  searchField(),
                  _isSearching == true ? searchResultBody() : countriesListBody(),
                ],
              ),
            ),
          )),
    );
  }

  Widget appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        "إختر الدوله",
        style: TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 22, left: 10),
//          child: InkWell(onTap: () => Navigator.pop(context),child: Text("DrawerContent.cancel", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 15, fontWeight: FontWeight.bold),).tr()),
        )
      ],
    );
  }

  Widget searchField() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: TextField(
            onChanged: onSearchTextChanged,
            controller: _searchQuery,
            cursorColor: Theme.of(context).cardColor,
            decoration: InputDecoration(
                suffixIcon: _searchQuery.text.isNotEmpty
                    ? GestureDetector(
                  onTap: () {
                    // This is not working. Exception - invalid text selection: TextSelection(baseOffset: 2, extentOffset: 2, affinity: TextAffinity.upstream, isDirectional: false)
                    WidgetsBinding.instance.addPostFrameCallback(
                            (_) => _searchQuery.clear());
                  },
                  child: Icon(
                    Icons.cancel,
                    color: Theme.of(context).primaryColor,
                  ),
                )
                    : null,
//              suffixIcon: _isSearching == true ? IconButton(icon: Icon(Icons.cancel), onPressed: () => _handleSearchEnd()) : Container(),
                hintText: "ادخل المنطقه هنا",
                hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                prefixIcon: Material(
                  elevation: 0.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
          ),
        ),
      ),
    );
  }

  Widget buildList(List data, BuildContext context, index) {
    bool isSelected = _categoryIndex == index;
    return Column(
      children: <Widget>[
        Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              gradient: new LinearGradient(
                  colors: [Colors.transparent, Colors.transparent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            height: 40.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: isSelected
                        ? Container(
                      width: 25.0,
                      height: 25.0,
                      child: Icon(
                        Icons.check,
                        color: Theme.of(context).cardColor,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(50.0)),
                          color: Theme.of(context).primaryColor),
                    )
                        : Container(),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    countries[index]['name'],
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            )),
        Divider(
          color: Colors.grey[500],
        )
      ],
    );
  }

//
  Widget buildSearchResultList(BuildContext context, index) {
    bool isSelected = _categoryIndex == index;
    return Column(
      children: <Widget>[
        Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              gradient: new LinearGradient(
                  colors: [Colors.transparent, Colors.transparent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            height: 40.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: isSelected
                        ? Container(
                      width: 25.0,
                      height: 25.0,
                      child: Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(50.0)),
                          color: Theme.of(context).cardColor),
                    )
                        : Container(),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    areasResult[index]['name'],
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            )),
        Divider(
          color: Colors.grey[500],
        )
      ],
    );
  }

  Widget searchResultBody() {
    return Container(
      padding: EdgeInsets.only(top: 60.0),
      child: ListView.builder(
        itemCount: areasResult.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              child: buildSearchResultList(context, index),
              onTap: () {
                setState(() {
                  _categoryIndex = index;
                  countryId = areasResult[index]['id'];
                  countryName = areasResult[index]['name'];
                });

                startTime();
              });
        },
      ),
    );
  }

  Widget countriesListBody() {
    return isLoading != true
        ? Container(
      padding: EdgeInsets.only(top: 60.0),
      child: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              child: buildList(countries, context, index),
              onTap: () {
                setState(() {
                  _categoryIndex = index;
                  countryId = countries[index]['id'];
                  countryName = countries[index]['name'];
                });

                startTime();
              });
        },
      ),
    )
        : Center(
      child: CircularProgressIndicator(
          strokeWidth: 1,
          backgroundColor: AppColors.YellowColor),
    );
  }

  startTime() async {
    return new Timer(Duration(milliseconds: 400), navigatorPage);
  }

  void navigatorPage() {
    Navigator.pop(context, [countryId, countryName]);
  }

  onSearchTextChanged(String text) async {
    areasResult.clear();
    _handleSearchStart();

    if (text.isEmpty) {
      _handleSearchEnd();
      areasResult.cast();
      setState(() {});
      return;
    }

    for (int i = 0; i < countries.length; i++) {
      if (countries[i]['name'].toString().toLowerCase().contains(text)) {
        areasResult.add(countries[i]);
      }
    }

    setState(() {});
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      _isSearching = false;

      _searchQuery.clear();
    });
  }
}