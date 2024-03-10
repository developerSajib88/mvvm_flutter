import 'dart:convert';

class CommentListModel {
  final List<Comment>? comments;
  final int? total;
  final int? skip;
  final int? limit;

  CommentListModel({
    this.comments,
    this.total,
    this.skip,
    this.limit,
  });

  CommentListModel copyWith({
    List<Comment>? comments,
    int? total,
    int? skip,
    int? limit,
  }) =>
      CommentListModel(
        comments: comments ?? this.comments,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory CommentListModel.fromRawJson(String str) => CommentListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommentListModel.fromJson(Map<String, dynamic> json) => CommentListModel(
    comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Comment {
  final int? id;
  final String? body;
  final int? postId;
  final User? user;

  Comment({
    this.id,
    this.body,
    this.postId,
    this.user,
  });

  Comment copyWith({
    int? id,
    String? body,
    int? postId,
    User? user,
  }) =>
      Comment(
        id: id ?? this.id,
        body: body ?? this.body,
        postId: postId ?? this.postId,
        user: user ?? this.user,
      );

  factory Comment.fromRawJson(String str) => Comment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    body: json["body"],
    postId: json["postId"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "body": body,
    "postId": postId,
    "user": user?.toJson(),
  };
}

class User {
  final int? id;
  final String? username;

  User({
    this.id,
    this.username,
  });

  User copyWith({
    int? id,
    String? username,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
  };
}
