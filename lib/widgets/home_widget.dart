import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/widgets/logo_image.dart';
import 'package:my_portfolio/widgets/social_media_logo_image.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  void _launchURL() async {
   final Uri url = Uri.parse('https://www.linkedin.com/in/khushank09');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'WELCOME!',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.grey.withAlpha(250),
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 75,
                  ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LogoImage(
                  path: 'assets/images/ios.jpg',
                  title: 'ios',
                ),
                SizedBox(
                  width: 25,
                ),
                LogoImage(
                  path: 'assets/images/android.jpg',
                  title: 'ANDROID',
                ),
                SizedBox(
                  width: 25,
                ),
                LogoImage(
                  path: 'assets/images/laptop.jpg',
                  title: 'WEB',
                ),
                SizedBox(
                  width: 25,
                ),
                LogoImage(
                  path: 'assets/images/azure.png',
                  title: 'AZURE',
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey.shade800, width: 2),
                color: Colors.grey.shade800,
              ),
              child: Text(
                'Software Engineer/Developer',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.blueGrey.shade200,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,

                      // background: Paint()..color = Colors.teal,
                    ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey.shade800, width: 2),
                color: Colors.grey.shade800,
              ),
              width: 700,
              child: Text(
                'I am a software engineer with more than 2 years of experience. I have knowledge of various technologies/frameworks such as Flutter, Azure Data Factory, Azure Synapse, etc.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.blueGrey.shade200,
                      fontSize: 18,
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SocialMediaLogoImage(
                  icon: FontAwesomeIcons.linkedin,
                  onTap: _launchURL,
                ),
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoImage(
              path: 'assets/images/profile.jpg',
              width: 425,
              height: 425,
            ),
            const SizedBox(height: 10),
            Text(
              'KHUSHANK MADAAN',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.grey.withAlpha(255),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
            )
          ],
        ),
      ],
    );
  }
}
