import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaLogoImage extends StatelessWidget {
  const SocialMediaLogoImage({super.key, required this.onTap, this.icon});

  final void Function() onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: FaIcon(
        icon,
      ),
      color: Colors.blue,
      iconSize: 35,
      hoverColor: Colors.grey,
    );
    // return Container(
    //   width: 50,
    //   height: 50,
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Colors.white, width: 2),
    //     shape: BoxShape.circle,

    //   ),
    // );
  }
}
