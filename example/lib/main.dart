import 'package:example/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/Modals/customer.dart';
import 'package:flutter_woocommerce/Modals/error.dart';
import 'package:flutter_woocommerce/Modals/order.dart';
import 'package:flutter_woocommerce/Modals/productitem.dart';
import 'package:flutter_woocommerce/flutter_woocommerce.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  FlutterWoocommerce flutterWoocommerce = FlutterWoocommerce(
      url: ServerCrends.apiUrl,
      consumerKey: ServerCrends.consumerKey,
      consumerSecret: ServerCrends.consumerSecret);

  createCustomer() async {
    Customer newCustomer = Customer(
        firstName: "Ma Tin",
        lastName: "Shwe",
        userName: "matinshwe",
        email: "matinshwe@someone.com");
    newCustomer.password = "12345";
    var result =
        await flutterWoocommerce.postReq('customers', newCustomer.toMap());
    if (result is! WooError) {
      Customer createdCustomer = Customer.fromJSON(result);
      print(createdCustomer.userName + " is created successfully!");
    } else {
      WooError err = result;
      print(err.message);
    }
  }

  updateProduct() async {
    ProductItem productItem = ProductItem(regularPrice: "USD 500");
    var result =
        await flutterWoocommerce.putReq('products/57', productItem.toMap());
    if (result is! WooError) {
      ProductItem createdCustomer = ProductItem.fromJSON(result);
      print(createdCustomer.name + " is updated successfully!");
    } else {
      WooError err = result;
      print(err.message);
    }
  }

  deleteOrder() async {
    var result = await flutterWoocommerce.deleteReq('orders/27');
    if (result is! WooError) {
      Order order = Order.fromJSON(result);
      print(order.id.toString() + " is updated successfully!");
    } else {
      WooError err = result;
      print(err.message);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              deleteOrder();
            },
          ),
        ),
      ),
    );
  }
}
