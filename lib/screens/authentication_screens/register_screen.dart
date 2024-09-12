import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/register_cubit/register_cubit.dart';

import '../../recourses/blocks/authentication_blocks/register_screen_blocks/register_lower_block/register_lower_block.dart';
import '../../recourses/blocks/authentication_blocks/welcome_image_block.dart';
import '../../recourses/manager_files/values_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height*1.2,
            child: Column(
              children: [
                const Expanded(flex: 2, child: WelcomeImageBlock()),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: AppHorizontalSize.s14),
                    child: const RegisterLowerBlock(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
