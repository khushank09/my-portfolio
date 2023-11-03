import 'package:flutter/material.dart';
import 'package:my_portfolio/size_config.dart';

class LogoImage extends StatefulWidget {
  const LogoImage({super.key, required this.path, this.factor = 1, this.title});

  final String path;
  final String? title;
  final double factor;

  @override
  State<LogoImage> createState() => _LogoImageState();
}

class _LogoImageState extends State<LogoImage> {
  late double radius;

  @override
  Widget build(BuildContext context) {
    radius = 10.5.rb;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 1.3.rb,
                color: Colors.white,
                shadows: const [
                  Shadow(
                      blurRadius: 4, color: Colors.black, offset: Offset(2, 2))
                ]),
          ),
        SizedBox(
          height: 1.5.hb,
        ),
        Container(
          width: radius * widget.factor,
          height: radius * widget.factor,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: .2.rb,
              color: Colors.grey.shade500,
              style: BorderStyle.solid,
            ),
            image: DecorationImage(
              image: AssetImage(widget.path),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class LogoList extends StatelessWidget {
  final List logos = [
    LogoImage(
      path: 'assets/images/ios.jpg',
      title: 'iOS',
    ),
    SizedBox(
      width: 2.wb,
    ),
    LogoImage(
      path: 'assets/images/android.jpg',
      title: 'ANDROID',
    ),
    SizedBox(
      width: 2.wb,
    ),
    LogoImage(
      path: 'assets/images/laptop.jpg',
      title: 'WEB',
    ),
    SizedBox(
      width: 2.wb,
    ),
    LogoImage(
      path: 'assets/images/azure.png',
      title: 'AZURE',
    ),
  ];

  LogoList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 18.rb,
        width: 5 * 12.rb,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: logos.length,
          itemBuilder: (context, index) {
            return logos[index];
          },
        ));
  }
}
