import 'package:beelive/constants/colors.dart';
import 'package:beelive/widgets/button.dart';
import 'package:beelive/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

FormBuilder signUpForm({
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
          'First Name',
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
          name: 'firstName',
          decoration: formInputDecoration(hintText: 'John'),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
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
          'Last Name',
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
          name: 'lastName',
          decoration: formInputDecoration(hintText: 'Doe'),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
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
            FormBuilderValidators.minLength(6),
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
          'Confirm Password',
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
          name: 'passwordConfirm',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: formInputDecoration(hintText: '*******'),
          // decoration: InputDecoration(
          //   contentPadding: const EdgeInsets.symmetric(
          //       vertical: 12.0, horizontal: 15.0),
          //   border: const OutlineInputBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(15))),
          //   suffixIcon: (_formKey.currentState?.fields['confirm_password']
          //               ?.hasError ??
          //           false)
          //       ? const Icon(Icons.error, color: Colors.red)
          //       : const Icon(Icons.check, color: Colors.green),
          //   hintText: '********',
          //   hintStyle: const TextStyle(
          //     color: AppColors.primaryThirdElementText,
          //   ),
          // ),
          obscureText: true,
          validator: (value) =>
              formKey.currentState?.fields['password']?.value != value
                  ? 'Password does not match'
                  : null,
          style: const TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Avenir",
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        // FormBuilderFieldDecoration<bool>(
        //   name: 'test',
        //   validator: FormBuilderValidators.compose([
        //     FormBuilderValidators.required(),
        //     FormBuilderValidators.equal(true),
        //   ]),
        //   // initialValue: true,
        //   decoration: const InputDecoration(labelText: 'Accept Terms?'),
        //   builder: (FormFieldState<bool?> field) {
        //     return InputDecorator(
        //       decoration: InputDecoration(
        //         errorText: field.errorText,
        //       ),
        //       child: SwitchListTile(
        //         title: const Text(
        //             'I have read and accept the terms of service.'),
        //         onChanged: field.didChange,
        //         value: field.value ?? false,
        //       ),
        //     );
        //   },
        // ),
        const SizedBox(height: 100),
        button(
          onTap: () {
            if (formKey.currentState?.saveAndValidate() ?? false) {
            } else {
              toastInfo("Please fill out the form");
            }
          },
          buttonText: 'Register',
          buttonColor: AppColors.primaryElement,
          textColor: AppColors.primaryBackground,
          hasBorder: false,
        ),
      ],
    ),
  );
}

InputDecoration formInputDecoration({String? hintText}) {
  return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryFourthElementText),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryFourthElementText),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.danger),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryFourthElementText),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: AppColors.primaryThirdElementText,
      ),
      // errorText: '',
      errorStyle: const TextStyle(fontSize: 0));
}
