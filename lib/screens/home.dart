import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    fontSize: 5,
  );

  late AnimationController profileNameAnimationController;

  var logos = [];
  final _animatedListKey = GlobalKey<AnimatedListState>();
  var profileRadius = 0.0;
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

  void _loadLogos() {
    const allLogos = [
      LogoImage(
        path: 'assets/images/ios.jpg',
        title: 'iOS',
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
    ];

    var future = Future(() {});
    for (var i = 0; i < allLogos.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 280), () {
          logos.add(allLogos[i]);
          _animatedListKey.currentState!.insertItem(i);
        });
      });
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
            fontSize: 75,
          );
          _loadLogos();
          profileRadius = 425;
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SlideTransition(
          position: leftOffset,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                style: style,
                duration: const Duration(seconds: 2, milliseconds: 400),
                curve: Curves.easeInBack,
                child: const Text(
                  'WELCOME!',
                  style: TextStyle(shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 2,
                        offset: Offset(5, 0)),
                    Shadow(
                        color: Colors.black45,
                        blurRadius: 4,
                        offset: Offset(10, 0)),
                  ]),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 125,
                width: 500,
                child: AnimatedList(
                    scrollDirection: Axis.horizontal,
                    key: _animatedListKey,
                    initialItemCount: logos.length,
                    itemBuilder: (context, index, animation) {
                      return SlideTransition(
                        textDirection: TextDirection.rtl,
                        position: animation.drive(
                          Tween(
                            begin: const Offset(1.0, 0.0),
                            end: const Offset(0.0, 0.0),
                          ),
                        ),
                        child: logos[index],
                      );
                    }),
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
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white24,
                        spreadRadius: 2,
                        blurRadius: 5,
                        blurStyle: BlurStyle.normal),
                  ],
                ),
                child: Text(
                  'Software Engineer/Developer',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.blueGrey.shade200,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        Shadow(
                            blurRadius: 2,
                            color: Colors.black,
                            offset: Offset(2, 1))
                      ]),
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
                        shadows: const [
                          Shadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(2, 2))
                        ],
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
                    onTap: _launchLinkedInURL,
                  ),
                  const SizedBox(
                    width: 10,
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
        SlideTransition(
          position: rightOffset,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              LogoImage(
                path: 'assets/images/profile.jpg',
                width: profileRadius,
                height: profileRadius,
              ),
              const SizedBox(height: 10),
              Text(
                'KHUSHANK',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.grey.withAlpha(255),
                      shadows: const [
                        Shadow(
                            color: Colors.blueGrey,
                            blurRadius: 2,
                            offset: Offset(2, 1))
                      ],
                      fontWeight: FontWeight.bold,
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
