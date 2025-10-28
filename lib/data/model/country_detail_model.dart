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
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    capital = json['capital'].cast<String>();
    region = json['region'];
    subregion = json['subregion'];
    population = json['population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (flags != null) {
      data['flags'] = flags!.toJson();
    }
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['capital'] = capital;
    data['region'] = region;
    data['subregion'] = subregion;
    data['population'] = population;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['png'] = png;
    data['svg'] = svg;
    data['alt'] = alt;
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
        ? NativeName.fromJson(json['nativeName'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['common'] = common;
    data['official'] = official;
    if (nativeName != null) {
      data['nativeName'] = nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  Mya? mya;

  NativeName({this.mya});

  NativeName.fromJson(Map<String, dynamic> json) {
    mya = json['mya'] != null ? Mya.fromJson(json['mya']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mya != null) {
      data['mya'] = mya!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['official'] = official;
    data['common'] = common;
    return data;
  }
}
