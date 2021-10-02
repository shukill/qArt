// ignore_for_file: constant_identifier_names

import 'enum_values.dart';

class Product {
  Product({
    required this.season,
    required this.brand,
    required this.mood,
    required this.gender,
    required this.theme,
    required this.category,
    required this.categoryName,
    required this.name,
    required this.color,
    required this.option,
    required this.mrp,
    required this.subCategory,
    required this.collection,
    required this.fit,
    required this.description,
    required this.qrCode,
    required this.looks,
    required this.fabric,
    required this.ean,
    required this.finish,
    required this.availableSizes,
    required this.offerMonths,
    required this.productClass,
    required this.promoted,
    required this.secondary,
    required this.deactivated,
    required this.material,
    required this.quality,
    required this.qrCode2,
    required this.displayName,
    required this.displayOrder,
    required this.minQuantity,
    required this.maxQuantity,
    required this.qpsCode,
    required this.image,
    required this.imageUrl,
    required this.adShoot,
    required this.technology,
    required this.imageAlt,
    required this.isCore,
    required this.minimumArticleQuantity,
    required this.likeabilty,
    required this.brandRank,
  });

  Season? season;
  BrandEnum? brand;
  String mood;
  Gender? gender;
  String? theme;
  Category? category;
  String categoryName;
  String? name;
  String? color;
  String? option;
  double? mrp;
  Category? subCategory;
  Collection? collection;
  Fit? fit;
  String? description;
  String? qrCode;
  String? looks;
  String? fabric;
  Ean ean;
  String? finish;
  List<String> availableSizes;
  List<OfferMonth> offerMonths;
  int productClass;
  bool promoted;
  bool secondary;
  bool deactivated;
  String material;
  String quality;
  String qrCode2;
  String displayName;
  int displayOrder;
  int minQuantity;
  int maxQuantity;
  String qpsCode;
  String image;
  String imageUrl;
  bool adShoot;
  Technology? technology;
  String imageAlt;
  bool isCore;
  int minimumArticleQuantity;
  double likeabilty;
  String brandRank;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        season: seasonValues.map![json["Season"]],
        brand: brandEnumValues.map![json["Brand"]],
        mood: json["Mood"],
        gender: genderValues.map![json["Gender"]],
        theme: json["Theme"],
        category: categoryValues.map![json["Category"]],
        categoryName: json["Category"],
        name: json["Name"],
        color: json["Color"],
        option: json["Option"],
        mrp: json["MRP"],
        subCategory: categoryValues.map![json["SubCategory"]],
        collection: collectionValues.map![json["Collection"]],
        fit: fitValues.map![json["Fit"]],
        description: json["Description"],
        qrCode: json["QRCode"],
        looks: json["Looks"],
        fabric: json["Fabric"],
        ean: Ean.fromJson(json["EAN"]),
        finish: json["Finish"],
        availableSizes: List<String>.from(json["AvailableSizes"].map((x) => x)),
        offerMonths: List<OfferMonth>.from(
            json["OfferMonths"].map((x) => offerMonthValues.map![x])),
        productClass: json["ProductClass"],
        promoted: json["Promoted"],
        secondary: json["Secondary"],
        deactivated: json["Deactivated"],
        material: json["Material"],
        quality: json["Quality"],
        qrCode2: json["QRCode2"],
        displayName: json["DisplayName"],
        displayOrder: json["DisplayOrder"],
        minQuantity: json["MinQuantity"],
        maxQuantity: json["MaxQuantity"],
        qpsCode: json["QPSCode"],
        image: json["Image"],
        imageUrl: json["ImageUrl"],
        adShoot: json["AdShoot"],
        technology: technologyValues.map![json["Technology"]],
        imageAlt: json["ImageAlt"],
        isCore: json["IsCore"],
        minimumArticleQuantity: json["MinimumArticleQuantity"],
        likeabilty: json["Likeabilty"],
        brandRank: json["BrandRank"],
      );

  Map<String, dynamic> toJson() => {
        "Season": seasonValues.reverse[season],
        "Brand": brandEnumValues.reverse[brand],
        "Mood": mood,
        "Gender": genderValues.reverse[gender],
        "Theme": theme,
        "Category": categoryValues.reverse[category],
        "Name": name,
        "Color": color,
        "Option": option,
        "MRP": mrp,
        "SubCategory": categoryValues.reverse[subCategory],
        "Collection": collectionValues.reverse[collection],
        "Fit": fitValues.reverse[fit],
        "Description": description,
        "QRCode": qrCode,
        "Looks": looks,
        "Fabric": fabric,
        "EAN": ean.toJson(),
        "Finish": finish,
        "AvailableSizes": List<dynamic>.from(availableSizes.map((x) => x)),
        "OfferMonths": List<dynamic>.from(
            offerMonths.map((x) => offerMonthValues.reverse[x])),
        "ProductClass": productClass,
        "Promoted": promoted,
        "Secondary": secondary,
        "Deactivated": deactivated,
        "Material": material,
        "Quality": quality,
        "QRCode2": qrCode2,
        "DisplayName": displayName,
        "DisplayOrder": displayOrder,
        "MinQuantity": minQuantity,
        "MaxQuantity": maxQuantity,
        "QPSCode": qpsCode,
        "Image": image,
        "ImageUrl": imageUrl,
        "AdShoot": adShoot,
        "Technology": technologyValues.reverse[technology],
        "ImageAlt": imageAlt,
        "IsCore": isCore,
        "MinimumArticleQuantity": minimumArticleQuantity,
        "Likeabilty": likeabilty,
        "BrandRank": brandRank,
      };
}

