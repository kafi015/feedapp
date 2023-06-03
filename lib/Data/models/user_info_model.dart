class UserInfoModel {
  String? status;
  List<Data>? data;

  UserInfoModel({this.status, this.data});

  UserInfoModel.fromJson(List<dynamic> json) {

    data = <Data>[];
    for (var v in json) {
      data!.add(Data.fromJson(v));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Data {
  String? sId;
  String? name;
  String? email;
  String? role;
  String? number;
  String? password;

  Data(
      {this.sId, this.name, this.email, this.role, this.number, this.password});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    number = json['number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['number'] = number;
    data['password'] = password;
    return data;
  }
}
