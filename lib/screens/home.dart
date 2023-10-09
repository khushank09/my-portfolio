import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/appbar_button.dart';
import 'package:my_portfolio/widgets/home_widget.dart';
import 'package:my_portfolio/widgets/image_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/home_background.jpg'),
              opacity: 0.5),
        ),
        // alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 200),
        child: const HomeWidget(),
      ),
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.15),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBarButton(data: 'Home'),
                AppBarButton(data: 'About'),
                AppBarButton(data: 'Services'),
                AppBarButton(data: 'Experience'),
                AppBarButton(data: 'Contact'),
              ],
            ),
          )
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  await showDialog(
                      context: context, builder: (_) => const ImageDialog());
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                      width: 2.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'KHUSHANK',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(200),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
