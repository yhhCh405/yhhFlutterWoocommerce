// Copyright (c) 2020, Ye Htet Hein.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

///The coupons API allows you to create, view, update, and delete individual, or a batch, of coupon codes
class Coupon {
  static const String DiscountType_PERCENT = 'percent';
  static const String DiscountType_FIXED_CART = 'fixed_cart';
  static const String DiscountType_FIXED_PRODUCT = 'fixed_product';

  int _id;
  String _code;
  DateTime _createdDate;
  DateTime _createdDateGMT;
  DateTime _dateModified;
  DateTime _dateModifiedGMT;
  int _usageCount;
  List<dynamic> _usedBy;

  ///The amount of discount. Should always be numeric, even if setting a percentage
  String amount;

  ///Determines the type of discount that will be applied. Options: `Coupon.DiscountType_PERCENT`, `Coupon.DiscountType_FIXED_CART` and `Coupon.DiscountType_FIXED_PRODUCT`. Default is `DiscountType_PERCENT`
  String discountType;

  ///Coupon description
  String description;

  ///The date the coupon expires, in the site's timezone
  DateTime dateExpires;

  ///The date the coupon expires, as GMT
  DateTime dateExpiresGMT;

  ///If `true`, the coupon can only be used individually. Other applied coupons will be removed from the cart. Default is `false`
  bool individualUse;

  ///List of product IDs the coupon can be used on
  List<dynamic> productIDs;

  ///List of product IDs the coupon cannot be used on.
  List<dynamic> excludedProductIDs;

  ///How many times the coupon can be used in total
  int usageLimit;

  ///How many times the coupon can be used per customer
  int usageLimitPerUser;

  ///Max number of items in the cart the coupon can be applied to
  int limitUsageToXItem;

  ///If `true` and if the free shipping method requires a coupon, this coupon will enable free shipping. Default is `false`
  bool freeShipping;

  ///List of category IDs the coupon applies to
  List<dynamic> productCategories;

  ///List of category IDs the coupon does not apply to
  List<dynamic> excludedProductCategories;

  ///If `true`, this coupon will not be applied to items that have sale prices. Default is `false`
  bool excludedSaleItems;

  ///Minimum order amount that needs to be in the cart before coupon applies
  String minimunAmount;

  ///Maximum order amount allowed when using the coupon
  String maximumAmount;

  ///List of email addresses that can use this coupon
  List<dynamic> emailRetrictions;

  ///Meta data
  List<WooMetadata> wooMetadataList = [];

  //getters
  ///Unique identifier for the object
  int get id => this._id;

  ///Coupon code
  String get code => this._code;

  ///The date the coupon was created, in the site's timezone
  DateTime get createdDate => this._createdDate;

  ///The date the coupon was created, as GMT
  DateTime get createdDateGMT => this._createdDateGMT;

  ///The date the coupon was last modified, in the site's timezone
  DateTime get dateModified => this._dateModified;

  ///The date the coupon was last modified, as GMT
  DateTime get dateModifiedGMT => this._dateModifiedGMT;

  ///Number of times the coupon has been used already
  int get usageCount => this._usageCount;

  ///List of user IDs (or guest email addresses) that have used the coupon
  List<dynamic> get usedBy => this._usedBy;

  Coupon({
    this.amount,
    this.dateExpires,
    this.dateExpiresGMT,
    this.description,
    this.discountType,
    this.emailRetrictions,
    this.excludedProductCategories,
    this.excludedProductIDs,
    this.excludedSaleItems,
    this.freeShipping,
    this.individualUse,
    this.limitUsageToXItem,
    this.maximumAmount,
    this.wooMetadataList,
    this.minimunAmount,
    this.productCategories,
    this.productIDs,
    this.usageLimit,
    this.usageLimitPerUser,
  });

  Coupon.fromJSON(dynamic json) {
    this._id = json['id'];
    this._code = json['code'];
    this.amount = json['amount'];
    if (json['date_created'] != null)
      this._createdDate = DateTime.parse(json['date_created']);
    if (json['date_created_gmt'] != null)
      this._createdDateGMT = DateTime.parse(json['date_created_gmt']);
    if (json['date_modified'] != null)
      this._dateModified = DateTime.parse(json['date_modified']);
    if (json['date_modified_gmt'] != null)
      this._dateModifiedGMT = DateTime.parse(json['date_modified_gmt']);
    this.discountType = json['discount_type'];
    this.description = json['description'];
    if (json['date_expires'] != null)
      this.dateExpires = DateTime.parse(json['date_expires']);
    if (json['date_expires_gmt'] != null)
      this.dateExpiresGMT = DateTime.parse(json['date_expires_gmt']);
    this._usageCount = json['usage_count'];
    this.individualUse = json['individual_use'];
    this.productIDs = json['product_ids'];
    this.excludedProductIDs = json['excluded_product_ids'];
    this.usageLimit = json['usage_limit'];
    this.usageLimitPerUser = json['usage_limit_per_user'];
    this.limitUsageToXItem = json['limit_usage_to_x_items'];
    this.freeShipping = json['free_shipping'];
    this.productCategories = json['product_categories'];
    this.excludedProductCategories = json['excluded_product_categories'];
    this.excludedSaleItems = json['exclude_sale_items'];
    this.minimunAmount = json['minimum_amount'];
    this.maximumAmount = json['maximum_amount'];
    this.emailRetrictions = json['email_restrictions'];
    this._usedBy = json['used_by'];
    List<dynamic> _lmtdt = json['meta_data'];
    _lmtdt.forEach((mtdt) {
      wooMetadataList.add(WooMetadata.fromJSON(mtdt));
    });
  }

