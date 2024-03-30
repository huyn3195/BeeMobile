import 'package:beelive/constants/colors.dart';
import 'package:beelive/domains/post/controller/post_controller.dart';
import 'package:beelive/pages/home/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListView extends ConsumerWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getPostsProvider).when(
        data: (data) => CustomScrollView(
              slivers: <Widget>[
                const SliverToBoxAdapter(
                    child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Community',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.secondaryText,
                        fontWeight: FontWeight.w600),
                  ),
                )),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return PostCard(
                      key: ObjectKey(data[index]), post: data[index]);
                }, childCount: data.length))
              ],
            ),
        error: (error, stackTrace) => const Text("Error"),
        loading: () => const SizedBox(
            height: 600,
            child: Center(
                child: CircularProgressIndicator(
                    backgroundColor: AppColors.primaryElement,
                    color: AppColors.primarySecondaryElementText))));
  }
}
