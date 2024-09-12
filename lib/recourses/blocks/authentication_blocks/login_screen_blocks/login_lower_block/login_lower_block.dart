import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/login_cubit/login_cubit.dart';
import 'package:todo_list_app/cubits/login_cubit/login_cubit.dart';
import 'package:todo_list_app/recourses/blocks/authentication_blocks/login_screen_blocks/login_lower_block/widgets/dont_have_account_widget.dart';
import 'package:todo_list_app/recourses/blocks/authentication_blocks/login_screen_blocks/login_lower_block/widgets/password_widget.dart';
import 'package:todo_list_app/recourses/blocks/authentication_blocks/login_screen_blocks/login_lower_block/widgets/phone_widget.dart';
import 'package:todo_list_app/recourses/blocks/authentication_blocks/login_screen_blocks/login_lower_block/widgets/sign_in_button_widget.dart';

import '../../../../manager_files/color_manager.dart';
import '../../../../manager_files/font_manager.dart';
import '../../../../manager_files/string_manager.dart';
import '../../../../manager_files/style_manager.dart';
import '../../../../manager_files/values_manager.dart';
import '../../../general_blocks/general_button_block.dart';
import '../../../general_blocks/general_text_form_field.dart';

class LoginLowerBlock extends StatelessWidget {
  const LoginLowerBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringManager.ui.kLoginWord,
          style: getBoldStyle(fontSize: FontSize.s24, color: kBlackColor),
        ),
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return PhoneWidget(
              phone: LoginCubit.get(context).phone,
              getCountryCode: (country) {
                LoginCubit.get(context).countryCode = country.dialCode;
              },
            );
          },
        ),
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return PasswordWidget(
              password: LoginCubit.get(context).password,
              isVisible: LoginCubit.get(context).isVisiblePassword,
              changeVisibility: () {
                LoginCubit.get(context).changePasswordVisibility();
              },
            );
          },
        ),
        SignInButtonWidget(
          function: () {
            LoginCubit.get(context).loginProcess();
          },
        ),
        const DontHaveAccountWidget()
      ],
    );
  }
}
