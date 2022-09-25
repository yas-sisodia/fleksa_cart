// To parse this JSON data, do
//
//     final menuModel = menuModelFromMap(jsonString);

import 'dart:core';

import 'package:meta/meta.dart';
import 'dart:convert';

class MenuModel {
  MenuModel({
    required this.autoDiscount,
    required this.categories,
    required this.offers,
    required this.parts,
    required this.result,
    required this.sides,
  });

  dynamic? autoDiscount;
  List<Category>? categories;
  List<Offer>? offers;
  Map<String, Part>? parts;
  bool? result;
  Map<String, Side>? sides;

  factory MenuModel.fromJson(String str) => MenuModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MenuModel.fromMap(Map<String, dynamic> json) => MenuModel(
        autoDiscount: json["auto_discount"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromMap(x))),
        parts: Map.from(json["parts"])
            .map((k, v) => MapEntry<String, Part>(k, Part.fromMap(v))),
        result: json["result"],
        sides: Map.from(json["sides"])
            .map((k, v) => MapEntry<String, Side>(k, Side.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "auto_discount": autoDiscount,
        "categories":
            List<dynamic>.from(categories?.map((x) => x.toMap()) ?? []),
        "offers": List<dynamic>.from(offers?.map((x) => x.toMap()) ?? []),
        "parts": parts != null
            ? Map.from(parts!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toMap()))
            : null,
        "result": result,
        "sides": sides != null
            ? Map.from(sides!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toMap()))
            : null,
      };
}

class Category {
  Category({
    required this.availability,
    required this.descriptionJson,
    required this.id,
    required this.image,
    required this.inStock,
    required this.nameJson,
    required this.products,
  });

  Availability? availability;
  Json? descriptionJson;
  int? id;
  dynamic? image;
  bool? inStock;
  Json? nameJson;
  List<Part>? products;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        availability: Availability.fromMap(json["availability"]),
        descriptionJson: Json.fromMap(json["description_json"] ?? {}),
        id: json["id"],
        image: json["image"],
        inStock: json["in_stock"],
        nameJson: Json.fromMap(json["name_json"] ?? {}),
        products: List<Part>.from(json["products"].map((x) => Part.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "availability": availability?.toMap(),
        "description_json": descriptionJson?.toMap(),
        "id": id,
        "image": image,
        "in_stock": inStock,
        "name_json": nameJson?.toMap(),
        "products": List<dynamic>.from(products?.map((x) => x.toMap()) ?? []),
      };
}

class Availability {
  Availability({
    required this.always,
  });

  bool always;

  factory Availability.fromJson(String str) =>
      Availability.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Availability.fromMap(Map<String, dynamic> json) => Availability(
        always: json["always"],
      );

  Map<String, dynamic> toMap() => {
        "always": always,
      };
}

class Json {
  Json({
    required this.english,
    required this.german,
  });

  String? english;
  String? german;

  factory Json.fromJson(String str) => Json.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Json.fromMap(Map<String, dynamic> json) => Json(
        english: json["english"],
        german: json["german"],
      );

  Map<String, dynamic> toMap() => {
        "english": english,
        "german": german,
      };
}

class Part {
  Part({
    required this.choice,
    required this.descriptionJson,
    required this.id,
    required this.image,
    required this.inStock,
    required this.isPopular,
    required this.nameJson,
    required this.oldPrice,
    required this.price,
    required this.sideProductsJson,
    required this.sku,
    required this.type,
  });

  List<Choice>? choice;
  Json? descriptionJson;
  int? id;
  dynamic? image;
  bool? inStock;
  bool? isPopular;
  Json? nameJson;
  dynamic? oldPrice;
  double? price;
  List<SideProductsJson>? sideProductsJson;
  String? sku;
  Type? type;

  factory Part.fromJson(String str) => Part.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Part.fromMap(Map<String, dynamic> json) => Part(
        choice: List<Choice>.from(
            json["choice"]?.map((x) => Choice.fromMap(x)) ?? []),
        descriptionJson: json["description_json"] == null
            ? null
            : Json.fromMap(json["description_json"]),
        id: json["id"],
        image: json["image"],
        inStock: json["in_stock"],
        isPopular: json["is_popular"] == null ? null : json["is_popular"],
        nameJson: Json.fromMap(json["name_json"]),
        oldPrice: json["old_price"],
        price: json["price"].toDouble(),
        sideProductsJson: List<SideProductsJson>.from(json["side_products_json"]
                ?.map((x) => SideProductsJson.fromMap(x)) ??
            []),
        sku: json["sku"] == null ? null : json["sku"],
        type: json["type_"] == null ? null : typeValues.map[json["type_"]],
      );

  Map<String, dynamic> toMap() => {
        "choice": List<dynamic>.from(choice?.map((x) => x.toMap()) ?? []),
        "description_json":
            descriptionJson == null ? null : descriptionJson?.toMap(),
        "id": id,
        "image": image,
        "in_stock": inStock,
        "is_popular": isPopular == null ? null : isPopular,
        "name_json": nameJson?.toMap(),
        "old_price": oldPrice,
        "price": price,
        "side_products_json":
            List<dynamic>.from(sideProductsJson?.map((x) => x.toMap()) ?? []),
        "sku": sku == null ? null : sku,
        "type_": type == null ? null : typeValues.reverse[type],
      };
}

class Choice {
  Choice({
    required this.hasProducts,
    required this.nameJson,
    required this.options,
    required this.type,
    required this.choice,
  });

