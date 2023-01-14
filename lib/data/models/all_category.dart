class AllCagegory {
  int? currentPage;
  int? totalPage;
  Null? error;
  List<Data>? data;

  AllCagegory({this.currentPage, this.totalPage, this.error, this.data});

  AllCagegory.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalPage = json['totalPage'];
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['totalPage'] = this.totalPage;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? categoryId;
  String? name;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.categoryId,
      this.name,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