enum BrandEnum { LEE, WRANGLER }

final brandEnumValues =
    EnumValues({"Lee": BrandEnum.LEE, "Wrangler": BrandEnum.WRANGLER});

enum Category {
  MENS_JEANS,
  MENS_SHIRTS,
  MENS_SHORTS,
  MENS_DENIM_SHORTS,
  MENS_TROUSER,
  MENS_T_SHIRT,
  MENS_TROUSERS,
  MENS_T_SHIRTS,
  CATEGORY_MENS_SHORTS,
  MENS_JOGGER,
  MENS_POLO,
  MENS_CREW_NECK,
  MENS_HENLEY
}

final categoryValues = EnumValues({
  "Mens- Shorts": Category.CATEGORY_MENS_SHORTS,
  "Mens-Crew Neck": Category.MENS_CREW_NECK,
  "Mens-Denim Shorts": Category.MENS_DENIM_SHORTS,
  "Mens-Henley": Category.MENS_HENLEY,
  "Mens-Jeans": Category.MENS_JEANS,
  "Mens-Jogger": Category.MENS_JOGGER,
  "Mens-Polo": Category.MENS_POLO,
  "Mens-Shirts": Category.MENS_SHIRTS,
  "Mens-Shorts": Category.MENS_SHORTS,
  "Mens-Trouser": Category.MENS_TROUSER,
  "Mens-Trousers": Category.MENS_TROUSERS,
  "Mens-T-Shirt": Category.MENS_T_SHIRT,
  "Mens-T Shirts": Category.MENS_T_SHIRTS
});

enum Collection {
  LEE_JOY_FACTORY,
  THE_101,
  BLACK_LABEL,
  EXTREME_MOTION,
  URBAN_FANTASY,
  SMILEY,
  SMILEY_X_LEE,
  URBAN_TRAIL,
  EARTH_SEED,
  REACH_THE_SKY,
  RACE_READY,
  OUR_HAPPY_PLACE,
  FARM_SEED,
  THE_75_TH_ANNIVERSARY
}

final collectionValues = EnumValues({
  "Black Label": Collection.BLACK_LABEL,
  "Earth & Seed": Collection.EARTH_SEED,
  "Extreme Motion": Collection.EXTREME_MOTION,
  "Farm & Seed": Collection.FARM_SEED,
  "Lee Joy Factory": Collection.LEE_JOY_FACTORY,
  "Our Happy Place": Collection.OUR_HAPPY_PLACE,
  "Race Ready": Collection.RACE_READY,
  "Reach The Sky": Collection.REACH_THE_SKY,
  "Smiley": Collection.SMILEY,
  "Smiley X Lee": Collection.SMILEY_X_LEE,
  "101+": Collection.THE_101,
  "75Th Anniversary": Collection.THE_75_TH_ANNIVERSARY,
  "Urban Fantasy": Collection.URBAN_FANTASY,
  "Urban Trail": Collection.URBAN_TRAIL
});

