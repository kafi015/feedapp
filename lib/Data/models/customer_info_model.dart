

class CustomerInfoModel {
  String? status;
  List<Data>? data;

  CustomerInfoModel({this.status, this.data});

  CustomerInfoModel.fromJson(List<dynamic> json) {

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
  String? date;
  String? name;
  String? total;
  String? paid;
  String? due;
  String? note;

  Data(
      {this.sId,
        this.date,
        this.name,
        this.total,
        this.paid,
        this.due,
        this.note});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    name = json['name'];
    total = json['total'];
    paid = json['paid'];
    due = json['due'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['date'] = date;
    data['name'] = name;
    data['total'] = total;
    data['paid'] = paid;
    data['due'] = due;
    data['note'] = note;
    return data;
  }
}
