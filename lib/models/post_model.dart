import 'package:beelive/domains/user/notifiers/user_state.dart';

class Post {
  final String id;
  final String postedBy;
  final String content;
  final String createdAt;
  final String updatedAt;
  int likes;
  bool hasLiked;
  final UserState? user;

  Post(
      {this.id = "",
      this.postedBy = "",
      this.content = "",
      this.createdAt = "",
      this.updatedAt = "",
      this.likes = 0,
      this.hasLiked = false,
      this.user});

  Post copyWith(
      {String? id,
      String? postedBy,
      String? content,
      String? createdAt,
      String? updatedAt,
      int? likes,
      bool? hasLiked}) {
    return Post(
        id: id ?? this.id,
        postedBy: postedBy ?? this.postedBy,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        likes: likes ?? this.likes,
        hasLiked: hasLiked ?? this.hasLiked);
  }

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json['_id'],
      postedBy: json['postedBy'],
      content: json['content'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      likes: json['likes'],
      hasLiked: json['hasLiked'],
      user: UserState.fromJson(json["user"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "postedBy": postedBy,
        "content": content,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "likes": likes,
        "hasLiked": hasLiked,
        "user": user?.toJson()
      };
}
