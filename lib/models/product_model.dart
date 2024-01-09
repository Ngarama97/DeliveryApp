// ignore_for_file: non_constant_identifier_names

class Product {
  int? _total_size;
  int? _type_id;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product({
    required total_size,
    required type_id,
    required offset,
    required products,
  }) {
    this._total_size = total_size;
    this._type_id = type_id;
    this._offset = offset;
    this._products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _total_size = json['total_size'];
    _type_id = json['type_id'];
    _offset = json['offset'];

    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? created_at;
  String? updated_at;
  int? type_id;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.created_at,
    this.updated_at,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    type_id = json['type_id'];
  }
}



 // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['description'] = description;
  //   data['price'] = price;
  //   data['stars'] = stars;
  //   data['img'] = img;
  //   data['location'] = location;
  //   data['created_at'] = created_at;
  //   data['updated_at'] = updated_at;
  //   data['type_id'] = type_id;
  //   return data;
  // }




  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['total_size'] = _total_size;
  //   data['type_id'] = _type_id;
  //   data['offset'] = _offset;
  //   data['products'] = _products;
  //   return data;
  // }