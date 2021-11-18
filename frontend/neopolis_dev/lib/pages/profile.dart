import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neopolis_dev/componments/customDialogPopUp.dart';
import 'package:neopolis_dev/componments/keyboard.dart';

import '../constants.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showAddNewOtherWidget = true;
  bool showDeleteWidget = false;
  bool showInfoWidget = false;
  var _shareDescription = false;
  var _shareName = false;
  var isExpanded = true;

  _onExpansionChanged(bool val) {
    setState(() {
      isExpanded = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor, // transparent status bar
        systemNavigationBarColor: kPrimaryColor, // navigation bar color
        statusBarIconBrightness: Brightness.light, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.light, //navigation bar icons' color
      ),
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            // hide keyboard when the button pressed
            KeyboardUtil.hideKeyboard(context);
          },
          child: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: CustomSliverDelegate(
                    expandedHeight: 130,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 20.0),
                        child: Column(
                          children: [
                            /************** general information card **************/
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 0,
                                color: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                        leading: Icon(
                                          Icons.settings,
                                          color: Colors.white,
                                        ),
                                        trailing: Icon(
                                          Icons.expand_less,
                                          color: Colors.white,
                                        ),
                                        title: Text(
                                          'General informations',
                                          style: TextStyle(color: Colors.white),
                                        ))),
                              ),
                            ),
                            /************** full name & description card **************/
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 2,
                                color: kPrimaryLightColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: kPrimaryColor,
                                                width: 5))),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: true,
                                        backgroundColor: kPrimaryLightColor,
                                        title: Text(
                                          'Full name',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                            title: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              child: TextFormField(
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (input) {
                                                  if (input!.isEmpty) {
                                                    return 'Enter your full name';
                                                  }
                                                },
                                                // onChanged: (input) => loginRequestModel.email = input,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  border: UnderlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0),
                                                  ),
                                                  disabledBorder:
                                                      UnderlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0),
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 0.5),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text('Description'),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Divider(
                                                  height: 15,
                                                  thickness: 1.5,
                                                  color: Colors.black54,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  child: Text(
                                                      'This is a personalized message'),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0,
                                                          bottom: 16.0),
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          spreadRadius: -2,
                                                          blurRadius: 20,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.06),
                                                          offset: Offset(0, 0))
                                                    ],
                                                  ),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    maxLines: 4,
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      border:
                                                          UnderlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0),
                                                      ),
                                                      disabledBorder:
                                                          UnderlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0),
                                                      ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide: BorderSide(
                                                            color: Colors.red,
                                                            width: 0.5),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            /************** share my informations card ***************** */
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 2,
                                color: kPrimaryLightColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: kPrimaryColor,
                                                width: 5))),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        backgroundColor: kPrimaryLightColor,
                                        initiallyExpanded: true,
                                        title: Text(
                                          'Share my informations',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        children: <Widget>[
                                          Divider(
                                            height: 2,
                                            thickness: 1.5,
                                            indent: 16.0,
                                            endIndent: 16.0,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            title: Text('Share my name'),
                                            trailing: CupertinoSwitch(
                                              value: _shareName,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _shareName = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _shareName = !_shareName;
                                              });
                                            },
                                          ),
                                          Divider(
                                            color: Colors.black26,
                                            indent: 16.0,
                                            endIndent: 16.0,
                                          ),
                                          ListTile(
                                            title: Text('Share my description'),
                                            trailing: CupertinoSwitch(
                                              value: _shareDescription,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _shareDescription = value;
                                                });
                                              },
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _shareDescription =
                                                    !_shareDescription;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //********** Other informations *********** */
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 2,
                                color: kPrimaryLightColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: kPrimaryColor,
                                                width: 5))),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        backgroundColor: kPrimaryLightColor,
                                        initiallyExpanded: true,
                                        title: Text(
                                          'Other informations',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        children: <Widget>[
                                          Divider(
                                            height: 2,
                                            thickness: 1.5,
                                            indent: 16.0,
                                            endIndent: 16.0,
                                            color: Colors.black54,
                                          ),
                                          //********* Build widget **************** */
                                          buildWidget(),
                                          /************************************************ */
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //********* Button Save **************** */
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              margin: EdgeInsets.symmetric(vertical: 16.0),
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 5))
                                ],
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  backgroundColor: kPrimaryColor,
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CustomDialogBox(
                                          title: "Success !",
                                          descriptions:
                                              "Whatever you did worked \nDoesn't feel that great",
                                          text: "YES",
                                        );
                                      });
                                },
                                child: Text(
                                  'SAVE',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            //************************************** */
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                SliverFillRemaining(
                  child: Container(
                    height: 100.0,
                  ),
                  hasScrollBody: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWidget() {
    if (showInfoWidget) {
      return buildInfoWidget();
    } else if (showDeleteWidget) {
      return buildDeleteWidget();
    } else {
      return buildAddNewOther();
    }
  }

  Widget buildAddNewOther() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      margin: EdgeInsets.symmetric(vertical: 16.0),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              spreadRadius: 0,
              blurRadius: 20,
              color: Colors.black.withOpacity(0.06),
              offset: Offset(0, 0))
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          backgroundColor: Colors.white,
        ),
        onPressed: () {
          setState(() {
            showAddNewOtherWidget = false;
            showInfoWidget = true;
            showDeleteWidget = false;
          });
        },
        child: Text(
          '+ Add new other',
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget buildInfoWidget() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        buildNewBloc('Bloc Label 1', 'This a bref description'),
        Divider(
          color: Colors.black26,
          indent: 16.0,
          endIndent: 16.0,
        ),
        Row(
          children: [
            //********* Button Add new **************** */
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                margin: EdgeInsets.symmetric(vertical: 16.0),
                height: 56,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.06),
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialogBox(
                            title: "Success !",
                            descriptions:
                                "Whatever you did worked \nDoesn't feel that great",
                            text: "YES",
                          );
                        });
                  },
                  child: Text(
                    '+ Add new',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            //************************************** */
            //********* Button delete **************** */
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                margin: EdgeInsets.symmetric(vertical: 16.0),
                height: 56,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.06),
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      showAddNewOtherWidget = false;
                      showInfoWidget = false;
                      showDeleteWidget = true;
                    });
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            //************************************** */
          ],
        ),
      ],
    );
  }

  Widget buildDeleteWidget() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        ListTile(
          title: Text('Bloc Label 1'),
          trailing: Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
        ),
        Divider(
          color: Colors.black26,
          indent: 16.0,
          endIndent: 16.0,
        ),

        ListTile(
          title: Text('Bloc Label 2'),
          trailing: Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
        ),
        Divider(
          color: Colors.black26,
          indent: 16.0,
          endIndent: 16.0,
        ),
        //********* Button done **************** */
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          margin: EdgeInsets.symmetric(vertical: 16.0),
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.06),
                  offset: Offset(0, 0))
            ],
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      title: "Success !",
                      descriptions:
                          "Whatever you did worked \nDoesn't feel that great",
                      text: "YES",
                    );
                  });
              setState(() {
                showAddNewOtherWidget = false;
                showInfoWidget = true;
                showDeleteWidget = false;
              });
            },
            child: Text(
              'Done',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),
        ),
        //************************************** */
      ],
    );
  }

  Widget buildNewBloc(String text, String description) {
    return ExpansionTile(
      backgroundColor: kPrimaryLightColor,
      initiallyExpanded: isExpanded,
      onExpansionChanged: _onExpansionChanged,
      /************************************ */
      title: !isExpanded
          ? Text(
              text,
              style: TextStyle(color: Colors.black),
            )
          : Container(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.red, width: 0.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                ),
              ),
            ),
      /******************************** */
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoSwitch(
            value: isExpanded,
            onChanged: (bool value) {
              setState(() {
                _onExpansionChanged(value);
                isExpanded = value;
              });
            },
          ),
          isExpanded
              ? Icon(
                  Icons.expand_less,
                  color: Colors.black,
                )
              : Icon(
                  Icons.expand_more,
                  color: Colors.black,
                ),
        ],
      ),
      children: <Widget>[
        ListTile(
          title: Divider(
            height: 2,
            thickness: 1.5,
            color: Colors.black26,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 16.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: -2,
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.06),
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  initialValue: description,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.red, width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;
  bool _isImagePicked = false;
  late File _image;

 

  Future _getImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      final File imagefile = File(image!.path);

      _image = imagefile;
      _isImagePicked = true;
      print(_image);
    } catch (e) {
      _pickImageError = e;
    }
  }

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 1.5 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: kPrimaryGradientColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: null,
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {},
              ),
              elevation: 0.0,
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.help_outline_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
              centerTitle: true,
              title: Text(
                'My Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition - 20 : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.08),
                          offset: Offset(0, 0))
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    elevation: 0.0,
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Center(
                              child: Form(
                                key: _formKey,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 4, color: Colors.white),
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: Offset(0, 0))
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          // image: FileImage(_image),
                                          image: _isImagePicked
                                              ? FileImage(_image)
                                              : AssetImage(
                                                      'images/John-Doe.png')
                                                  as ImageProvider,
                                          // onError: (_, __) {
                                          //   return AssetImage('images/default-image.png');
                                          // },
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            print(
                                                'select image button clicked');
                                            _getImage();
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red,
                                            ),
                                            child: Icon(
                                              Icons.photo_camera,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              'Neopolis Development',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
