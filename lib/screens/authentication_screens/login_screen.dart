import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/login_cubit/login_cubit.dart';
import 'package:todo_list_app/recourses/blocks/general_blocks/general_button_block.dart';
import 'package:todo_list_app/recourses/blocks/general_blocks/general_text_form_field.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/font_manager.dart';
import 'package:todo_list_app/recourses/manager_files/image_manager.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';
import 'package:todo_list_app/recourses/manager_files/style_manager.dart';
import 'package:todo_list_app/recourses/manager_files/values_manager.dart';

import '../../recourses/blocks/authentication_blocks/login_screen_blocks/login_lower_block/login_lower_block.dart';
import '../../recourses/blocks/authentication_blocks/welcome_image_block.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
              body: Column(

                children: [
                  const Expanded(
                      flex: 3,
                      child: WelcomeImageBlock()),
           state is LoginLoadingState?
                  const Expanded(
                      flex: 1,
                      child: Center(child: CircularProgressIndicator(color: kIndigoColor,),)):
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppHorizontalSize.s14),
                      child: const LoginLowerBlock(),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
