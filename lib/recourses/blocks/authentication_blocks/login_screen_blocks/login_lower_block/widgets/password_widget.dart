import 'package:flutter/material.dart';
import 'package:todo_list_app/recourses/manager_files/string_manager.dart';

import '../../../../general_blocks/general_text_form_field.dart';

class PasswordWidget extends StatelessWidget {
  final TextEditingController password;
  final bool isVisible;
  final VoidCallback changeVisibility;
  const PasswordWidget({super.key,required this.password,
    required this.isVisible,
  required this.changeVisibility
  });

  @override
  Widget build(BuildContext context) {
    return GeneralTextFormField(
      controller: password,
      hint: StringManager.ui.kPasswordWord,
      suffixIcon:isVisible? const Icon(Icons.visibility_off): const Icon(Icons.visibility),
      suffixIconFunction: () {
        changeVisibility();
      },
      isVisible: isVisible,
    );
  }
}
