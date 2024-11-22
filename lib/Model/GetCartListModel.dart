class GetCartListModel {
  List<CartList>? data;
  Settings? settings;

  GetCartListModel({this.data, this.settings});

  GetCartListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CartList>[];
      json['data'].forEach((v) {
        data!.add(new CartList.fromJson(v));
      });
    }
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class CartList {
  String? id;
  Product? product;
  int? quantity;
  double? totalAmount; // Change to double to handle possible decimal values

  CartList({this.id, this.product, this.quantity, this.totalAmount});

  CartList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    totalAmount = (json['total_amount'] is int)
        ? json['total_amount'].toDouble() // Handle conversion from int to double
        : json['total_amount'];  // If it's already a double, keep it as is
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? subName;
  String? manufactureCompany;
  String? image;
  double? margin; // Change to double to handle decimal values
  int? quantity;
  String? productForm;
  dynamic rating;
  bool? isBlocked;
  bool? bestSeller;
  String? medicineCategory;
  String? usagePurpose;
  String? healthSegment;
  double? mrp; // Change to double to handle decimal values
  double? netPrice; // Change to double to handle decimal values
  double? ptr; // Change to double to handle decimal values
  bool? isInWishlist;

  Product({
    this.id,
    this.name,
    this.subName,
    this.manufactureCompany,
    this.image,
    this.margin,
    this.quantity,
    this.productForm,
    this.rating,
    this.isBlocked,
    this.bestSeller,
    this.medicineCategory,
    this.usagePurpose,
    this.healthSegment,
    this.mrp,
    this.netPrice,
    this.ptr,
    this.isInWishlist,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subName = json['sub_name'];
    manufactureCompany = json['manufacture_company'];
    image = json['image'];
    margin = (json['margin'] is int)
        ? json['margin'].toDouble()
        : json['margin'];  // Convert margin to double if it's an int
    quantity = json['quantity'];
    productForm = json['product_form'];
    rating = json['rating'];
    isBlocked = json['is_blocked'];
    bestSeller = json['best_seller'];
    medicineCategory = json['medicine_category'];
    usagePurpose = json['usage_purpose'];
    healthSegment = json['health_segment'];
    mrp = (json['mrp'] is String) ? double.tryParse(json['mrp']!) : json['mrp']; // Parse if string
    netPrice = (json['net_price'] is String) ? double.tryParse(json['net_price']!) : json['net_price']; // Parse if string
    ptr = (json['ptr'] is String) ? double.tryParse(json['ptr']!) : json['ptr']; // Parse if string
    isInWishlist = json['is_in_wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sub_name'] = this.subName;
    data['manufacture_company'] = this.manufactureCompany;
    data['image'] = this.image;
    data['margin'] = this.margin;
    data['quantity'] = this.quantity;
    data['product_form'] = this.productForm;
    data['rating'] = this.rating;
    data['is_blocked'] = this.isBlocked;
    data['best_seller'] = this.bestSeller;
    data['medicine_category'] = this.medicineCategory;
    data['usage_purpose'] = this.usagePurpose;
    data['health_segment'] = this.healthSegment;
    data['mrp'] = this.mrp;
    data['net_price'] = this.netPrice;
    data['ptr'] = this.ptr;
    data['is_in_wishlist'] = this.isInWishlist;
    return data;
  }
}

class Settings {
  int? success;
  String? message;
  int? status;
  int? page;
  bool? nextPage;
  bool? prevPage;

  Settings({
    this.success,
    this.message,
    this.status,
    this.page,
    this.nextPage,
    this.prevPage,
  });

  Settings.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    status = json['status'];
    page = json['page'];
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    data['page'] = this.page;
    data['next_page'] = this.nextPage;
    data['prev_page'] = this.prevPage;
    return data;
  }
}
