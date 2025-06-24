class NewsDetailModel {
  String? message;
  Data? data;

  NewsDetailModel({this.message, this.data});

  NewsDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? judul;
  String? deskripsi;
  String? tanggal;

  Data({this.id, this.judul, this.deskripsi, this.tanggal});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    deskripsi = json['deskripsi'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['deskripsi'] = this.deskripsi;
    data['tanggal'] = this.tanggal;
    return data;
  }
}