  Map<String, dynamic> toMap() {
    List<dynamic> _lmtdt = [];
    this.wooMetadataList.forEach((mtdt) {
      _lmtdt.add(mtdt.toMap());
    });

    return {
      // "id": this._id,
      // "code": this._code,
      "amount": this.amount,
      // "date_created": this.createdDate.toIso8601String(),
      // "date_created_gmt": this.createdDateGMT.toIso8601String(),
      // "date_modified": this.dateModified.toIso8601String(),
      // "date_modified_gmt": this.dateModifiedGMT.toIso8601String(),
      "discount_type": this.discountType,
      "description": this.description,
      "date_expires": (this.dateExpires == null)
          ? null
          : this.dateExpires.toIso8601String(),
      "date_expires_gmt": (this.dateExpiresGMT == null)
          ? null
          : this.dateExpiresGMT.toIso8601String(),
      // "usage_count": this.usageCount,
      "individual_use": this.individualUse,
      "product_ids": this.productIDs,
      "excluded_product_ids": this.excludedProductIDs,
      "usage_limit": this.usageLimit,
      "usage_limit_per_user": this.usageLimitPerUser,
      "limit_usage_to_x_items": this.limitUsageToXItem,
      "free_shipping": this.freeShipping,
      "product_categories": this.productCategories,
      "excluded_product_categories": this.excludedProductCategories,
      "exclude_sale_items": this.excludedSaleItems,
      "minimum_amount": this.minimunAmount,
      "maximum_amount": this.maximumAmount,
      "email_restrictions": this.emailRetrictions,
      // "used_by": this.usedBy,
      "meta_data": _lmtdt
    };
  }
}

///The customer API allows you to create, view, update, and delete individual, or a batch, of customers
class Customer {
  int _id;
  DateTime _createdDate;
  DateTime _createdDateGMT;
  DateTime _modifiedDate;
  DateTime _modifiedDateGMT;
  bool _isPayingCustomer;
  String _avatarUrl;
  String _email;
  String _password; //POST only
  String _role;

  ///Customer first name
  String firstName;

  ///Customer last name
  String lastName;

  ///Customer login name
  String userName;

  ///Don't forget to validate form (eg: `email`). Unless you may got error.
  ///List of billing address data
  Billing billing;

  ///List of shipping address data
  Shipping shipping;

  //getters
  ///Unique identifier for the resource
  int get id => this._id;

  ///The date the customer was created, in the site's timezone
  DateTime get createdDate => this._createdDate;

  ///The date the customer was created, as GMT
  DateTime get createdDateGMT => this._createdDateGMT;

  ///The date the customer was last modified, in the site's timezone
  DateTime get modifiedDate => this._modifiedDate;

  ///The date the customer was last modified, as GMT
  DateTime get modifiedDateGMT => this._modifiedDateGMT;

  ///The email address for the customer
  String get email => this._email;

  ///Customer role
  String get role => this._role;

  ///Is the customer a paying customer?
  bool get isPayingCustomer => this._isPayingCustomer;

  ///Avatar URL
  String get avatarUrl => this._avatarUrl;

  //setters

  ///The email address for the customer
  set setEmail(mail) => this._email;

  ///Customer password
  set setPassword(passwd) => this._password = passwd;

  Customer(
      {this.firstName,
      this.lastName,
      this.userName,
      this.billing,
      this.shipping});

