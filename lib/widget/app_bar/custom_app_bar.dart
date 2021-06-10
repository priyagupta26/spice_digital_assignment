import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/application_ui_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarUtil {
  AppBarUtil._privateConstructor();

  static final AppBarUtil _instance = AppBarUtil._privateConstructor();

  static AppBarUtil get instance {
    return _instance;
  }

  ApplicationUIManager _uiManager;

  AppBar customAppBar(BuildContext context, String text, {String descriptionTxt}) {
    _uiManager = ApplicationUIManager(context);
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: Colors.white,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(text,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.workSans(
                  fontSize: _uiManager.size(context, 14),
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400)),
          descriptionTxt != null && descriptionTxt.isNotEmpty? Text(descriptionTxt,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.workSans(
                  fontSize: _uiManager.size(context, 14),
                  color: Colors.grey,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400)):Container(),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5, right: 5),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.black,
                onPressed: () {}),
          ),
          Positioned(
              top: 6,
              right: 6,
              child: Container(
                height: 20.0,
                width: 20.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                ),
                child: Text("3",
                    style: GoogleFonts.workSans(
                        fontSize: _uiManager.size(context, 14.0),
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400)),
              ))
        ])
      ],
    );
  }
}
