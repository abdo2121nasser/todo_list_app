import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeWidget extends StatelessWidget {
  final String id;
  const QrCodeWidget({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Align(
        alignment: Alignment.center,
        child: QrImageView(
          data: id,
          version: QrVersions.auto,
          size: MediaQuery.of(context).size.height * 0.3,
        ),
      ),
    );
  }
}