  Customer.fromJSON(dynamic json, {bool oldVersion: false}) {
    if (oldVersion) {
      this._id = json['id'];
      this._createdDate = DateTime.parse(json['created_at']);
      this._modifiedDate = DateTime.parse(json['last_update']);
      this._email = json['email'];
      this.firstName = json['first_name'];
      this.lastName = json['last_name'];
      this.userName = json['username'];
      this._role = json['role'];
      this.billing = Billing.fromJSON(json['billing_address']);
      this.shipping = Shipping.fromJSON(json['shipping_address']);
      this._avatarUrl = json['avatar_url'];
    } else {
      this._id = json['id'];
      this._createdDate = DateTime.parse(json['date_created']);
      this._modifiedDate = DateTime.parse(json['date_modified']);
      this._email = json['email'];
      this.firstName = json['first_name'];
      this.lastName = json['last_name'];
      this.userName = json['username'];
      this._role = json['role'];
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
      if (this._email != null) 'email': this._email,
      if (this._password != null) 'password': this._password,
      if (this.billing != null) 'billing': this.billing?.toJson(),
      if (this.shipping != null) 'shipping': this.shipping?.toJson()
    };
  }
}

class Billing {
  ///First name
  String firstName;

  ///Last name
  String lastName;

  ///Company name
  String company;

  ///Address line 1
  String address1;

  ///Address line 2
  String address2;

  ///City name
  String city;

  ///ISO code or name of the state, province or distric
  String state;

  ///Postal code
  String postCode;

  ///ISO code of the country
  String country;

  ///Email address
  String email;

  ///Phone number
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
  ///First name
  String firstName;

  ///Last name
  String lastName;

  ///Company name
  String company;

  ///Address line 1
  String address1;

  ///Address line 2
  String address2;

  ///City name
  String city;

  ///ISO code or name of the state, province or district
  String state;

  ///Postal code
  String postCode;

  ///ISO code of the country
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

class Order {
  static const OrderStatus_PENDING = "pending";
  static const OrderStatus_PROCESSING = "processing";
  static const OrderStatus_ONHOLD = "on-hold";
  static const OrderStatus_COMPLETED = "completed";
  static const OrderStatus_CANCELLED = "cancelled";
  static const OrderStatus_REFUNDED = "refunded";
  static const OrderStatus_FAILED = "failed";
  static const OrderStatus_TRASH = "trash";

  int _id;
  String _number;
  String _orderKey;
  String _createVia;
  String _version;
  DateTime _createdDate;
  DateTime _createdDateGMT;
  DateTime _modifiedDate;
  DateTime _modifiedDateGMT;
  String _totalDiscount;
  String _taxDiscount;
  String _totalShipping;
  String _taxShipping;
  String _taxCart;
  String _total;
  String _totalTax;
  String _priceIncludedTax;
  String _customerIPAddress;
  String _customerUserAgent;
  DateTime _paidDate;
  DateTime _paidDateGMT;
  DateTime _completedDate;
  DateTime _completedDateGMT;
  String _cartHash;
  List<TaxLine> _taxLines;
  List<Refund> _refunds;
  bool _setPaid;

  ///Order status. \
  ///Options: `Order.OrderStatus_PENDING`, \
  ///`Order.OrderStatus_PROCESSING`, \
  ///`Order.OrderStatus_ONHOLD`, \
  ///`Order.OrderStatus_COMPLETED`,\
  ///`Order.OrderStatus_CANCELLED`,\
  ///`Order.OrderStatus_REFUNDED`,\
  ///`Order.OrderStatus_FAILED`,\
  ///`Order.OrderStatus_TRASH`. \
  ///Default is `OrderStatus_PENDING``\
  String status;

  ///Currency the order was created with, in ISO format. \
  ///Options: `AED`, `AFN`, `ALL`, `AMD`, `ANG`, `AOA`, `ARS`, `AUD`, `AWG`, `AZN`, `BAM`, `BBD`, `BDT`, `BGN`, `BHD`, `BIF`, `BMD`, `BND`, `BOB`, `BRL`, `BSD`, `BTC`, `BTN`, `BWP`, `BYR`, `BZD`, `CAD`, `CDF`, `CHF`, `CLP`, `CNY`, `COP`, `CRC`, `CUC`, `CUP`, `CVE`, `CZK`, `DJF`, `DKK`, `DOP`, `DZD`, `EGP`, `ERN`, `ETB`, `EUR`, `FJD`, `FKP`, `GBP`, `GEL`, `GGP`, `GHS`, `GIP`, `GMD`, `GNF`, `GTQ`, `GYD`, `HKD`, `HNL`, `HRK`, `HTG`, `HUF`, `IDR`, `ILS`, `IMP`, `INR`, `IQD`, `IRR`, `IRT`, `ISK`, `JEP`, `JMD`, `JOD`, `JPY`, `KES`, `KGS`, `KHR`, `KMF`, `KPW`, `KRW`, `KWD`, `KYD`, `KZT`, `LAK`, `LBP`, `LKR`, `LRD`, `LSL`, `LYD`, `MAD`, `MDL`, `MGA`, `MKD`, `MMK`, `MNT`, `MOP`, `MRO`, `MUR`, `MVR`, `MWK`, `MXN`, `MYR`, `MZN`, `NAD`, `NGN`, `NIO`, `NOK`, `NPR`, `NZD`, `OMR`, `PAB`, `PEN`, `PGK`, `PHP`, `PKR`, `PLN`, `PRB`, `PYG`, `QAR`, `RON`, `RSD`, `RUB`, `RWF`, `SAR`, `SBD`, `SCR`, `SDG`, `SEK`, `SGD`, `SHP`, `SLL`, `SOS`, `SRD`, `SSP`, `STD`, `SYP`, `SZL`, `THB`, `TJS`, `TMT`, `TND`, `TOP`, `TRY`, `TTD`, `TWD`, `TZS`, `UAH`, `UGX`, `USD`, `UYU`, `UZS`, `VEF`, `VND`, `VUV`, `WST`, `XAF`, `XCD`, `XOF`, `XPF`, `YER`, `ZAR` and `ZMW`. Default is `USD`
  String currency;

