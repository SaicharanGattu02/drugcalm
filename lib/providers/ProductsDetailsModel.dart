class ProductsDetailsModel {
  ProductDetails? data;
  Settings? settings;

  ProductsDetailsModel({this.data, this.settings});

  ProductsDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ProductDetails.fromJson(json['data']) : null;
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class ProductDetails {
  String? id;
  String? name;
  String? subName;
  List<Content>? content;
  String? manufactureCompany;
  String? description;
  String? image;
  double? margin;
  String? productForm;
  double? rating;
  bool? isBlocked;
  bool? bestSeller;
  int? quantity;
  String? medicineCategory;
  String? usagePurpose;
  String? healthSegment;
  String? mrp;
  String? netPrice;
  String? ptr;
  bool? isInWishlist;

  ProductDetails(
      {this.id,
        this.name,
        this.subName,
        this.content,
        this.manufactureCompany,
        this.description,
        this.image,
        this.margin,
        this.productForm,
        this.rating,
        this.isBlocked,
        this.bestSeller,
        this.quantity,
        this.medicineCategory,
        this.usagePurpose,
        this.healthSegment,
        this.mrp,
        this.netPrice,
        this.ptr,
        this.isInWishlist});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subName = json['sub_name'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    manufactureCompany = json['manufacture_company'];
    description = json['description'];
    image = json['image'];
    margin = json['margin'];
    productForm = json['product_form'];
    rating = json['rating'];
    isBlocked = json['is_blocked'];
    bestSeller = json['best_seller'];
    quantity = json['quantity'];
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
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['manufacture_company'] = this.manufactureCompany;
    data['description'] = this.description;
    data['image'] = this.image;
    data['margin'] = this.margin;
    data['product_form'] = this.productForm;
    data['rating'] = this.rating;
    data['is_blocked'] = this.isBlocked;
    data['best_seller'] = this.bestSeller;
    data['quantity'] = this.quantity;
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

class Content {
  String? id;
  String? ingredientName;
  String? composition;
  Null? purpose;

  Content({this.id, this.ingredientName, this.composition, this.purpose});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ingredientName = json['ingredient_name'];
    composition = json['composition'];
    purpose = json['purpose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ingredient_name'] = this.ingredientName;
    data['composition'] = this.composition;
    data['purpose'] = this.purpose;
    return data;
  }
}

class Settings {
  int? success;
  String? message;
  int? status;

  Settings({this.success, this.message, this.status});

  Settings.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
