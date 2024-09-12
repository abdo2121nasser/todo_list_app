import 'package:flutter/material.dart';

import '../../manager_files/image_manager.dart';



class WelcomeImageBlock extends StatelessWidget {
  const WelcomeImageBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       // height: MediaQuery.of(context).size.height*0.45,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(ImageManager.kWelcomeImage,
          fit: BoxFit. fill,
        ));
  }
}
