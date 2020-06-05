class Order {
  int _id;
  // String _number;
  // String _orderKey;
  // String _createVia;
  // String _version;

  int parentID;

  int customerId;
  String customerNote;

  Billing billingAddr;
  Shipping shippingAddr;
  String paymentMethod;

  List<LineItem> lineItems;
  //ADD MORE

  //getters
  int get id => this._id;

  Order(
      {this.paymentMethod,
      this.shippingAddr,
      this.billingAddr,
      this.customerId,
      this.customerNote,
      this.lineItems}) {
    billingAddr = this.billingAddr;

    shippingAddr = this.shippingAddr;

    paymentMethod = this.paymentMethod;
    //ADD MORE
  }

  Order.fromJSON(dynamic json){
    this._id = json['id'];
    this.customerId = json['customer_id'];
    this.customerNote = json['customer_note'];
    this.billingAddr = Billing.fromJSON(json['billing']);
    this.shippingAddr = Shipping.fromJSON(json['shipping']);
    this.paymentMethod = json['payment_method'];
    List<dynamic> lit = json['line_items'];
    lineItems = lit.map((lineitem)=> LineItem.fromJSON(lineitem)).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'customer_id': this.customerId,
      'customer_note': this.customerNote,
      'billing': this.billingAddr,
      'shipping': this.shippingAddr,
      'payment_method': this.paymentMethod,
      'line_items': this.lineItems
    };
  }
}

class LineItem {
  int productID;
  int quantity;
  int variationID;

  LineItem({this.productID, this.quantity, this.variationID});

  LineItem.fromJSON(dynamic json){
    this.productID = json['product_id'];
    this.quantity = json['quantity'];
    this.variationID = json['variation_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': this.productID,
      'quantity': this.quantity,
      if (variationID != null) 'variation_id': this.variationID
    };
  }
}

class Billing {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String postCode;
  String country;
  String email;
  String phone;

  Billing(
      {this.firstName,
      this.lastName,
      this.company,
      this.address1,
      this.address2,
      this.city,
      this.country,
      this.state,
      this.postCode,
      this.email,
      this.phone});

  Billing.fromJSON(dynamic json) {
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.company = json['company'];
    this.address1 = json['address_1'];
    this.address2 = json['address_2'];
    this.city = json['city'];
    this.state = json['state'];
    this.postCode = json['postcode'];
    this.country = json['country'];
    this.email = json['email'];
    this.phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': this.firstName,
      'last_name': this.lastName,
      'company': this.company,
      'address_1': this.address1,
      'address_2': this.address2,
      'city': this.city,
      'state': this.state,
      'postcode': this.postCode,
      'country': this.country,
      'phone': this.phone,
      'email': this.email,
    };
  }
}

class Shipping {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String postCode;
  String country;
  Shipping({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.country,
    this.state,
    this.postCode,
  });

  Shipping.fromJSON(dynamic json) {
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.company = json['company'];
    this.address1 = json['address_1'];
    this.address2 = json['address_2'];
    this.city = json['city'];
    this.state = json['state'];
    this.postCode = json['postcode'];
    this.country = json['country'];
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': this.firstName,
      'last_name': this.lastName,
      'company': this.company,
      'address_1': this.address1,
      'address_2': this.address2,
      'city': this.city,
      'state': this.state,
      'postcode': this.postCode,
      'country': this.country,
    };
  }
}

class MetaData {
  int id;
  String key;
  String value;

  MetaData({this.id, this.key, this.value});
}
