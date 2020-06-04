/// *Class by* ***Ye Htet Hein***
///
/// Since there is lot of data from api response, not all data included. Please check `json` if your required data is missing.
class ProductItem {
  static String statusPUBLISHED = 'publish';

  static String visibilityVISIBLE = 'visible';

  int id;
  String name;
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

  ProductItem({
    this.name,
    this.id,
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
    this.id = json['id'];
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
      'id': this.id,
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