  ///Parent order ID
  int parentID;

  ///User ID who owns the order. `0` for guests. Default is `0`
  int customerId;

  ///Note left by customer during checkout
  String customerNote;

  ///Billing address
  Billing billing;

  ///Shipping address
  Shipping shipping;

  ///Payment method ID
  String paymentMethod;

  ///Payment method title
  String paymentMethodTitle;

  ///Unique transaction ID
  String transactionID;

  ///Meta data
  List<WooMetadata> wooMetadataList;

  ///Line items data
  List<LineItem> lineItems;

  ///Shipping lines data
  List<ShippingLine> shippingLines;

  ///Fee lines data
  List<FeeLine> feelines;

  ///Coupons line data
  List<CouponLine> couponLines;

  //getters
  ///Unique identifier for the resource
  int get id => this._id;

  ///Order number
  String get number => this._number;

  ///Order key
  String get orderKey => this._orderKey;

  ///Shows where the order was created
  String get createdVia => this._createVia;

  ///Version of WooCommerce which last updated the order
  String get version => this._version;

  ///The date the order was created, in the site's timezone
  DateTime get createdDate => this._createdDate;

  ///The date the order was created, as GMT
  DateTime get createdDateGMT => this._createdDateGMT;

  ///The date the order was last modified, in the site's timezone
  DateTime get modifiedDate => this._modifiedDate;

  ///The date the order was last modified, as GMT
  DateTime get modifiedDateGMT => this._modifiedDateGMT;

  ///Total discount amount for the order
  String get totalDiscount => this._totalDiscount;

  ///Total discount tax amount for the order
  String get taxDiscount => this._taxDiscount;

  ///Total shipping amount for the order
  String get totalShipping => this._totalShipping;

  ///Total shipping tax amount for the order
  String get taxShipping => this._taxShipping;

  ///Sum of line item taxes only
  String get taxCart => this._taxCart;

  ///Grand total
  String get total => this._total;

  ///Sum of all taxes
  String get totalTax => this._totalTax;

  ///True the prices included tax during checkout
  String get priceIncludedTax => this._priceIncludedTax;

  ///Customer's IP address
  String get customerIPAddress => this._customerIPAddress;

  ///User agent of the customer
  String get customerUserAgent => this._customerUserAgent;

  ///The date the order was paid, in the site's timezone
  DateTime get paidDate => this._paidDate;

  ///The date the order was paid, as GMT
  DateTime get paidDateGMT => this._paidDateGMT;

  ///The date the order was completed, in the site's timezone
  DateTime get completedDate => this._completedDate;

  ///The date the order was completed, as GMT
  DateTime get completedDateGMT => this._completedDateGMT;

  ///MD5 hash of cart items to ensure orders are not modified
  String get cartHash => this._cartHash;

  ///Tax lines data
  List<TaxLine> get taxLines => this._taxLines;

  ///List of refunds
  List<Refund> get refunds => this._refunds;

  //setters
  ///Define if the order is paid. It will set the status to processing and reduce stock items. Default is `false`
  set setPaid(bool isSet) => this._setPaid = isSet;

  Order({
    this.paymentMethod,
    this.shipping,
    this.billing,
    this.customerId,
    this.customerNote,
    this.lineItems,
    this.couponLines,
    this.currency,
    this.feelines,
    this.parentID,
    this.paymentMethodTitle,
    this.shippingLines,
    this.status,
    this.transactionID,
    this.wooMetadataList,
  });

