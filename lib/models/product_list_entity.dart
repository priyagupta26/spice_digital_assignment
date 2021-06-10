class ProductListEntity {
  String discountPercentage;
  String discountPrice;
  String imageURL;
  LongDesc longDesc;
  String name;
  String origPrice;
  String shortDesc;

  ProductListEntity(
      {this.discountPercentage,
      this.discountPrice,
      this.imageURL,
      this.longDesc,
      this.name,
      this.origPrice,
      this.shortDesc});

  factory ProductListEntity.fromJson(Map<String, dynamic> json) {
    return ProductListEntity(
      discountPercentage: json['discountPercentage'],
      discountPrice: json['DiscountPrice'],
      imageURL: json['imageURL'],
      longDesc:
          json['longDesc'] != null ? LongDesc.fromJson(json['longDesc']) : null,
      name: json['name'],
      origPrice: json['OrigPrice'],
      shortDesc: json['shortDesc'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discountPercentage'] = this.discountPercentage;
    data['DiscountPrice'] = this.discountPrice;
    data['imageURL'] = this.imageURL;
    data['name'] = this.name;
    data['OrigPrice'] = this.origPrice;
    data['shortDesc'] = this.shortDesc;
    if (this.longDesc != null) {
      data['longDesc'] = this.longDesc.toJson();
    }
    return data;
  }
}

class LongDesc {
  List<Detail> details;
  String discountDetails;
  String exchangeDtls;
  String seller;
  List<SizeDetail> sizeDetails;

  LongDesc(
      {this.details,
      this.discountDetails,
      this.exchangeDtls,
      this.seller,
      this.sizeDetails});

  factory LongDesc.fromJson(Map<String, dynamic> json) {
    return LongDesc(
      details: json['details'] != null
          ? (json['details'] as List).map((i) => Detail.fromJson(i)).toList()
          : null,
      discountDetails: json['discountDetails'],
      exchangeDtls: json['exchangeDtls'],
      seller: json['seller'],
      sizeDetails: json['sizeDetails'] != null
          ? (json['sizeDetails'] as List)
              .map((i) => SizeDetail.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discountDetails'] = this.discountDetails;
    data['exchangeDtls'] = this.exchangeDtls;
    data['seller'] = this.seller;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    if (this.sizeDetails != null) {
      data['sizeDetails'] = this.sizeDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SizeDetail {
  String thirty;
  String forty;
  String fortyTwo;
  String fortyFour;
  String fortySix;

  SizeDetail(
      {this.thirty, this.forty, this.fortyTwo, this.fortyFour, this.fortySix});

  factory SizeDetail.fromJson(Map<String, dynamic> json) {
    return SizeDetail(
      thirty: json['30'],
      forty: json['40'],
      fortyTwo: json['42'],
      fortyFour: json['44'],
      fortySix: json['46'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['30'] = this.thirty;
    data['40'] = this.forty;
    data['42'] = this.fortyTwo;
    data['44'] = this.fortyFour;
    data['46'] = this.fortySix;
    return data;
  }
}

class Detail {
  String Care;
  String fit;
  String note;
  String productDetails;

  Detail({this.Care, this.fit, this.note, this.productDetails});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      Care: json['Care'],
      fit: json['Size & Fit'],
      note: json['Style note'],
      productDetails: json['productDetails'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Care'] = this.Care;
    data['Size & Fit'] = this.fit;
    data['Style note'] = this.note;
    data['productDetails'] = this.productDetails;
    return data;
  }
}
