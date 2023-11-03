import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/size_config.dart';

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
      iconSize: 4.rb,
      hoverColor: Colors.grey,
    );
  }
}