enum Gender { MENS }

final genderValues = EnumValues({"Mens": Gender.MENS});

enum OfferMonth { JAN, FEB, APR, MAR, MARCH, APRIL }

final offerMonthValues = EnumValues({
  "Apr": OfferMonth.APR,
  "April": OfferMonth.APRIL,
  "Feb": OfferMonth.FEB,
  "Jan": OfferMonth.JAN,
  "Mar": OfferMonth.MAR,
  "March": OfferMonth.MARCH
});

enum Season { SS22 }

final seasonValues = EnumValues({"SS22": Season.SS22});

enum Technology {
  EMPTY,
  EXTREME_MOTION,
  FLO,
  SMILEY,
  TRAVELER,
  WE_CARE,
  TRAVELERLITE
}

final technologyValues = EnumValues({
  "": Technology.EMPTY,
  "Extreme Motion": Technology.EXTREME_MOTION,
  "FLO": Technology.FLO,
  "Smiley": Technology.SMILEY,
  "TRAVELER": Technology.TRAVELER,
  "TRAVELERLITE": Technology.TRAVELERLITE,
  "WE CARE": Technology.WE_CARE
});

class Ean {
  Ean({
    required this.the28,
    required this.the30,
    required this.the32,
    required this.the34,
    required this.the36,
    required this.the38,
    required this.the40,
    required this.the42,
    required this.the2Xl,
    required this.l,
    required this.m,
    required this.s,
    required this.xl,
    required this.xxl,
  });

  String the28;
  String the30;
  String the32;
  String the34;
  String the36;
  String the38;
  String the40;
  String the42;
  String the2Xl;
  String l;
  String m;
  String s;
  String xl;
  String xxl;

  factory Ean.fromJson(Map<String, dynamic> json) => Ean(
        the28: json["28"] ?? '',
        the30: json["30"] ?? '',
        the32: json["32"] ?? '',
        the34: json["34"] ?? '',
        the36: json["36"] ?? '',
        the38: json["38"] ?? '',
        the40: json["40"] ?? '',
        the42: json["42"] ?? '',
        the2Xl: json["2XL"] ?? '',
        l: json["L"] ?? '',
        m: json["M"] ?? '',
        s: json["S"] ?? '',
        xl: json["XL"] ?? '',
        xxl: json["XXL"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "28": the28,
        "30": the30,
        "32": the32,
        "34": the34,
        "36": the36,
        "38": the38,
        "40": the40,
        "42": the42,
        "2XL": the2Xl,
        "L": l,
        "M": m,
        "S": s,
        "XL": xl,
        "XXL": xxl,
      };
}

enum Fit {
  BRUCE,
  ANTON,
  TRAVIS,
  RODEO,
  ERIC,
  ARVIN,
  MICK,
  SLIM,
  COMFORT,
  SHORTS,
  SKANDERS,
  BOSTIN,
  MILLARD,
  VEGAS,
  REDDING,
  LOOSE_CARPENTER,
  JOGGER,
  REGULAR,
  RESORT,
  OVERSHIRT,
  JOGGERS,
  VINTAGE
}

final fitValues = EnumValues({
  "Anton": Fit.ANTON,
  "Arvin": Fit.ARVIN,
  "Bostin": Fit.BOSTIN,
  "Bruce": Fit.BRUCE,
  "Comfort": Fit.COMFORT,
  "Eric": Fit.ERIC,
  "Jogger": Fit.JOGGER,
  "Joggers": Fit.JOGGERS,
  "Loose Carpenter": Fit.LOOSE_CARPENTER,
  "Mick": Fit.MICK,
  "Millard": Fit.MILLARD,
  "Overshirt": Fit.OVERSHIRT,
  "Redding": Fit.REDDING,
  "Regular": Fit.REGULAR,
  "Resort": Fit.RESORT,
  "Rodeo": Fit.RODEO,
  "Shorts": Fit.SHORTS,
  "Skanders": Fit.SKANDERS,
  "Slim": Fit.SLIM,
  "Travis": Fit.TRAVIS,
  "Vegas": Fit.VEGAS,
  "Vintage": Fit.VINTAGE
});
