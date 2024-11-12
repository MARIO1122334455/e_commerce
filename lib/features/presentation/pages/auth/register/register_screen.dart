// ignore_for_file: must_be_immutable


import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/blocs/register/register_states.dart';
import 'package:e_commerce/features/presentation/blocs/register/register_viewModel.dart';

import 'package:e_commerce/features/presentation/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/presentation/widgets/dialog_utils.dart';
import 'package:e_commerce/features/presentation/widgets/main_text_field.dart';
import 'package:e_commerce/features/presentation/widgets/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class RegisterScreen extends StatelessWidget {
  RegisterViewmodel registerViewmodel = getIt<RegisterViewmodel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewmodel, RegisterStates>(
      bloc: registerViewmodel,
      listener: (context, state) {
        if (state is LoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading');
        } else if (state is ErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failuers.errorMsg,
              title: 'error',
              posActionName: 'ok');
        } else if (state is SucsessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Register sucseesfully',
              title: 'sucsees',
              posActionName: 'ok');
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  const SizedBox(
                    height: 22,
                  ),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    hint: 'enter your full name',
                    label: 'Full Name',
                    textInputType: TextInputType.name,
                    validation: AppValidators.validateFullName,
                    controller: registerViewmodel.nameController,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  BuildTextField(
                    hint: 'enter your mobile no.',
                    backgroundColor: ColorManager.white,
                    label: 'Mobile Number',
                    validation: AppValidators.validatePhoneNumber,
                    textInputType: TextInputType.phone,
                    controller: registerViewmodel.phoneController,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  BuildTextField(
                    hint: 'enter your email address',
                    backgroundColor: ColorManager.white,
                    label: 'E-mail address',
                    validation: AppValidators.validateEmail,
                    textInputType: TextInputType.emailAddress,
                    controller: registerViewmodel.emailController,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  BuildTextField(
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                    controller: registerViewmodel.passwordController,
                  ),
                  const SizedBox(height: 22),
                  BuildTextField(
                    hint: 'enter your rePassword',
                    backgroundColor: ColorManager.white,
                    label: 'rePassword',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                    controller: registerViewmodel.rePasswordController,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Center(
                    child: SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * .9,
                      child: CustomElevatedButton(
                        // borderRadius: AppSize.s8,
                        label: 'Sign Up',
                        backgroundColor: ColorManager.white,
                        textStyle: getBoldStyle(
                            color: ColorManager.primary, fontSize: AppSize.s20),
                        onTap: () {
                          registerViewmodel.register();

                          // Navigator.pushNamed(context, Routes.mainRoute);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
