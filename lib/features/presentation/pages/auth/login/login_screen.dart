// ignore_for_file: must_be_immutable

import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/blocs/login/login_states.dart';
import 'package:e_commerce/features/presentation/blocs/login/login_viewModel.dart';
import 'package:e_commerce/features/presentation/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/presentation/widgets/dialog_utils.dart';
import 'package:e_commerce/features/presentation/widgets/main_text_field.dart';
import 'package:e_commerce/features/presentation/widgets/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routes_manager/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  LoginViewmodel loginViewmodel = getIt<LoginViewmodel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewmodel, LoginStates>(
      bloc: loginViewmodel,
      listener: (BuildContext context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failuers.errorMsg,
              title: 'error',
              posActionName: 'ok');
        } else if (state is LoginSucsessState) {
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
                  Text(
                    'Welcome Back To Route',
                    style: getBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s24.sp),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: getLightStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s16.sp),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    hint: 'enter your name',
                    label: 'User name',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                    controller: loginViewmodel.emailController,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  BuildTextField(
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'Password',
                    validation: AppValidators.validatePassword,
                    controller: loginViewmodel.passwordController,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forget password?',
                            style: getMediumStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s18.sp),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Center(
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * .8,
                      child: CustomElevatedButton(
                        // borderRadius: AppSize.s8,
                        isStadiumBorder: false,
                        label: 'Login',
                        backgroundColor: ColorManager.white,
                        textStyle: getBoldStyle(
                            color: ColorManager.primary, fontSize: 22),
                        onTap: () {
                          loginViewmodel.login();
                          Navigator.pushNamed(context, Routes.mainRoute);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: getSemiBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(
                        width: AppSize.s8.w,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.signUpRoute),
                        child: Text(
                          'Create Account',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
