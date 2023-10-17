import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.data,
    required this.onTap,
  });

  final String data;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Text(
        data,
        style: TextStyle(shadows: [
          Shadow(color: Colors.black87, offset: Offset(2, 1), blurRadius: 1)
        ],fontSize: 14),
      ),
    );
  }
}
