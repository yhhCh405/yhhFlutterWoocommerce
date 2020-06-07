import 'package:example/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/Modals/auth.dart';
import 'package:flutter_woocommerce/Modals/customer.dart';
import 'package:flutter_woocommerce/Modals/error.dart';
import 'package:flutter_woocommerce/Modals/order.dart';
import 'package:flutter_woocommerce/Modals/productitem.dart';
import 'package:flutter_woocommerce/Modals/user.dart';
import 'package:flutter_woocommerce/Modals/coupon.dart';
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

  fetchAllOrders() async {
    List<Order> orderList = [];
    var result = await flutterWoocommerce.getReq('orders');
    if (result is !WooError) {
      List<dynamic> resultList = result;
      resultList.forEach((order) {
        orderList.add(Order.fromJSON(order));
      });
    }else{
      WooError err = result;
      print(err.message);
    }
    print(orderList.length);
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

  loginCutomer() async{
    var result = await flutterWoocommerce.customerLogin(User(username: 'username', password: "12345"));
    if(result is! WooError){
      WooAuthedUser wooAuthedUser = result;
      print(wooAuthedUser.displayName);
    }else{
      WooError err = result;
      print(err.message);
    }
  }
  
  @override
  void initState() {
    super.initState();
    Coupon coupon = Coupon( );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              
            },
          ),
        ),
      ),
    );
  }
}
