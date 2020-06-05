import 'package:flutter_woocommerce/Modals/order.dart';

///Customer Modal
class Customer {
  int _id;
  DateTime _createdDate;
  DateTime _modifiedDate;
  bool _isPayingCustomer;
  String _avatarUrl;

  String firstName;
  String lastName;
  String userName;
  String email;
  String _password; //POST only
  String role;

  ///Don't forget to validate form (eg: `email`). Unless you may got error.
  Billing billing;
  Shipping shipping;

  //getters
  int get id => this._id;
  DateTime get createdDate => this._createdDate;
  DateTime get modifiedDate => this._modifiedDate;
  bool get isPayingCustomer => this._isPayingCustomer;
  String get avatarUrl => this._avatarUrl;

  //setters
  set password(passwd) => this._password = passwd;

  Customer(
      {this.firstName,
      this.lastName,
      this.userName,
      this.email,
      this.billing,
      this.shipping});

  Customer.fromJSON(dynamic json, {bool oldVersion: false}) {
    if (oldVersion) {
      this._id = json['id'];
      this._createdDate = DateTime.parse(json['created_at']);
      this._modifiedDate = DateTime.parse(json['last_update']);
      this.email = json['email'];
      this.firstName = json['first_name'];
      this.lastName = json['last_name'];
      this.userName = json['username'];
      this.role = json['role'];
      this.billing = Billing.fromJSON(json['billing_address']);
      this.shipping = Shipping.fromJSON(json['shipping_address']);
      this._avatarUrl = json['avatar_url'];
    } else {
      this._id = json['id'];
      this._createdDate = DateTime.parse(json['date_created']);
      this._modifiedDate = DateTime.parse(json['date_modified']);
      this.email = json['email'];
      this.firstName = json['first_name'];
      this.lastName = json['last_name'];
      this.userName = json['username'];
      this.role = json['role'];
      this.billing = Billing.fromJSON(json['billing']);
      this.shipping = Shipping.fromJSON(json['shipping']);
      this._isPayingCustomer = json['is_paying_customer'];
      this._avatarUrl = json['avatar_url'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': this.firstName,
      'last_name': this.lastName,
      'username': this.userName,
      'email': this.email,
      'password': this._password,
      'billing': this.billing?.toJson(),
      'shipping': this.shipping?.toJson()
    };
  }
}
