import 'package:flutter/material.dart';
import 'package:flutter_assignment/providers/product_list_provider.dart';
import 'package:flutter_assignment/routes.dart';
import 'package:flutter_assignment/views/productListPage/product_list_page.dart';
import 'package:flutter_assignment/views/productDetailPage/product_detail_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductListProvider>(
            create: (context) => ProductListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PRODUCT_ROUTE,
        routes: {
          '/': (context) => ProductListPage(),
          '/product_detail_screen': (context) => ProductDetailPage(
                productListModel: ModalRoute.of(context).settings.arguments,
              ),
        },
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        /*home: HomePage()*/
      ),
    );
  }
}