  Order.fromJSON(dynamic json) {
    this._id = json['id'];
    this._number = json['number'];
    this._orderKey = json['order_key'];
    this._createVia = json['created_via'];
    this._version = json['version'];
    this._createdDate = _dtDecode(json['date_created']);
    this._createdDateGMT = _dtDecode(json['date_created_gmt']);
    this._modifiedDate = _dtDecode(json['date_modified']);
    this._modifiedDateGMT = _dtDecode(json['date_modified_gmt']);
    this._totalDiscount = json['discount_total'];
    this._taxDiscount = json['discount_tax'];
    this._totalShipping = json['shipping_total'];
    this._taxShipping = json['shipping_tax'];
    this._taxCart = json['cart_tax'];
    this._total = json['total'];
    this._totalTax = json['total_tax'];
    this._priceIncludedTax = json['prices_include_tax'];
    this._customerIPAddress = json['customer_ip_address'];
    this._customerUserAgent = json['customer_user_agent'];
    this._paidDate = _dtDecode(json['date_paid']);
    this._paidDateGMT = _dtDecode(json['date_paid_gmt']);
    this._completedDate = _dtDecode(json['date_completed']);
    this._completedDateGMT = _dtDecode(json['date_completed_gmt']);
    this._cartHash = json['cart_hash'];

    List<dynamic> _tl = json['tax_lines'];
    _taxLines = _tl.map((_tlIT) => TaxLine.fromJSON(_tlIT)).toList();

    List<dynamic> _ref = json['refunds'];
    _refunds = _ref.map((_refIT) => Refund.fromJSON(_refIT)).toList();

    this.parentID = json['parent_id'];
    this.status = json['status'];
    this.currency = json['currency'];
    this.customerId = json['customer_id'];
    this.customerNote = json['customer_note'];
    this.billing = Billing.fromJSON(json['billing']);
    this.shipping = Shipping.fromJSON(json['shipping']);
    this.paymentMethod = json['payment_method'];
    this.paymentMethodTitle = json['payment_method_title'];
    this.transactionID = json['transaction_id'];

    List<dynamic> _lit = json['line_items'];
    lineItems = _lit.map((lineitem) => LineItem.fromJSON(lineitem)).toList();

    List<dynamic> _mtdt = json['meta_data'];
    wooMetadataList =
        _mtdt.map((_mtdtIT) => WooMetadata.fromJSON(_mtdtIT)).toList();

    List<dynamic> _spl = json['shipping_lines'];
    shippingLines =
        _spl.map((_splIT) => ShippingLine.fromJSON(_splIT)).toList();

    List<dynamic> _feel = json['fee_lines'];
    feelines = _feel.map((_feelIT) => FeeLine.fromJSON(_feelIT)).toList();

    List<dynamic> _cupl = json['coupon_lines'];
    couponLines = _cupl.map((_cuplIT) => CouponLine.fromJSON(_cuplIT)).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'parent_id': this.parentID,
      'status': this.status,
      'currency': this.currency,
      'customer_id': this.customerId,
      'customer_note': this.customerNote,
      'billing': this.billing,
      'shipping': this.shipping,
      'payment_method': this.paymentMethod,
      'payment_method_title': this.paymentMethodTitle,
      'transaction_id': this.transactionID,
      'line_items': this.lineItems.map((e) => e.toJson() as dynamic).toList(),
      'meta_data':
          this.wooMetadataList.map((e) => e.toMap() as dynamic).toList(),
      'shipping_lines':
          this.shippingLines.map((e) => e.toMap() as dynamic).toList(),
      'fee_lines': this.feelines.map((e) => e.toMap() as dynamic).toList(),
      'coupon_lines':
          this.couponLines.map((e) => e.toMap() as dynamic).toList(),
      if (this._setPaid != null) "set_paid": this._setPaid,
    };
  }
}

class LineItem {
  int _id;
  String _subTotalTax;
  String _totalTax;
  List<Taxes> _taxesList = [];
  String _sku;
  String _price;

  ///Product name
  String name;

  ///Product ID
  int productID;

  ///Variation ID, if applicable
  int variationID;

  ///Quantity ordered
  int quantity;

  ///Slug of the tax class of produc
  String taxClass;

  ///Line subtotal (before discounts)
  String subTotal;

  ///Line total (after discounts)
  String total;

  ///Meta data
  List<WooMetadata> metadata = [];

  //getters
  ///Item ID
  int get id => this._id;

  ///Line subtotal tax (before discounts)
  String get subTotalTax => this._subTotalTax;

  ///Line total tax (after discounts)
  String get totalTax => this._totalTax;

  ///Line taxes
  List<Taxes> get taxesList => this._taxesList;

  ///Product SKU
  String get sku => this._sku;

  ///Product price
  String get price => this._price;

  LineItem(
      {this.productID,
      this.quantity,
      this.variationID,
      this.total,
      this.subTotal,
      this.taxClass,
      this.metadata,
      this.name});

