import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/product_list_entity.dart';
import 'package:flutter_assignment/network_module/api_response.dart';
import 'package:flutter_assignment/providers/product_list_provider.dart';
import 'package:flutter_assignment/utils/application_ui_manager.dart';
import 'package:flutter_assignment/widget/app_bar/custom_app_bar.dart';
import 'package:flutter_assignment/widget/product_list_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// product list screen
class ProductListPage extends StatefulWidget {
  ProductListPage({Key key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

// product list screen state
class _ProductListState extends State<ProductListPage> {
  // ui manager for manage custom height and width
  ApplicationUIManager _uiManager;

  // build ui
  @override
  Widget build(BuildContext context) {
    _uiManager = ApplicationUIManager(context);
    return Scaffold(
      appBar: AppBarUtil.instance.customAppBar(context, "Product List", descriptionTxt: "1 items"),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
      bottomNavigationBar: buildSortAndFilterView(context),
    );
  }

  // checking api and assigning value
  Widget buildBody(BuildContext context) {
    return Consumer<ProductListProvider>(builder: (context, myModel, child) {
      if (myModel.productList.status == Status.COMPLETED) {
        return buildProductGrid(context, myModel.productList.data);
      } else if (myModel.productList.status == Status.ERROR) {
        return buildStatusView(context, "Error : ${myModel.productList.message}");
      } else {
        return buildStatusView(context, myModel.productList.message.toString());
      }
    });
  }

  // total number of product widget
  Widget buildTotalNumberOfProductView(BuildContext context, List<ProductListEntity> productList){
    return Padding(
      padding: EdgeInsets.only(left: _uiManager.width(context, 10),
          right: _uiManager.width(context, 10), top: _uiManager.height(context, 30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("FIT LINEN SHIRTS",
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.workSans(
                  fontSize: _uiManager.size(context, 14),
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600)),
          Text("+ ${productList.length} Items",
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.workSans(
                  fontSize: _uiManager.size(context, 14),
                  color: Colors.red,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
//sort and filter widget

  Widget buildSortAndFilterView(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      height: _uiManager.height(context, 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: (){
              print("sort button clicked");
            },
            child: Row(
              children: <Widget>[
                Icon(Icons.arrow_downward, color: Colors.grey,),
                Padding(
                  padding:  EdgeInsets.only(left: _uiManager.width(context, 8)),
                  child: Text("SORT",
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.workSans(
                          fontSize: _uiManager.size(context, 16),
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              print("filter button clicked");
            },
            child: Row(
              children: <Widget>[
                Icon(Icons.local_bar, color: Colors.grey,),
                Padding(
                  padding:  EdgeInsets.only(left: _uiManager.width(context, 8)),
                  child: Text("FILTER",
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.workSans(
                          fontSize: _uiManager.size(context, 16),
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

  // product grid widget
  Widget buildProductGrid(
      BuildContext context, List<ProductListEntity> productList) {
    return productList != null && productList.isNotEmpty? Column(
      children: <Widget>[
        buildTotalNumberOfProductView(context, productList),
        GridView.count(
            padding: EdgeInsets.only(top: 20, left: 10),
            childAspectRatio:
                _uiManager.width(context, 156) / _uiManager.height(context, 250),
            crossAxisCount: 2,
            crossAxisSpacing: _uiManager.width(context, 11),
            mainAxisSpacing: _uiManager.height(context, 11),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: List.generate(
              productList.length,
              (index) {
                return ProductListWidget(
                  productListModel: productList[index],
                );
              },
            )),
        SizedBox(height: 10,)
      ],
    ):Container(
      child: Text("No Data Available",
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.workSans(
              fontSize: _uiManager.size(context, 14),
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400)),
    );
  }

  // status widget if getting loading or error
  Widget buildStatusView(BuildContext context, String status){
    return Container(
      padding: EdgeInsets.only(left: _uiManager.width(context, 12), right: _uiManager.width(context, 12)),
        height: _uiManager.height(context, 500),
        child: Center(child:
        Text(status,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.workSans(
                fontSize: _uiManager.size(context, 14),
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400)),
        ));
  }
}
