class OutletModel {
  OutletDetail? data;
  Settings? settings;

  OutletModel({this.data, this.settings});

  OutletModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new OutletDetail.fromJson(json['data']) : null;
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

class OutletDetail {
  String? id;
  String? premType;
  String? image;
  String? location;
  String? name;
  String? businessType;
  String? subType;

  OutletDetail(
      {this.id,
        this.premType,
        this.image,
        this.location,
        this.name,
        this.businessType,
        this.subType});

  OutletDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    premType = json['prem_type'];
    image = json['image'];
    location = json['location'];
    name = json['name'];
    businessType = json['business_type'];
    subType = json['sub_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['prem_type'] = this.premType;
    data['image'] = this.image;
    data['location'] = this.location;
    data['name'] = this.name;
    data['business_type'] = this.businessType;
    data['sub_type'] = this.subType;
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
