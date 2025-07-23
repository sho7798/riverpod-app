class CountryDetailModel {
  Flags? flags;
  Name? name;
  List<String>? capital;
  String? region;
  String? subregion;
  int? population;

  CountryDetailModel({
    this.flags,
    this.name,
    this.capital,
    this.region,
    this.subregion,
    this.population,
  });

  CountryDetailModel.fromJson(Map<String, dynamic> json) {
    flags = json['flags'] != null ? new Flags.fromJson(json['flags']) : null;
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    capital = json['capital'].cast<String>();
    region = json['region'];
    subregion = json['subregion'];
    population = json['population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.flags != null) {
      data['flags'] = this.flags!.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['capital'] = this.capital;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    data['population'] = this.population;
    return data;
  }
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['png'] = this.png;
    data['svg'] = this.svg;
    data['alt'] = this.alt;
    return data;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null
        ? new NativeName.fromJson(json['nativeName'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['common'] = this.common;
    data['official'] = this.official;
    if (this.nativeName != null) {
      data['nativeName'] = this.nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  Mya? mya;

  NativeName({this.mya});

  NativeName.fromJson(Map<String, dynamic> json) {
    mya = json['mya'] != null ? new Mya.fromJson(json['mya']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mya != null) {
      data['mya'] = this.mya!.toJson();
    }
    return data;
  }
}

class Mya {
  String? official;
  String? common;

  Mya({this.official, this.common});

  Mya.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['official'] = this.official;
    data['common'] = this.common;
    return data;
  }
}
