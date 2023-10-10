import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage(
      {super.key,
      required this.path,
      this.width = 100,
      this.height = 100,
      this.title});

  final String path;
  final String? title;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (title != null)
          Text(
            title!,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.white),
          ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.4,
              color: Colors.grey.shade500,
            ),
            image: DecorationImage(
              image: AssetImage(path),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
