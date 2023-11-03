import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/size_config.dart';
import 'package:my_portfolio/widgets/logo_image.dart';
import 'package:my_portfolio/widgets/social_media_logo_image.dart';
import 'package:url_launcher/url_launcher.dart';

var myEmail = 'khushankmadaan2k@gmail.com';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var style = TextStyle(
    color: Colors.grey.withAlpha(250),
    letterSpacing: 2,
    fontWeight: FontWeight.normal,
    fontSize: 0.9.sb,
  );

  late AnimationController profileNameAnimationController;
  late Animation<Offset> rightOffset;
  late Animation<Offset> leftOffset;

  void _launchLinkedInURL() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/khushank09');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void _launchMailURL() async {
    final Uri url = Uri.parse('mailto:$myEmail');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    profileNameAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    rightOffset =
        Tween<Offset>(begin: const Offset(5, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: profileNameAnimationController,
                curve: Curves.fastOutSlowIn));

    leftOffset =
        Tween<Offset>(begin: const Offset(-5, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: profileNameAnimationController,
                curve: Curves.fastOutSlowIn));

    Future(() => setState(() {
          style = TextStyle(
            color: Colors.grey.withAlpha(250),
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            fontSize: 10.sb,
          );
          profileNameAnimationController.forward();
        }));
  }

  @override
  void dispose() {
    profileNameAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SlideTransition(
          position: leftOffset,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                style: style,
                duration: const Duration(seconds: 2, milliseconds: 400),
                curve: Curves.easeInBack,
                child: Text(
                  'WELCOME!',
                  style: TextStyle(fontSize: 8.rb, shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 0.05.rb,
                        offset: Offset(0.5.rb, 0)),
                    Shadow(
                        color: Colors.black45,
                        blurRadius: 0.4.rb,
                        offset: Offset(0.8.rb, 0)),
                  ]),
                ),
              ),
              SizedBox(
                height: 4.hb,
              ),
              LogoList(),
              SizedBox(
                height: 7.hb,
              ),
              Container(
                padding: EdgeInsets.all(1.rb),
                width: 50.rb,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(3.rb),
                  border:
                      Border.all(color: Colors.grey.shade800, width: 0.2.rb),
                  color: Colors.grey.shade800,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  'Software Engineer/Developer',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.blueGrey.shade200,
                      fontSize: 3.rb,
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        Shadow(
                            blurRadius: 2,
                            color: Colors.black,
                            offset: Offset(2, 1))
                      ]),
                ),
              ),
              SizedBox(
                height: 3.5.hb,
              ),
              Container(
                padding: EdgeInsets.all(1.rb),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(3.rb),
                  border: Border.all(color: Colors.grey.shade800, width: .2.rb),
                  color: Colors.grey.shade800,
                ),
                width: 60.rb,
                child: Text(
                  'I am a software engineer with more than 2 years of experience. I have knowledge of various technologies/frameworks such as Flutter, Azure Data Factory, Azure Synapse, etc.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.blueGrey.shade200,
                        shadows: const [
                          Shadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(2, 2))
                        ],
                        fontSize: 2.5.sb,
                      ),
                ),
              ),
              SizedBox(
                height: 2.8.hb,
              ),
              Row(
                children: [
                  SocialMediaLogoImage(
                    icon: FontAwesomeIcons.linkedin,
                    onTap: _launchLinkedInURL,
                  ),
                  SizedBox(
                    width: 1.5.wb,
                  ),
                  SocialMediaLogoImage(
                    icon: FontAwesomeIcons.envelope,
                    onTap: _launchMailURL,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 15.wb,
        ),
        SlideTransition(
          position: rightOffset,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              LogoImage(
                path: 'assets/images/profile.jpg',
                factor: 4.2,
              ),
              SizedBox(height: 1.4.hb),
              Text(
                'KHUSHANK',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.grey.withAlpha(255),
                      shadows: [
                        Shadow(
                          color: Colors.blueGrey,
                          blurRadius: 0.1.rb,
                          offset: Offset(0.1.rb, 0.05.rb),
                        ),
                      ],
                      fontWeight: FontWeight.bold,
                      fontSize: 3.5.rb,
                      letterSpacing: 2,
                      // backgroundColor: Colors.grey.shade900.withOpacity(0.8),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
