import 'package:beelive/domains/auth/forms/signup_form.dart';
import 'package:beelive/widgets/button.dart';
import 'package:beelive/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:beelive/constants/colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

FormBuilder signInForm({
  required GlobalKey<FormBuilderState> formKey,
  Function? login,
}) {
  return FormBuilder(
    key: formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.primarySecondaryElementText,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        FormBuilderTextField(
          // key: _emailFieldKey,
          name: 'email',
          decoration: formInputDecoration(hintText: 'johndoe@gmail.com'),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.email(),
          ]),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Avenir",
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Password',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.primarySecondaryElementText,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        FormBuilderTextField(
          name: 'password',
          decoration: formInputDecoration(hintText: '*******'),
          obscureText: true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            // FormBuilderValidators.minLength(6),
          ]),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Avenir",
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 100),
        button(
          onTap: () {
            if (formKey.currentState?.saveAndValidate() == true) {
              login!(formKey.currentState?.instantValue);
            } else {
              toastInfo("Please enter email and password to continue");
            }
          },
          buttonText: 'Login',
          buttonColor: AppColors.primaryElement,
          textColor: AppColors.primaryBackground,
          hasBorder: false,
        ),
        // MaterialButton(
        //   color: Theme.of(context).colorScheme.secondary,
        //   onPressed: () {
        //     if (_formKey.currentState?.saveAndValidate() ?? false) {
        //       if (true) {
        //         // Either invalidate using Form Key
        //         _formKey.currentState?.fields['email']
        //             ?.invalidate('Email already taken.');
        //         // OR invalidate using Field Key
        //         // _emailFieldKey.currentState?.invalidate('Email already taken.');
        //       }
        //     }
        //     debugPrint(_formKey.currentState?.value.toString());
        //   },
        //   child:
        //       const Text('Signup', style: TextStyle(color: Colors.white)),
        // )
      ],
    ),
  );
}
