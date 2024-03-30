import 'package:beelive/models/post_model.dart';
import 'package:beelive/apis/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postAPIProvider = Provider((ref) {
  return PostAPI();
});

abstract class IPostAPI {
  Future<dynamic> createPost({required Post post});
  Future<PostListResponseEntity> getPosts({Map<String, dynamic>? params});
  Future<dynamic> likePost({required String postId});
  Future<dynamic> unlikePost({required String postId});
}

class PostAPI implements IPostAPI {
  @override
  Future<dynamic> createPost({required Post post}) async {
    var response = await Http().post(
      '/honey/api/createPost',
      data: {'postId': post},
    );

    return response;
  }

  @override
  Future<dynamic> likePost({required String postId}) async {
    var response = await Http().post(
      '/honey/api/likePost',
      data: {'postId': postId},
    );

    return response;
  }

  @override
  Future<dynamic> unlikePost({required String postId}) async {
    var response = await Http().post(
      '/honey/api/unlikePost',
      data: {'postId': postId},
    );

    return response;
  }

  @override
  Future<PostListResponseEntity> getPosts(
      {Map<String, dynamic>? params}) async {
    final response = await Http().post(
      '/honey/api/getPosts',
      data: params,
    );

    return PostListResponseEntity.fromJson(response);
  }
}

class PostListResponseEntity {
  bool? success;
  List<Post> posts;

  PostListResponseEntity({
    required this.success,
    required this.posts,
  });

  factory PostListResponseEntity.fromJson(Map<String, dynamic> json) {
    return PostListResponseEntity(
      success: json["success"],
      posts: List<Post>.from(json["data"].map((x) => Post.fromJson(x))),
    );
  }
}
