class UserDetailsModel {
  UserDetail? data;
  Settings? settings;

  UserDetailsModel({this.data, this.settings});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserDetail.fromJson(json['data']) : null;
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

class UserDetail {
  String? id;
  String? fullName;
  String? image;
  String? email;
  String? status;
  String? mobile;
  String? gender;
  String? dob;
  Personal? personal;

  UserDetail(
      {this.id,
        this.fullName,
        this.image,
        this.email,
        this.status,
        this.mobile,
        this.gender,
        this.dob,
        this.personal});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    image = json['image'];
    email = json['email'];
    status = json['status'];
    mobile = json['mobile'];
    gender = json['gender'];
    dob = json['dob'];
    personal = json['personal'] != null
        ? new Personal.fromJson(json['personal'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['image'] = this.image;
    data['email'] = this.email;
    data['status'] = this.status;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    if (this.personal != null) {
      data['personal'] = this.personal!.toJson();
    }
    return data;
  }
}

class Personal {
  String? bloodGroup;
  int? age;
  String? hight;
  String? weight;

  Personal({this.bloodGroup, this.age, this.hight, this.weight});

  Personal.fromJson(Map<String, dynamic> json) {
    bloodGroup = json['blood_group'];
    age = json['age'];
    hight = json['hight'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blood_group'] = this.bloodGroup;
    data['age'] = this.age;
    data['hight'] = this.hight;
    data['weight'] = this.weight;
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
