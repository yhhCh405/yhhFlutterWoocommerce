import 'package:example/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/flutter_woocommerce.dart';
import 'package:flutter_woocommerce/flutter_woocommerce_utils.dart';

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
  bool _showLoading = false;

  FlutterWoocommerce flutterWoocommerce = FlutterWoocommerce(
      url: ServerCrends.apiUrl,
      consumerKey: ServerCrends.consumerKey,
      consumerSecret: ServerCrends.consumerSecret);

  createCustomer() async {
    _togggleLoading();
    Customer newCustomer = Customer(
      firstName: "Ma Tin",
      lastName: "Shwe",
      userName: "matinshwe",
    );
    newCustomer.setEmail = "matinshwe@someone.com";
    newCustomer.setPassword = "12345";
    var result =
        await flutterWoocommerce.postReq('customers', newCustomer.toMap());
    _togggleLoading();
    if (result is! WooError) {
      Customer createdCustomer = Customer.fromJSON(result);
      print(createdCustomer.userName + " is created successfully!");
    } else {
      WooError err = result;
      print(err.message);
    }
  }

  fetchAllOrders() async {
    _togggleLoading();
    List<Order> orderList = [];
    var result = await flutterWoocommerce.getReq('orders');
    _togggleLoading();
    if (result is! WooError) {
      List<dynamic> resultList = result;
      resultList.forEach((order) {
        orderList.add(Order.fromJSON(order));
      });

      print(orderList.first.createdVia);
    } else {
      WooError err = result;
      print(err.message);
    }
    print(orderList.length);
  }

  updateProduct() async {
    _togggleLoading();
    ProductItem productItem = ProductItem(regularPrice: "USD 500");
    var result =
        await flutterWoocommerce.putReq('products/57', productItem.toMap());
    _togggleLoading();
    if (result is! WooError) {
      ProductItem createdCustomer = ProductItem.fromJSON(result);
      print(createdCustomer.name + " is updated successfully!");
    } else {
      WooError err = result;
      print(err.message);
    }
  }

  deleteOrder() async {
    _togggleLoading();
    var result = await flutterWoocommerce.deleteReq('orders/27');
    _togggleLoading();
    if (result is! WooError) {
      Order order = Order.fromJSON(result);
      print(order.id.toString() + " is updated successfully!");
    } else {
      WooError err = result;
      print(err.message);
    }
  }

  loginCutomer() async {
    _togggleLoading();
    var result = await flutterWoocommerce
        .customerLogin(User(username: 'matinshwe', password: "12345"));
    _togggleLoading();
    if (result is! WooError) {
      WooAuthedUser wooAuthedUser = result;
      print(wooAuthedUser.displayName);
    } else {
      WooError err = result;
      print(err.message);
    }
  }

  _togggleLoading() {
    if (_showLoading) {
      _showLoading = false;
    } else {
      _showLoading = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Flutter Woocommerce'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //There are various way to integrate. This is just example
            Text(
              'See result in console',
              style: TextStyle(color: Colors.black26),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              padding: EdgeInsets.all(15),
              splashColor: Colors.blue,
              textColor: Colors.blue,
              shape:
                  BeveledRectangleBorder(side: BorderSide(color: Colors.blue)),
              child: _showLoading
                  ? SizedBox(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                      width: 20,
                      height: 20,
                    )
                  : Text(
                      'Run',
                      style: TextStyle(fontSize: 18),
                    ),
              onPressed: _showLoading
                  ? null
                  : () {
                      fetchAllOrders();
                    },
            ),
          ],
        ),
      ),
    );
  }
}