  LineItem.fromJSON(dynamic json) {
    this._id = json['id'];
    this._subTotalTax = json['subtotal_tax'];
    this._totalTax = json['total_tax'];
    List<dynamic> _tttl = json['taxes'];
    _tttl.forEach((_ttt) {
      _taxesList.add(Taxes.fromJSON(_ttt));
    });
    this._sku = json['sku'];
    this._price = json['price'];

    this.name = json['name'];
    this.productID = json['product_id'];
    this.quantity = json['quantity'];
    this.variationID = json['variation_id'];
    this.taxClass = json['tax_class'];
    this.subTotal = json['subtotal'];
    this.total = json['total'];
    List<dynamic> _mtdtl = json['meta_data'];
    _mtdtl.forEach((_mtdt) {
      this.metadata.add(WooMetadata.fromJSON(_mtdt));
    });
  }

  Map<String, dynamic> toJson() {
    List<dynamic> mtdtl = [];
    this.metadata.forEach((woometadata) {
      mtdtl.add(woometadata.toMap());
    });
    return {
      'name': this.name,
      'product_id': this.productID,
      'quantity': this.quantity,
      'variation_id': this.variationID,
      'tax_class': this.taxClass,
      'subtotal': this.subTotal,
      'total': this.total,
      'meta_data': mtdtl,
    };
  }
}

class Taxes {
  int _id;
  String _rateCode;
  String _rateID;
  String _label;
  bool _compound;
  String _taxTotal;
  String _shippingTaxTotal;

  ///Meta data
  List<WooMetadata> metadata = [];

  ///Item ID
  int get id => this._id;

  ///Tax rate code
  String get rateCode => this._rateCode;

  ///Tax rate ID
  String get rateID => this._rateID;

  ///Tax rate label
  String get label => this._label;

  ///Show if is a compound tax rate
  bool get compound => this._compound;

  ///Tax total (not including shipping taxes)
  String get taxTotal => this._taxTotal;

  ///Shipping tax total
  String get shippingTaxTotal => this._shippingTaxTotal;

  Taxes({this.metadata});

  Taxes.fromJSON(dynamic json) {
    this._id = json['id'];
    this._rateCode = json['rate_code'];
    this._rateID = json['rate_id'];
    this._label = json['label'];
    this._compound = json['compound'];
    this._taxTotal = json['tax_total'];
    this._shippingTaxTotal = json['shipping_tax_total'];
    List<dynamic> _mtdtl = json['meta_data'];
    _mtdtl.forEach((_mtdt) {
      this.metadata.add(WooMetadata.fromJSON(_mtdt));
    });
  }

  Map<String, dynamic> toMap() {
    List<dynamic> mtdtl = [];
    this.metadata.forEach((woometadata) {
      mtdtl.add(woometadata.toMap());
    });
    return {'meta_data': mtdtl};
  }
}

class TaxLine {
  int _id;
  String _rateCode;
  String _rateID;
  String _label;
  bool _compound;
  String _totalTax;
  String _totalShippingTax;

  ///Meta data
  List<WooMetadata> metadata = [];

  //getters
  ///Item ID
  int get id => this._id;

  ///Tax rate code
  String get rateCode => this._rateCode;

  ///Tax rate ID
  String get rateID => this._rateID;

  ///Tax rate label
  String get label => this._label;

  ///Show if is a compound tax rate
  bool get compound => this._compound;

  ///Tax total (not including shipping taxes)
  String get totalTax => this._totalTax;

  ///Shipping tax total
  String get totalShippingTax => this._totalShippingTax;

  TaxLine({this.metadata});

  TaxLine.fromJSON(dynamic json) {
    this._id = json['id'];
    this._rateCode = json['rate_code'];
    this._rateID = json['rate_id'];
    this._label = json['label'];
    this._compound = json['compound'];
    this._totalTax = json['tax_total'];
    this._totalShippingTax = json['shipping_tax_total'];
    List<dynamic> mtdtl = json['meta_data'];
    mtdtl.forEach((mtdt) {
      this.metadata.add(WooMetadata.fromJSON(mtdt));
    });
  }

  Map<String, dynamic> toJson() {
    List<dynamic> mtdtM = [];
    this.metadata.forEach((mtdt) {
      mtdtM.add(mtdt.toMap());
    });
    return {
      // 'id': this._id,
      // 'rate_code': this._rateCode,
      // 'rateID': this._rateID,
      // 'label': this._label,
      // 'compound': this._compound,
      // 'tax_total': this._totalTax,
      // 'shipping_tax_total': this._totalShippingTax,
      'meta_data': mtdtM,
    };
  }
}

class Refund {
  int _id;
  String _reason;
  String _total;

  //getters
  int get id => this._id;
  String get reason => this._reason;
  String get total => this._total;

  Refund.fromJSON(dynamic json) {
    this._id = json['id'];
    this._reason = json['reason'];
    this._total = json['total'];
  }
}

class ShippingLine {
  int _id;
  String _totalTax;
  List<Taxes> _taxes = [];

  ///Shipping method name
  String methodTitle;

  ///Shipping method ID.
  String methodID;

  ///Line total (after discounts)
  String total;

  ///Meta data
  List<WooMetadata> metadata = [];

