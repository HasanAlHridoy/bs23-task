// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  Image? image;
  String? name;
  String? id;

  CategoryModel({
    this.image,
    this.name,
    this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        name: json["name"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image?.toJson(),
        "name": name,
        "_id": id,
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
