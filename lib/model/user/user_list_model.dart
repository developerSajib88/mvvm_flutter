import 'dart:convert';

class UserListModel {
  final List<User>? users;
  final int? total;
  final int? skip;
  final int? limit;

  UserListModel({
    this.users,
    this.total,
    this.skip,
    this.limit,
  });

  UserListModel copyWith({
    List<User>? users,
    int? total,
    int? skip,
    int? limit,
  }) =>
      UserListModel(
        users: users ?? this.users,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory UserListModel.fromRawJson(String str) => UserListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
    users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? maidenName;
  final int? age;
  final Gender? gender;
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  final DateTime? birthDate;
  final String? image;
  final String? bloodGroup;
  final int? height;
  final double? weight;
  final EyeColor? eyeColor;
  final Hair? hair;
  final String? domain;
  final String? ip;
  final Address? address;
  final String? macAddress;
  final String? university;
  final Bank? bank;
  final Company? company;
  final String? ein;
  final String? ssn;
  final String? userAgent;
  final Crypto? crypto;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.domain,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
  });

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    Gender? gender,
    String? email,
    String? phone,
    String? username,
    String? password,
    DateTime? birthDate,
    String? image,
    String? bloodGroup,
    int? height,
    double? weight,
    EyeColor? eyeColor,
    Hair? hair,
    String? domain,
    String? ip,
    Address? address,
    String? macAddress,
    String? university,
    Bank? bank,
    Company? company,
    String? ein,
    String? ssn,
    String? userAgent,
    Crypto? crypto,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        maidenName: maidenName ?? this.maidenName,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        username: username ?? this.username,
        password: password ?? this.password,
        birthDate: birthDate ?? this.birthDate,
        image: image ?? this.image,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        eyeColor: eyeColor ?? this.eyeColor,
        hair: hair ?? this.hair,
        domain: domain ?? this.domain,
        ip: ip ?? this.ip,
        address: address ?? this.address,
        macAddress: macAddress ?? this.macAddress,
        university: university ?? this.university,
        bank: bank ?? this.bank,
        company: company ?? this.company,
        ein: ein ?? this.ein,
        ssn: ssn ?? this.ssn,
        userAgent: userAgent ?? this.userAgent,
        crypto: crypto ?? this.crypto,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    maidenName: json["maidenName"],
    age: json["age"],
    gender: genderValues.map[json["gender"]]!,
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    password: json["password"],
    birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
    image: json["image"],
    bloodGroup: json["bloodGroup"],
    height: json["height"],
    weight: json["weight"]?.toDouble(),
    eyeColor: eyeColorValues.map[json["eyeColor"]]!,
    hair: json["hair"] == null ? null : Hair.fromJson(json["hair"]),
    domain: json["domain"],
    ip: json["ip"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    macAddress: json["macAddress"],
    university: json["university"],
    bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
    ein: json["ein"],
    ssn: json["ssn"],
    userAgent: json["userAgent"],
    crypto: json["crypto"] == null ? null : Crypto.fromJson(json["crypto"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "maidenName": maidenName,
    "age": age,
    "gender": genderValues.reverse[gender],
    "email": email,
    "phone": phone,
    "username": username,
    "password": password,
    "birthDate": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
    "image": image,
    "bloodGroup": bloodGroup,
    "height": height,
    "weight": weight,
    "eyeColor": eyeColorValues.reverse[eyeColor],
    "hair": hair?.toJson(),
    "domain": domain,
    "ip": ip,
    "address": address?.toJson(),
    "macAddress": macAddress,
    "university": university,
    "bank": bank?.toJson(),
    "company": company?.toJson(),
    "ein": ein,
    "ssn": ssn,
    "userAgent": userAgent,
    "crypto": crypto?.toJson(),
  };
}

class Address {
  final String? address;
  final String? city;
  final Coordinates? coordinates;
  final String? postalCode;
  final String? state;

  Address({
    this.address,
    this.city,
    this.coordinates,
    this.postalCode,
    this.state,
  });

  Address copyWith({
    String? address,
    String? city,
    Coordinates? coordinates,
    String? postalCode,
    String? state,
  }) =>
      Address(
        address: address ?? this.address,
        city: city ?? this.city,
        coordinates: coordinates ?? this.coordinates,
        postalCode: postalCode ?? this.postalCode,
        state: state ?? this.state,
      );

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    city: json["city"],
    coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
    postalCode: json["postalCode"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "city": city,
    "coordinates": coordinates?.toJson(),
    "postalCode": postalCode,
    "state": state,
  };
}

class Coordinates {
  final double? lat;
  final double? lng;

  Coordinates({
    this.lat,
    this.lng,
  });

  Coordinates copyWith({
    double? lat,
    double? lng,
  }) =>
      Coordinates(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  factory Coordinates.fromRawJson(String str) => Coordinates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Bank {
  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  Bank copyWith({
    String? cardExpire,
    String? cardNumber,
    String? cardType,
    String? currency,
    String? iban,
  }) =>
      Bank(
        cardExpire: cardExpire ?? this.cardExpire,
        cardNumber: cardNumber ?? this.cardNumber,
        cardType: cardType ?? this.cardType,
        currency: currency ?? this.currency,
        iban: iban ?? this.iban,
      );

  factory Bank.fromRawJson(String str) => Bank.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
    cardExpire: json["cardExpire"],
    cardNumber: json["cardNumber"],
    cardType: json["cardType"],
    currency: json["currency"],
    iban: json["iban"],
  );

  Map<String, dynamic> toJson() => {
    "cardExpire": cardExpire,
    "cardNumber": cardNumber,
    "cardType": cardType,
    "currency": currency,
    "iban": iban,
  };
}

class Company {
  final Address? address;
  final String? department;
  final String? name;
  final String? title;

  Company({
    this.address,
    this.department,
    this.name,
    this.title,
  });

  Company copyWith({
    Address? address,
    String? department,
    String? name,
    String? title,
  }) =>
      Company(
        address: address ?? this.address,
        department: department ?? this.department,
        name: name ?? this.name,
        title: title ?? this.title,
      );

  factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    department: json["department"],
    name: json["name"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "address": address?.toJson(),
    "department": department,
    "name": name,
    "title": title,
  };
}

class Crypto {
  final Coin? coin;
  final Wallet? wallet;
  final Network? network;

  Crypto({
    this.coin,
    this.wallet,
    this.network,
  });

  Crypto copyWith({
    Coin? coin,
    Wallet? wallet,
    Network? network,
  }) =>
      Crypto(
        coin: coin ?? this.coin,
        wallet: wallet ?? this.wallet,
        network: network ?? this.network,
      );

  factory Crypto.fromRawJson(String str) => Crypto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
    coin: coinValues.map[json["coin"]]!,
    wallet: walletValues.map[json["wallet"]]!,
    network: networkValues.map[json["network"]]!,
  );

  Map<String, dynamic> toJson() => {
    "coin": coinValues.reverse[coin],
    "wallet": walletValues.reverse[wallet],
    "network": networkValues.reverse[network],
  };
}

enum Coin {
  BITCOIN
}

final coinValues = EnumValues({
  "Bitcoin": Coin.BITCOIN
});

enum Network {
  ETHEREUM_ERC20
}

final networkValues = EnumValues({
  "Ethereum (ERC20)": Network.ETHEREUM_ERC20
});

enum Wallet {
  THE_0_XB9_FC1004_BFE7702_DE522516_CF34_A5_DA41_C4_EF2_B5,
  THE_0_XB9_FC2_FE63_B2_A6_C003_F1_C324_C3_BFA53259162181_A,
  THE_0_XB9_FC4_B4_B855_BC44_EB30_D5_E36_FD18_F491_F44_A15_B7,
  THE_0_XB9_FE6979_A82_FB43_FDD9_BA9_F446846_DC4_DFCA3_DEB
}

final walletValues = EnumValues({
  "0xb9fc1004bfe7702de522516cf34a5da41c4ef2b5": Wallet.THE_0_XB9_FC1004_BFE7702_DE522516_CF34_A5_DA41_C4_EF2_B5,
  "0xb9fc2fe63b2a6c003f1c324c3bfa53259162181a": Wallet.THE_0_XB9_FC2_FE63_B2_A6_C003_F1_C324_C3_BFA53259162181_A,
  "0xb9fc4b4b855bc44eb30d5e36fd18f491f44a15b7": Wallet.THE_0_XB9_FC4_B4_B855_BC44_EB30_D5_E36_FD18_F491_F44_A15_B7,
  "0xb9fe6979a82fb43fdd9ba9f446846dc4dfca3deb": Wallet.THE_0_XB9_FE6979_A82_FB43_FDD9_BA9_F446846_DC4_DFCA3_DEB
});

enum EyeColor {
  AMBER,
  BLUE,
  BROWN,
  GRAY,
  GREEN
}

final eyeColorValues = EnumValues({
  "Amber": EyeColor.AMBER,
  "Blue": EyeColor.BLUE,
  "Brown": EyeColor.BROWN,
  "Gray": EyeColor.GRAY,
  "Green": EyeColor.GREEN
});

enum Gender {
  FEMALE,
  MALE
}

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE
});

class Hair {
  final Color? color;
  final Type? type;

  Hair({
    this.color,
    this.type,
  });

  Hair copyWith({
    Color? color,
    Type? type,
  }) =>
      Hair(
        color: color ?? this.color,
        type: type ?? this.type,
      );

  factory Hair.fromRawJson(String str) => Hair.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
    color: colorValues.map[json["color"]]!,
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "color": colorValues.reverse[color],
    "type": typeValues.reverse[type],
  };
}

enum Color {
  AUBURN,
  BLACK,
  BLOND,
  BROWN,
  CHESTNUT
}

final colorValues = EnumValues({
  "Auburn": Color.AUBURN,
  "Black": Color.BLACK,
  "Blond": Color.BLOND,
  "Brown": Color.BROWN,
  "Chestnut": Color.CHESTNUT
});

enum Type {
  CURLY,
  STRAIGHT,
  STRANDS,
  VERY_CURLY,
  WAVY
}

final typeValues = EnumValues({
  "Curly": Type.CURLY,
  "Straight": Type.STRAIGHT,
  "Strands": Type.STRANDS,
  "Very curly": Type.VERY_CURLY,
  "Wavy": Type.WAVY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