  //getters
  ///Item ID
  int get id => this._id;

  ///Line total tax (after discounts)
  String get totalTax => this._totalTax;

  ///Line taxes
  List<Taxes> get taxes => this._taxes;

  ShippingLine({this.metadata, this.methodID, this.methodTitle, this.total});

  ShippingLine.fromJSON(dynamic json) {
    this._id = json['id'];
    this.methodTitle = json['method_title'];
    this.methodID = json['method_id'];
    this.total = json['total'];
    this._totalTax = json['total_tax'];
    List<dynamic> _ttt = json['taxes'];
    _ttt.forEach((tax) {
      _taxes.add(Taxes.fromJSON(tax));
    });
    List<dynamic> _mtdt = json['meta_data'];
    _mtdt.forEach((mt) {
      metadata.add(WooMetadata.fromJSON(mt));
    });
  }

  Map<String, dynamic> toMap() {
    List<dynamic> mtdtM = [];
    this.metadata.forEach((mtdt) {
      mtdtM.add(mtdt.toMap());
    });
    return {
      'method_title': this.methodTitle,
      'method_id': this.methodID,
      'total': this.total,
      'meta_data': mtdtM
    };
  }
}

class FeeLine {
  static const String TaxStatus_TEXABLE = 'taxable';
  static const String TaxStatus_NONE = 'none';

  int _id;
  String _totalTax;
  List<Taxes> _taxes = [];

  ///Fee name
  String name;

  ///Tax class of fee
  String taxClass;

  ///Tax status of fee. \
  ///Options: `FeeLine.TaxStatus_TEXABLE` and `FeeLine.TaxStatus_NONE`
  String taxStatus;

  ///Line total (after discounts)
  String total;

  ///Meta data
  List<WooMetadata> metadata = [];

  //getters
  ///Item ID
  int get id => this._id;

  ///Line total tax (after discounts)
  String get totalTax => this._totalTax;

  ///Line taxes
  List<Taxes> get taxes => this._taxes;

  FeeLine(
      {this.metadata, this.name, this.taxClass, this.total, this.taxStatus});

  FeeLine.fromJSON(dynamic json) {
    this._id = json['id'];
    this._totalTax = json['total_tax'];
    List<dynamic> _taxesDyn = json['taxes'];
    _taxesDyn.forEach((tax) {
      _taxes.add(Taxes.fromJSON(tax));
    });
    this.name = json['name'];
    this.taxClass = json['tax_class'];
    this.taxStatus = json['tax_status'];
    this.total = json['total'];
    List<dynamic> _mtdt = json['meta_data'];
    _mtdt.forEach((mtdtit) {
      metadata.add(WooMetadata.fromJSON(mtdtit));
    });
  }

  Map<String, dynamic> toMap() {
    List<dynamic> mtdtM = [];
    this.metadata.forEach((mtdt) {
      mtdtM.add(mtdt.toMap());
    });
    return {
      'name': this.name,
      'tax_class': this.taxClass,
      'tax_status': this.taxStatus,
      'total': this.total,
      'meta_data': mtdtM,
    };
  }
}

class CouponLine {
  int _id;
  String _discount;
  String _discountTax;

  ///Coupon code
  String code;

  ///Meta data
  List<WooMetadata> metadata;

  //getters
  ///Item ID
  int get id => this._id;

  ///Discount total
  String get discount => this._discount;

  ///Discount total tax
  String get discountTax => this._discountTax;

  CouponLine({this.code, this.metadata});

  CouponLine.fromJSON(dynamic json) {
    this._id = json['id'];
    this._discount = json['discount'];
    this._discountTax = json['discount_tax'];
    this.code = json['code'];
    List<dynamic> mtdtl = json['meta_data'];
    mtdtl.forEach((mtdt) {
      this.metadata.add(WooMetadata.fromJSON(mtdt));
    });
  }

  Map<String, dynamic> toMap() {
    List<dynamic> mtdtM = [];
    this.metadata.forEach((mtdt) {
      mtdtM.add(mtdt.toMap());
    });
    return {
      'code': this.code,
      'meta_data': mtdtM,
    };
  }
}

class ProductItem {
  static String statusPUBLISHED = 'publish';

  static String visibilityVISIBLE = 'visible';

  int _id;

  ///Product name
  String name;

  ///Product slug
  String slug;

  String permaLink;
  DateTime createDate;
  DateTime modifiedDate;
  String type;
  String status;
  bool featured;
  String catalogVisibility;
  String description;
  String shortDescription;
  dynamic sku;
  String price;
  String regularPrice;
  String salePrice;
  DateTime dateOnSaleFrom;
  DateTime dateOnSaleTo;
  bool onSale;
  bool purchasable;
  int totalSales;
  bool virtual;
  bool downloadable;
  List<dynamic> downloads;
  int downloadLimit;
  int downloadExpiry;
  String externalUrl;
  String buttonText;
  String taxStatus;
  String taxClass;
  bool manageStock;
  int stockQuantity;
  bool inStock;
  String backOrders;
  bool backOrdersAllowed;

