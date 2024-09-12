import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/register_cubit/register_cubit.dart';
import 'package:todo_list_app/cubits/register_cubit/register_cubit.dart';

import 'package:todo_list_app/recourses/blocks/authentication_blocks/login_screen_blocks/login_lower_block/widgets/password_widget.dart';
import 'package:todo_list_app/recourses/blocks/general_blocks/general_text_form_field.dart';

import '../../../../manager_files/string_manager.dart';
import '../../login_screen_blocks/login_lower_block/widgets/phone_widget.dart';
import '../widgets/experience_level_widget.dart';

class InputFieldsBlock extends StatelessWidget {
  const InputFieldsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        var regCubit = RegisterCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            GeneralTextFormField(
                hint: StringManager.ui.kNameWord, controller: regCubit.name),
            PhoneWidget(
                phone: regCubit.phone,
                getCountryCode: (country) {
                  regCubit.countryCode = country.dialCode;
                }),
            GeneralTextFormField(
                onlyInteger: true,
                hint: StringManager.ui.kExperienceWord,
                controller: regCubit.experience),
            ExperienceLevelWidget(
              items: regCubit.experienceLevels,
              selectedItem: regCubit.level,
              changeExperienceLevel: (value){
                regCubit.changeExperienceLevel(level: value);
              },
            ),
            GeneralTextFormField(
                hint: StringManager.ui.kAddressWord,
                controller: regCubit.address),
            PasswordWidget(
                password: regCubit.password,
                isVisible: regCubit.isVisiblePassword,
                changeVisibility: () {
                  regCubit.changePasswordVisibility();
                }),
          ],
        );
      },
    );
  }
}
