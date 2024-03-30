// ignore_for_file: unused_field

import 'package:beelive/apis/post_api.dart';
import 'package:beelive/models/post_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final postControllerProvider =
    StateNotifierProvider<PostController, bool>((ref) {
  return PostController(ref: ref, postAPI: ref.watch(postAPIProvider));
});

final getPostsProvider = FutureProvider((ref) {
  final postController = ref.watch(postControllerProvider.notifier);
  return postController.getPosts();
});

class PostController extends StateNotifier<bool> {
  final Ref _ref;
  final PostAPI _postAPI;

  PostController({required Ref ref, required PostAPI postAPI})
      : _ref = ref,
        _postAPI = postAPI,
        super(false);

  Future<Post> createPost({required Post post}) async {
    final response = await _postAPI.createPost(post: post);

    return response.post;
  }

  Future<List<Post>> getPosts() async {
    final response = await _postAPI.getPosts();

    return response.posts;
  }

  void likePost({required String postId}) async {
    await _postAPI.likePost(postId: postId);
  }

  void unlikePost({required String postId}) async {
    await _postAPI.unlikePost(postId: postId);
  }
}
