import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/register_cubit/register_cubit.dart';
import 'package:todo_list_app/recourses/blocks/authentication_blocks/login_screen_blocks/login_lower_block/widgets/password_widget.dart';
import 'package:todo_list_app/recourses/blocks/general_blocks/general_text_form_field.dart';

import '../../../../manager_files/color_manager.dart';
import '../../../../manager_files/font_manager.dart';
import '../../../../manager_files/string_manager.dart';
import '../../../../manager_files/style_manager.dart';
import '../../login_screen_blocks/login_lower_block/widgets/phone_widget.dart';
import '../widgets/already_have_account_widget.dart';
import '../widgets/experience_level_widget.dart';
import '../widgets/sign_up_button_widget.dart';
import 'input_fields_block.dart';

class RegisterLowerBlock extends StatelessWidget {
  const RegisterLowerBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringManager.ui.kSignUpWord,
          style: getBoldStyle(fontSize: FontSize.s24, color: kBlackColor),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height*0.55,
            child: const InputFieldsBlock()),
        BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return
              state is RegisterLoadingState?
              const Center(child: Padding(
                padding: EdgeInsets.all(14),
                child: CircularProgressIndicator(color: kIndigoColor,),
              ),):
              SignUpButtonWidget(
              function: () {
                RegisterCubit.get(context).registerProcess();
              },
            );
          },
        ),
        AlreadyHaveAccountWidget()
      ],
    );
  }
}
