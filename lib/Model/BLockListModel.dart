class BLockListModel {
  List<BlockList>? data;
  Settings? settings;

  BLockListModel({this.data, this.settings});

  BLockListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BlockList>[];
      json['data'].forEach((v) {
        data!.add(new BlockList.fromJson(v));
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

class BlockList {
  String? id;
  Product? product;

  BlockList({this.id, this.product});

  BlockList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? subName;
  String? manufactureCompany;
  String? image;
  double? margin;
  int? quantity;
  String? productForm;
  String? rating;
  bool? bestSeller;
  String? medicineCategory;
  String? usagePurpose;
  String? healthSegment;
  String? mrp;
  String? netPrice;
  String? ptr;
  bool? isInWishlist;

  Product(
      {this.id,
        this.name,
        this.subName,
        this.manufactureCompany,
        this.image,
        this.margin,
        this.quantity,
        this.productForm,
        this.rating,
        this.bestSeller,
        this.medicineCategory,
        this.usagePurpose,
        this.healthSegment,
        this.mrp,
        this.netPrice,
        this.ptr,
        this.isInWishlist});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subName = json['sub_name'];
    manufactureCompany = json['manufacture_company'];
    image = json['image'];
    margin = json['margin'];
    quantity = json['quantity'];
    productForm = json['product_form'];
    rating = json['rating'].toString();
    bestSeller = json['best_seller'];
    medicineCategory = json['medicine_category'];
    usagePurpose = json['usage_purpose'];
    healthSegment = json['health_segment'];
    mrp = json['mrp'];
    netPrice = json['net_price'];
    ptr = json['ptr'];
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

  Settings(
      {this.success,
        this.message,
        this.status,
        this.page,
        this.nextPage,
        this.prevPage});

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
