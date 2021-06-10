import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/main.dart';
import 'package:flutter_assignment/models/product_list_entity.dart';
import 'package:flutter_assignment/utils/application_ui_manager.dart';
import 'package:flutter_assignment/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListWidget extends StatelessWidget {
  final ProductListEntity productListModel;

  ProductListWidget({
    this.productListModel,
  });

  ApplicationUIManager _uiManager;

  @override
  Widget build(BuildContext context) {
    _uiManager = ApplicationUIManager(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          PRODUCT_DETAIL_ROUTE, arguments: productListModel
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: productListModel.imageURL,
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[200],
                  child: Icon(Icons.error_outline),
                  height: _uiManager.height(context, 250),
                  width: _uiManager.width(context, 156),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _uiManager.width(context, 8)),
            child: Text(productListModel.name,
                maxLines: 1,
                softWrap: true,
                style: GoogleFonts.workSans(
                    fontSize: _uiManager.size(context, 12),
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: EdgeInsets.only(top: _uiManager.width(context, 5)),
            child: Text(productListModel.shortDesc,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.workSans(
                    fontSize: _uiManager.size(context, 12),
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: EdgeInsets.only(top: _uiManager.width(context, 5)),
            child: productListModel.discountPrice != null
                ? RichText(
                    text: TextSpan(
                      text: "₹ " + productListModel.origPrice,
                      style: GoogleFonts.workSans(
                          fontSize: _uiManager.size(context, 12),
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                      children: <InlineSpan>[
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: _uiManager.width(context, 5)),
                            child: Text("₹ " + productListModel.discountPrice,
                                style: GoogleFonts.workSans(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: _uiManager.size(context, 10),
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        productListModel.discountPercentage != null?  WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                            margin: EdgeInsets.only(left: _uiManager.width(context, 5)),
                            child: Text(productListModel.discountPercentage + " OFF",
                                style: GoogleFonts.workSans(
                                    fontSize: _uiManager.size(context, 10),
                                    color: Colors.red,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300)),
                          ),
                        ):Container()
                      ],
                    ),
                  )
                : Text("₹ " + "${productListModel.origPrice}",
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.workSans(
                        fontSize: _uiManager.size(context, 12),
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
