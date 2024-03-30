import 'package:beelive/constants/colors.dart';
import 'package:beelive/constants/icons.dart';
import 'package:beelive/domains/post/controller/post_controller.dart';
import 'package:beelive/models/post_model.dart';
import 'package:beelive/utils/fortmat.dart';
import 'package:beelive/widgets/image_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart';

class PostCard extends ConsumerWidget {
  final Post post;
  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    timeago.setLocaleMessages('en', MyCustomMessages());

    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColors.thirdText, width: 0.3))),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 5),
                    CachedNetworkImage(
                      imageUrl: post.user!.avatar!,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 35.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        width: 35.0,
                        height: 35.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryElement,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${post.user!.firstName!} ${post.user!.lastName!}',
                          style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.secondaryText,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '  •  ${timeago.format(DateTime.parse(post.createdAt))}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryThirdElementText,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(post.content,
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(height: 15),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 48,
                    ),
                    SizedBox(
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LikeButton(
                            size: 25,
                            onTap: (isLiked) async {
                              post.hasLiked = !post.hasLiked;
                              if (isLiked) {
                                ref
                                    .watch(postControllerProvider.notifier)
                                    .unlikePost(postId: post.id);
                                post.likes--;
                              } else {
                                ref
                                    .watch(postControllerProvider.notifier)
                                    .likePost(postId: post.id);
                                post.likes++;
                              }
                              return !isLiked;
                            },
                            isLiked: post.hasLiked,
                            likeBuilder: (isLiked) {
                              return appImageWithColor(
                                  imagePath: AppIcon.like,
                                  color: isLiked
                                      ? AppColors.primaryElement
                                      : AppColors.primaryFourthElementText);
                            },
                            likeCount: post.likes,
                            countBuilder: (likeCount, isLiked, text) {
                              return Text(
                                counterCompactFormat(likeCount!),
                                style: TextStyle(
                                  color: isLiked
                                      ? AppColors.primaryElement
                                      : AppColors.primaryThirdElementText,
                                  fontSize: 14,
                                ),
                              );
                            },
                            likeCountAnimationType: LikeCountAnimationType.none,
                          ),
                        ],
                      ),
                    ),
                    appImageWithColor(
                        imagePath: AppIcon.comment,
                        color: AppColors.primaryFourthElementText),
                  ],
                ),
                appImageWithColor(
                    imagePath: AppIcon.share,
                    color: AppColors.primaryFourthElementText),
              ],
            )
          ],
        ));
  }
}

class MyCustomMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'just now';
  @override
  String aboutAMinute(int minutes) => 'a minute ago';
  @override
  String minutes(int minutes) => '$minutes mins ago';
  @override
  String aboutAnHour(int minutes) => 'an hour ago';
  @override
  String hours(int hours) => '$hours hours ago';
  @override
  String aDay(int hours) => 'a day ago';
  @override
  String days(int days) => '$days days ago';
  @override
  String aboutAMonth(int days) => 'a month ago';
  @override
  String months(int months) => '$months months ago';
  @override
  String aboutAYear(int year) => '${year}y';
  @override
  String years(int years) => '${years}y';
  @override
  String wordSeparator() => ' ';
}
