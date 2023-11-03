import 'package:flutter/material.dart';
import 'package:my_portfolio/size_config.dart';

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
    return Padding(
      padding: EdgeInsets.only(left: 0.4.rb, right: 0.4.rb),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Text(
          data,
          style: TextStyle(shadows: [
            Shadow(
                color: Colors.black87,
                offset: Offset(.2.rb, .1.rb),
                blurRadius: .1.rb)
          ], fontSize: 1.8.rb),
        ),
      ),
    );
  }
}
