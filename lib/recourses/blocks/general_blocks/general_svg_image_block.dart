import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class GeneralSvgImageBlock extends StatelessWidget {
  final String image;
  final bool isAssetsImage;
  const GeneralSvgImageBlock({super.key,required this.image,
  this.isAssetsImage=true
  });

  @override
  Widget build(BuildContext context) {
    return isAssetsImage? SvgPicture.asset(
        image,
    ):
    SvgPicture.network(
      image,
    )
    ;
  }
}
