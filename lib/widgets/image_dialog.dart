
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: CircleBorder(
        side: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.asset('assets/images/profile.jpg', fit: BoxFit.scaleDown),
    );
  }
}