  bool? hasProducts;
  Json? nameJson;
  List<Option>? options;
  Type? type;
  List<int>? choice;

  factory Choice.fromJson(String str) => Choice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Choice.fromMap(Map<String, dynamic> json) => Choice(
        hasProducts: json["has_products"],
        nameJson: Json.fromMap(json["name_json"]),
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
        type: typeValues.map[json["type_"]],
        choice: json["choice"] == null
            ? null
            : List<int>.from(json["choice"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "has_products": hasProducts,
        "name_json": nameJson?.toMap(),
        "options": options == null
            ? null
            : List<dynamic>.from(options?.map((x) => x.toMap()) ?? []),
        "type_": typeValues.reverse[type],
        "choice": choice == null
            ? null
            : List<dynamic>.from(choice?.map((x) => x) ?? []),
      };
}

class Option {
  Option({
    required this.nameJson,
    required this.price,
  });

  Json? nameJson;
  double? price;

  factory Option.fromJson(String str) => Option.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Option.fromMap(Map<String, dynamic> json) => Option(
        nameJson: Json.fromMap(json["name_json"]),
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "name_json": nameJson?.toMap(),
        "price": price,
      };
}

enum Type { SINGLE, MULTIPLE }

final typeValues =
    EnumValues({"MULTIPLE": Type.MULTIPLE, "SINGLE": Type.SINGLE});

class SideProductsJson {
  SideProductsJson({
    required this.hasProducts,
    required this.nameJson,
    required this.optionIds,
    required this.type,
  });

  bool? hasProducts;
  Json? nameJson;
  List<int>? optionIds;
  Type? type;

  factory SideProductsJson.fromJson(String str) =>
      SideProductsJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SideProductsJson.fromMap(Map<String, dynamic> json) =>
      SideProductsJson(
        hasProducts: json["has_products"],
        nameJson: Json.fromMap(json["name_json"]),
        optionIds: List<int>.from(json["option_ids"].map((x) => x)),
        type: typeValues.map[json["type_"]],
      );

  Map<String, dynamic> toMap() => {
        "has_products": hasProducts,
        "name_json": nameJson?.toMap(),
        "option_ids": List<dynamic>.from(optionIds?.map((x) => x) ?? []),
        "type_": typeValues.reverse[type],
      };
}

class Offer {
  Offer({
    required this.categories,
    required this.code,
    required this.descriptionJson,
    required this.endDate,
    required this.minAmount,
    required this.offerType,
    required this.orderType,
    required this.period,
    required this.provided,
    required this.startDate,
  });

  Categories? categories;
  String? code;
  Json? descriptionJson;
  dynamic? endDate;
  double? minAmount;
  String? offerType;
  String? orderType;
  String? period;
  double? provided;
  dynamic? startDate;

  factory Offer.fromJson(String str) => Offer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Offer.fromMap(Map<String, dynamic> json) => Offer(
        categories: Categories.fromMap(json["categories"]),
        code: json["code"],
        descriptionJson: Json.fromMap(json["description_json"]),
        endDate: json["end_date"],
        minAmount: json["min_amount"],
        offerType: json["offer_type_"],
        orderType: json["order_type_"],
        period: json["period"],
        provided: json["provided"],
        startDate: json["start_date"],
      );

  Map<String, dynamic> toMap() => {
        "categories": categories?.toMap(),
        "code": code,
        "description_json": descriptionJson?.toMap(),
        "end_date": endDate,
        "min_amount": minAmount,
        "offer_type_": offerType,
        "order_type_": orderType,
        "period": period,
        "provided": provided,
        "start_date": startDate,
      };
}

class Categories {
  Categories({
    required this.forAll,
    required this.ids,
  });

  bool? forAll;
  List<dynamic>? ids;

  factory Categories.fromJson(String str) =>
      Categories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
        forAll: json["for_all"],
        ids: List<dynamic>.from(json["ids"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "for_all": forAll,
        "ids": List<dynamic>.from(ids?.map((x) => x) ?? []),
      };
}

class Side {
  Side({
    required this.id,
    required this.inStock,
    required this.nameJson,
    required this.oldPrice,
    required this.price,
    required this.sku,
  });

  int? id;
  bool? inStock;
  Json? nameJson;
  dynamic? oldPrice;
  double? price;
  dynamic? sku;

  factory Side.fromJson(String str) => Side.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Side.fromMap(Map<String, dynamic> json) => Side(
        id: json["id"],
        inStock: json["in_stock"],
        nameJson: Json.fromMap(json["name_json"]),
        oldPrice: json["old_price"],
        price: json["price"].toDouble(),
        sku: json["sku"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "in_stock": inStock,
        "name_json": nameJson?.toMap(),
        "old_price": oldPrice,
        "price": price,
        "sku": sku,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}