  ///Call the first arg. Image link is `src`.
  List<Img> images = [];

  //getters
  ///Unique identifier for the resource
  int get id => this._id;

  ProductItem({
    this.name,
    this.price,
    this.description,
    this.inStock,
    this.slug,
    this.createDate,
    this.modifiedDate,
    this.images,
    this.backOrders,
    this.backOrdersAllowed,
    this.buttonText,
    this.catalogVisibility,
    this.dateOnSaleFrom,
    this.dateOnSaleTo,
    this.downloadExpiry,
    this.downloadLimit,
    this.downloadable,
    this.downloads,
    this.externalUrl,
    this.featured,
    this.manageStock,
    this.onSale,
    this.purchasable,
    this.regularPrice,
    this.salePrice,
    this.shortDescription,
    this.sku,
    this.status,
    this.stockQuantity,
    this.taxClass,
    this.taxStatus,
    this.totalSales,
    this.type,
    this.virtual,
    this.permaLink,
  });

  /// Json constructor
  ProductItem.fromJSON(dynamic json) {
    this._id = json['id'];
    this.name = json['name'];
    this.slug = json['slug'];
    this.permaLink = json['permalink'];
    this.createDate = _dtDecode(json['date_created']);
    this.modifiedDate = _dtDecode(json['date_modified']);
    this.type = json['simple'];
    this.status = json['status'];
    this.featured = json['featured'];
    this.catalogVisibility = json['catalog_visibility'];
    this.description = json['description'];
    this.shortDescription = json['short_description'];
    this.sku = json['sku'];
    this.price = json['price'];
    this.regularPrice = json['regular_price'];
    this.salePrice = json['sale_price'];
    this.dateOnSaleFrom = _dtDecode(json['date_on_sale_from']);
    this.dateOnSaleTo = _dtDecode(json['date_on_sale_to']);
    this.onSale = json['on_sale'];
    this.purchasable = json['purchasable'];
    this.totalSales = json['total_sales'];
    this.virtual = json['virtual'];
    this.downloadable = json['downloadable'];
    this.downloads = json['downloads'];
    this.downloadLimit = json['download_limit'];
    this.downloadExpiry = json['download_expiry'];
    this.externalUrl = json['external_url'];
    this.buttonText = json['button_text'];
    this.taxStatus = json['tax_status'];
    this.taxClass = json['tax_class'];
    this.manageStock = json['manage_stock'];
    this.stockQuantity = json['stock_quantity'];
    this.inStock = json['in_stock'];
    this.backOrders = json['backorders'];
    this.backOrdersAllowed = json['backorders_allowed'];
    List<dynamic> _imgls = json['images'];
    _imgls.forEach((img) {
      images.add(Img.fromJSON(img));
    });
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'description': this.description,
      'price': this.price
    };
  }
}

DateTime _dtDecode(String dt) {
  return (dt != null) ? DateTime.parse(dt) : null;
}

class Img {
  int id;
  String name;
  String src;
  DateTime createdDate;
  DateTime modifiedDate;
  String alt;

  Img.fromJSON(dynamic json) {
    this.id = json['id'];
    this.name = json['name'];
    this.alt = json['alt'];
    this.src = json['src'];
    this.createdDate = _dtDecode(json['date_created']);
    this.modifiedDate = _dtDecode(json['date_modified']);
  }
}

class WooMetadata {
  int _id;
  String key;
  String value;

  int get id => this._id;

  WooMetadata({this.key, this.value});

  WooMetadata.fromJSON(dynamic json) {
    this._id = json['id'];
    this.key = json['key'];
    this.value = json['value'];
  }

  Map<String, dynamic> toMap() {
    return {
      // "id": this._id,
      "key": this.key,
      "value": this.value,
    };
  }
}

class WooError {
  String message;
  String code;
  int statusCode;

  WooError({this.message});

  /// Use this class to catch Error
  WooError.fromJSON(dynamic json) {
    this.message = json['message'];
    this.code = json['code'];
    this.statusCode = json['data']['status'];
  }
}

class User {
  String username;
  String password;
  String email;

  User({this.username, this.password, this.email});

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'email': this.email,
      'password': this.password,
    };
  }
}

class WooAuthedUser {
  String token;
  String email;
  String nickname;
  String displayName;

  WooAuthedUser({@required this.email});

  WooAuthedUser.fromJSON(dynamic json) {
    this.token = json['token'];
    this.email = json['user_email'];
    this.nickname = json['user_nicename'];
    this.displayName = json['user_display_name'];
  }
}
