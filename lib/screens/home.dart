import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/appbar_button.dart';
import 'package:my_portfolio/widgets/home_widget.dart';
import 'package:my_portfolio/widgets/image_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/home_background.jpg'),
            opacity: 1),
      ),
      // alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 200),
      child: const HomeWidget(),
    );
  }
}
