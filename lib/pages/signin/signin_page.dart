import 'package:beelive/domains/auth/controller/auth_controller.dart';
import 'package:beelive/domains/auth/forms/signin_form.dart';
import 'package:beelive/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:beelive/global/global_loader.dart';
import 'package:beelive/constants/colors.dart';
import 'package:beelive/widgets/widgets.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final _formKey = GlobalKey<FormBuilderState>();
  late AuthController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AuthController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(appLoaderProvider);

    return Container(
        color: AppColors.primaryBackground,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: AppColors.primaryBackground,
                body: !loader
                    ? SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildThirdLogin(),
                            const SizedBox(
                              height: 100,
                            ),
                            signInForm(
                                formKey: _formKey,
                                login: (formValue) {
                                  _controller.login(context, formValue);
                                }),
                            const SizedBox(height: 15),
                            button(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.signUp);
                              },
                              buttonText: 'Sign Up',
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                            color: AppColors.primarySecondaryElementText)))));
  }

  Widget forgotPassword() {
    return SizedBox(
      width: 260,
      height: 44,
      child: GestureDetector(
          child: const Text(
            "Forgot password?",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.primaryText,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          onTap: () {
            // Navigator.of(context).pushNamed(AppRoutes.Forget);
          }),
    );
  }

  Widget buildThirdLogin() {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 20),
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    "assets/icons/google.png",
                    fit: BoxFit.fill,
                  )),
              onTap: () {
                // signInLogicandleSignIn("google");
              },
            ),
            GestureDetector(
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child:
                      Image.asset("assets/icons/apple.png", fit: BoxFit.fill)),
              onTap: () {
                // signInLogicandleSignIn("apple");
              },
            ),
            GestureDetector(
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/icons/facebook.png",
                      fit: BoxFit.fill)),
              onTap: () {
                // signInLogicandleSignIn("facebook");
              },
            ),
          ],
        ));
  }
}
