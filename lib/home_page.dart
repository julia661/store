import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:test_app/models/product.model.dart';
import 'package:test_app/product_item.dart';
import 'package:test_app/store.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      onInit: (store) => store.dispatch(fetchProducts()),
      builder: (_, state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        } else {
          return buildProductList(state.products);
        }
      },
    );
  }

  ListView buildProductList(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItem(product: products[index]);
      },
    );
  }
}
