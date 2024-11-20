class BrandsModel {
  List<Brands>? data;
  Settings? settings;

  BrandsModel({this.data, this.settings});

  BrandsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Brands>[];
      json['data'].forEach((v) {
        data!.add(new Brands.fromJson(v));
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

class Brands {
  String? id;
  String? brandName;
  String? brandLogo;

  Brands({this.id, this.brandName, this.brandLogo});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand_name'] = this.brandName;
    data['brand_logo'] = this.brandLogo;
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
