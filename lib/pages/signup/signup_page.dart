// ignore_for_file: unused_local_variable, unused_field

import 'package:beelive/domains/auth/forms/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:beelive/widgets/widgets.dart';
import 'package:beelive/constants/colors.dart';
import 'package:beelive/global/global_loader.dart';
import 'package:beelive/domains/auth/controller/auth_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final _formKey = GlobalKey<FormBuilderState>();
  late AuthController _controller;

  @override
  void initState() {
    _controller = AuthController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(appLoaderProvider);

    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          appBar: appBar(title: 'Sign Up'),
          backgroundColor: AppColors.primaryBackground,
          body: !loader
              ? SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 100,
                    horizontal: 25,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [signUpForm(formKey: _formKey)],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                      color: AppColors.primaryElement)),
        )));
  }
}
