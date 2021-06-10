import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/product_list_entity.dart';
import 'package:flutter_assignment/utils/application_ui_manager.dart';
import 'package:flutter_assignment/widget/app_bar/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatefulWidget {
  ProductListEntity productListModel;

  ProductDetailPage({this.productListModel});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  ApplicationUIManager _uiManager;

  @override
  Widget build(BuildContext context) {
    _uiManager = ApplicationUIManager(context);

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBarUtil.instance.customAppBar(context, widget.productListModel.name),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildProductTitleAndDis(context),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              height: _uiManager.height(context, 50),
              child: Padding(
                padding: EdgeInsets.only(
                    left: _uiManager.width(context, 16),
                    top: _uiManager.height(context, 18)),
                child: Text(widget.productListModel.longDesc.discountDetails,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.workSans(
                        fontSize: _uiManager.size(context, 14),
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              height: _uiManager.height(context, 50),
              child: Padding(
                padding: EdgeInsets.only(left: _uiManager.width(context, 16)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.refresh),
                    Padding(
                      padding: EdgeInsets.only(
                        left: _uiManager.width(context, 10),
                      ),
                      child: Text(widget.productListModel.longDesc.exchangeDtls,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.workSans(
                              fontSize: _uiManager.size(context, 14),
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildSizeView(context),
            SizedBox(
              height: 20,
            ),
            buildProductDetailsView(context)
          ],
        )));
  }

  Widget buildProductTitleAndDis(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(_uiManager.size(context, 16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: widget.productListModel.name,
                style: GoogleFonts.workSans(
                    fontSize: _uiManager.size(context, 16),
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600),
                children: <InlineSpan>[
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Text(widget.productListModel.shortDesc,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.workSans(
                            fontSize: _uiManager.size(context, 16),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
            buildPriceDetails(context),
            Text("inclusive of all taxes",
                style: GoogleFonts.workSans(
                    fontSize: _uiManager.size(context, 12),
                    color: Colors.green,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }

  //build price detail row
  Widget buildPriceDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _uiManager.width(context, 20)),
      child: widget.productListModel.discountPrice != null
          ? RichText(
              text: TextSpan(
                text: "₹ " + widget.productListModel.origPrice,
                style: GoogleFonts.workSans(
                    fontSize: _uiManager.size(context, 16),
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600),
                children: <InlineSpan>[
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Container(
                      margin:
                          EdgeInsets.only(left: _uiManager.width(context, 5)),
                      child: Text("₹ " + widget.productListModel.discountPrice,
                          style: GoogleFonts.workSans(
                              decoration: TextDecoration.lineThrough,
                              fontSize: _uiManager.size(context, 16),
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  widget.productListModel.discountPercentage != null
                      ? WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: _uiManager.width(context, 5)),
                            child: Text(
                                "(" +
                                    widget.productListModel.discountPercentage +
                                    " OFF)",
                                style: GoogleFonts.workSans(
                                    fontSize: _uiManager.size(context, 14),
                                    color: Colors.red,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300)),
                          ),
                        )
                      : Container()
                ],
              ),
            )
          : Text("₹ " + "${widget.productListModel.origPrice}",
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.workSans(
                  fontSize: _uiManager.size(context, 16),
                  color: Colors.grey,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400)),
    );
  }

  // build product size view
  Widget buildSizeView(BuildContext context) {
    return Container(
      height: _uiManager.height(context, 160),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: _uiManager.width(context, 16),
                right: _uiManager.width(context, 10),
                top: _uiManager.height(context, 20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("SELECT SIZE",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.workSans(
                        fontSize: _uiManager.size(context, 12),
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400)),
                Text("SELECT CHART",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.workSans(
                        fontSize: _uiManager.size(context, 12),
                        color: Colors.red,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: _uiManager.height(context, 8)),
            height: _uiManager.height(context, 60),
            child: widget.productListModel.longDesc.sizeDetails.length > 0 &&
                    widget.productListModel.longDesc.sizeDetails != null
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        widget.productListModel.longDesc.sizeDetails.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        /* decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                    ),*/
                        margin: EdgeInsets.only(left: 10),
                        height: _uiManager.height(context, 50),
                        width: _uiManager.width(context, 50),
                        child: Center(
                          child: Text("40",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.workSans(
                                  fontSize: _uiManager.size(context, 14),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ),
                      );
                    })
                : Container(
                    child: Text("No Size Available",
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.workSans(
                            fontSize: _uiManager.size(context, 14),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600)),
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: _uiManager.width(context, 16),
              top: _uiManager.height(context, 8),
              right: _uiManager.width(context, 16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: _uiManager.width(context, 140),
                  height: _uiManager.height(context, 40),
                  child: OutlineButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border,
                          size: _uiManager.size(context, 20),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: _uiManager.width(context, 5)),
                          child: Text("WISHLIST",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.workSans(
                                  fontSize: _uiManager.size(context, 14),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: _uiManager.width(context, 180),
                  height: _uiManager.height(context, 40),
                  child: RaisedButton(
                    color: Colors.pink,
                    disabledColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_shopping_cart,
                          size: _uiManager.size(context, 20),
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: _uiManager.width(context, 5)),
                          child: Text("ADD TO BAG",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.workSans(
                                  fontSize: _uiManager.size(context, 14),
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildProductDetailsView(BuildContext context) {
    return widget.productListModel.longDesc.details.length > 0 &&
            widget.productListModel.longDesc.details != null
        ? Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  left: _uiManager.width(context, 16),
                  top: _uiManager.height(context, 10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTitleTextWidget("Product Details"),
                  buildDescriptionTextWidget(widget
                      .productListModel.longDesc.details[0].productDetails),
                  SizedBox(
                    height: 10,
                  ),
                  buildTitleTextWidget("Size & Fit"),
                  buildDescriptionTextWidget(widget
                      .productListModel.longDesc.details[0].productDetails),
                  SizedBox(
                    height: 10,
                  ),
                  buildTitleTextWidget("Material & Care"),
                  buildDescriptionTextWidget(
                      "65% linen 35% cotton\nMachine wash"),
                  SizedBox(
                    height: 10,
                  ),
                  buildTitleTextWidget("Style Note"),
                  buildDescriptionTextWidget(
                      "Add this well design shirt from US A shirt is a cloth garment for the upper body (from the neck to the waist). Originally an undergarment worn exclusively by men, it has become, in American English"),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

  // build title text widget
  Widget buildTitleTextWidget(String titleTxt) {
    return Text(titleTxt,
        maxLines: 1,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.workSans(
            fontSize: _uiManager.size(context, 14),
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600));
  }

  // build description text widget
  Widget buildDescriptionTextWidget(String descriptionTxt) {
    return Text(descriptionTxt,
        maxLines: 3,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.workSans(
            fontSize: _uiManager.size(context, 12),
            color: Colors.grey,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400));
  }

}
