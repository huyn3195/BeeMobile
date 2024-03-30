import 'package:beelive/domains/post/controller/post_controller.dart';
import 'package:beelive/pages/home/widgets/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:beelive/constants/colors.dart';
import 'package:beelive/widgets/app_bar.dart';

class CommunityScreen extends ConsumerStatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends ConsumerState<CommunityScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      appBar: appBar(backgroundColor: AppColors.primaryElement),
      body: RefreshIndicator(
        color: AppColors.primaryElement,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: PostListView()),
            ],
          ),
        ),
        onRefresh: () {
          return ref.refresh(postControllerProvider.notifier).getPosts();
        },
      ),
    );
  }
}
