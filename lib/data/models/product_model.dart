// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String? packSize;
  String? id;
  bool? stockIn;
  Image? image;
  String? item;
  double? price;

  ProductModel({
    this.packSize,
    this.id,
    this.stockIn,
    this.image,
    this.item,
    this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        packSize: json["packSize"] ?? "",
        id: json["_id"] ?? "",
        stockIn: json["stockIn"] ?? "",
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        item: json["item"] ?? "",
        price: double.parse(json["price"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "packSize": packSize,
        "_id": id,
        "stockIn": stockIn,
        "image": image?.toJson(),
        "item": item,
        "price": price,
      };
}

class Image {
  String? type;
  Asset? asset;

  Image({
    this.type,
    this.asset,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        type: json["_type"],
        asset: json["asset"] == null ? null : Asset.fromJson(json["asset"]),
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "asset": asset?.toJson(),
      };
}

class Asset {
  String? ref;
  String? type;

  Asset({
    this.ref,
    this.type,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        ref: json["_ref"],
        type: json["_type"],
      );

  Map<String, dynamic> toJson() => {
        "_ref": ref,
        "_type": type,
      };
}
