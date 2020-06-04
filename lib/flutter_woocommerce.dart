library flutter_woocommerce;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import "dart:core";
import 'package:flutter_woocommerce/Modals/auth.dart';
import 'package:flutter_woocommerce/Modals/customer.dart';
import 'package:flutter_woocommerce/Modals/error.dart';
import 'package:flutter_woocommerce/Modals/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class FlutterWoocommerce {
  String url;
  String consumerKey;
  String consumerSecret;

  FlutterWoocommerce({
    @required String url,
    @required String consumerKey,
    @required String consumerSecret,
  }) {
    this.url = url;
    this.consumerKey = consumerKey;
    this.consumerSecret = consumerSecret;
  }

  String _genUrl(String endPoint) {
    String _fullUrl;
    if (url.endsWith('/')) {
      _fullUrl = url + "wp-json/wc/v3/";
    } else {
      _fullUrl = url + "/wp-json/wc/v3/";
    }

    _fullUrl += endPoint +
        '?consumer_key=' +
        consumerKey +
        '&consumer_secret=' +
        consumerSecret;
    return _fullUrl;
  }

  ///***Make GET Request***
  ///
  ///Usage Example: `getReq('orders')`
  ///
  ///Return *Json* *Object* if **success** and
  ///Return `WooError` if **failed**
  Future<dynamic> getReq(String endPoint) async {
    String url = this._genUrl(endPoint);
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var dataResponse = await json.decode(response.body);

        if (dataResponse['message'] == null) {
          return dataResponse;
        } else {
          return WooError.fromJSON(dataResponse);
        }
      } else {
        return WooError.fromJSON(json);
      }
    } on SocketException {
      throw Exception('No Internet connection.');
    }
  }

  ///***Make POST Request***
  ///
  ///Usage Example: `postReq('orders/27',{"status": "completed"})`
  ///
  ///Return *Json* *Object* if **success** and
  ///Return `WooError` if **failed**
  Future<dynamic> postReq(String endPoint, Map data) async {
    String url = this._genUrl(endPoint);
    http.Client client = http.Client();
    http.Request request = http.Request('POST', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(data);
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);

    if (dataResponse['message'] == null) {
      return dataResponse;
    } else {
      return WooError.fromJSON(dataResponse);
    }
  }

  ///***Update***
  ///
  ///Usage Example: You can update an order like this `putReq('orders/27',{"status": "completed"})`
  ///
  ///Return *Json* *Object* if **success** and
  ///Return `WooError` if **failed**
  Future<dynamic> putReq(String endPoint, Map data) async {
    String url = this._genUrl(endPoint);
    http.Client client = http.Client();
    http.Request request = http.Request('PUT', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(data);
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    if (dataResponse['message'] == null) {
      return dataResponse;
    } else {
      return WooError.fromJSON(dataResponse);
    }
  }

  ///***Delete***
  ///
  ///Usage Example: You can delete an order like this `deleteReq('orders/27')`
  ///
  ///Return *Json* *Object* if **success** and
  ///Return `WooError` if **failed**
  Future<dynamic> deleteReq(String endPoint, {bool force: true}) async {
    String url = this._genUrl(endPoint) + '&force=' + force.toString();

    http.Client client = http.Client();
    http.Request request = http.Request('DELETE', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    if (dataResponse['message'] == null) {
      return dataResponse;
    } else {
      return WooError.fromJSON(dataResponse);
    }
  }

  ///***Create New Customer***
  ///
  ///Sign up new customer.
  ///
  ///Return *Json* *Object* if **success** and
  ///Return `WooError` if **failed**
  Future<dynamic> customerSignUp(User user) async {
    String url = this._genUrl('customers');
    http.Client client = http.Client();
    http.Request request = http.Request('POST', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(user.toMap());
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);
    if (dataResponse['message'] == null) {
      return dataResponse;
    } else {
      return WooError.fromJSON(dataResponse);
    }
  }

  ///*Added by* ***YHH***
  ///
  ///Login customer. Please make sure that you have installed **jwt-auth** plugin in wordpress to use this method.
  ///
  ///return `WooAuthedUser` if **passed**
  ///return `WooError` if **failed**
  ///
  Future<dynamic> customerLogin(User user) async {
    String url = this.url + '/wp-json/jwt-auth/v1/token';

    var response = await http.post(url,
        body: {"username": user.username, "password": user.password});
    var dataResponse = await json.decode(response.body);
    if (dataResponse['message'] != null) {
      return WooError.fromJSON(dataResponse);
    } else {
      return WooAuthedUser.fromJSON(dataResponse);
    }
  }

  ///***Get Customers List***
  ///
  ///List customers
  ///
  ///Return `List<Customer>` if **success** and
  ///Return `WooError` if **failed**
  Future<dynamic> getCustomers() async {
    String url = this._genUrl('customers');
    http.Client client = http.Client();
    http.Request request = http.Request('GET', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    // request.body = json.encode({'username':user.username,});
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);

    if (dataResponse is List<dynamic>) {
      List<dynamic> x = dataResponse;
      List<Customer> result = [];

      for (var customer in x) {
        result.add(Customer.fromJSON(customer));
      }

      return result;
    } else {
      return WooError.fromJSON(dataResponse);
    }
  }

  ///***Modify a customer***
  ///
  ///Update customer
  ///
  ///Return `Customer` if **success** and
  ///Return `WooError` if **failed**
  Future<dynamic> updateCustomer(Customer customer) async {
    String url = this._genUrl('customers/' + customer.id.toString());

    http.Client client = http.Client();
    http.Request request = http.Request('PUT', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(customer.toMap());
    print(request.body);
    String response =
        await client.send(request).then((res) => res.stream.bytesToString());
    var dataResponse = await json.decode(response);

    if (dataResponse['message'] == null) {
      Customer result = Customer.fromJSON(dataResponse);

      return result;
    } else {
      return WooError.fromJSON(dataResponse);
    }
  }

  ///***Modify a customer***
  ///
  ///Update customer
  ///
  ///Return `Customer` if **success** and
  ///Return `WooError` if **failed**
  Future<dynamic> getCustomerByEmail(String email) async {
    String url = this.url +
        '/wc-api/v3/customers/email/' +
        email +
        '?consumer_key=' +
        this.consumerKey +
        '&consumer_secret=' +
        this.consumerSecret;

    var response = await http
        .get(url, headers: {HttpHeaders.contentTypeHeader: "application/json"});
    var dataResponse = await json.decode(response.body);
    print(dataResponse);
    if (dataResponse['message'] != null) {
      return WooError.fromJSON(dataResponse);
    } else {
      return Customer.fromJSON(dataResponse['customer'], oldVersion: true);
    }
  }
}
