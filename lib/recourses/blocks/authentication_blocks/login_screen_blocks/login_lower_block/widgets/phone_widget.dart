import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../../manager_files/values_manager.dart';
import '../../../../general_blocks/general_text_form_field.dart';

class PhoneWidget extends StatelessWidget {
  final TextEditingController phone;
  final Function(Country) getCountryCode;
  const PhoneWidget({super.key,required this.phone,required this.getCountryCode});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(

      controller:phone,
      decoration: InputDecoration(
          hintText: '123 456-7890',
          counterText: "",
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.red, width: AppHorizontalSize.s1_5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.red, width: AppHorizontalSize.s1_5),
          )),
      onCountryChanged: (country){
   getCountryCode(country);
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
    );
  }
}
