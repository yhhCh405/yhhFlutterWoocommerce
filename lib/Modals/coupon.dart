//  Written By Ye Htet Hein. 
//  This code is governered by Ye Htet Hein under BSD License.
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
  List<CouponMetadata> metaDataList = [];

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
    this.metaDataList,
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
      metaDataList.add(CouponMetadata.fromJSON(mtdt));
    });
  }

  Map<String, dynamic> toMap() {
    List<dynamic> _lmtdt = [];
    this.metaDataList.forEach((mtdt) {
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
      "date_expires": (this.dateExpires == null) ? null : this.dateExpires.toIso8601String(),
      "date_expires_gmt": (this.dateExpiresGMT == null) ? null : this.dateExpiresGMT.toIso8601String(),
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

class CouponMetadata {
  int _id;
  String key;
  String value;

  int get id => this._id;

  CouponMetadata({this.key, this.value});

  CouponMetadata.fromJSON(dynamic json) {
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
