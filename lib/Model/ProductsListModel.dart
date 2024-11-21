class ProductsListModel {
  List<ProductsList>? data;
  Settings? settings;

  ProductsListModel({this.data, this.settings});

  ProductsListModel.fromJson(Map<String, dynamic> json) {
    // Check if 'data' is present and non-null, if not, set it to an empty list
    if (json['data'] != null && json['data'] is List) {
      data = <ProductsList>[];
      json['data'].forEach((v) {
        data!.add(ProductsList.fromJson(v));
      });
    } else {
      // Set data to an empty list if 'data' is null or not a list
      data = [];
    }

    settings = json['settings'] != null
        ? Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    // If 'data' is not null, convert it to a list of JSON objects
    if (data != null && data!.isNotEmpty) {
      dataMap['data'] = data!.map((v) => v.toJson()).toList();
    } else {
      // If 'data' is null or empty, don't include the key 'data' in the JSON
      dataMap['data'] = [];
    }
    // Convert 'settings' to JSON if not null
    if (settings != null) {
      dataMap['settings'] = settings!.toJson();
    }
    return dataMap;
  }
}

class ProductsList {
  String? id;
  String? name;
  String? subName;
  String? manufactureCompany;
  String? image;
  double? margin;
  String? productType;
  String? rating;
  bool? isBlocked;
  bool? bestSeller;
  String? medicineCategory;
  String? usagePurpose;
  String? healthSegment;
  String? mrp;
  String? ptr;
  String? net_price;
  bool? isInWishlist;

  ProductsList(
      {this.id,
        this.name,
        this.subName,
        this.manufactureCompany,
        this.image,
        this.margin,
        this.productType,
        this.rating,
        this.isBlocked,
        this.bestSeller,
        this.medicineCategory,
        this.usagePurpose,
        this.healthSegment,
        this.mrp,
        this.ptr,
        this.net_price,
        this.isInWishlist});

  ProductsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subName = json['sub_name'];
    manufactureCompany = json['manufacture_company'];
    image = json['image'];
    margin = json['margin'];
    productType = json['product_type'];
    rating = json['rating'];
    isBlocked = json['is_blocked'];
    bestSeller = json['best_seller'];
    medicineCategory = json['medicine_category'];
    usagePurpose = json['usage_purpose'];
    healthSegment = json['health_segment'];
    mrp = json['mrp'];
    ptr = json['ptr'];
    net_price = json['net_price'];
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
    data['product_type'] = this.productType;
    data['rating'] = this.rating;
    data['is_blocked'] = this.isBlocked;
    data['best_seller'] = this.bestSeller;
    data['medicine_category'] = this.medicineCategory;
    data['usage_purpose'] = this.usagePurpose;
    data['health_segment'] = this.healthSegment;
    data['mrp'] = this.mrp;
    data['ptr'] = this.ptr;
    data['net_price'] = this.net_price;
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
