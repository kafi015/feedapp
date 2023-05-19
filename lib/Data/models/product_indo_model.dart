


class ProductInfoModel {
  String? status;
  List<Data>? data;

  ProductInfoModel({this.status, this.data});

  ProductInfoModel.fromJson(List<dynamic> json) {

    if (json != null) {
      data = <Data>[];
      json.forEach((v) {
        data!.add(Data.fromJson(v));
      });
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
  String? price;

  Data({this.sId, this.name, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
