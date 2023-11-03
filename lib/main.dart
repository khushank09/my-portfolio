import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/about.dart';
import 'package:my_portfolio/screens/contact.dart';
import 'package:my_portfolio/screens/home.dart';
import 'package:my_portfolio/size_config.dart';
import 'package:my_portfolio/widgets/appbar_button.dart';

Widget getApp({required Widget app}) {
  return app;
}

void main() {
  runApp(getApp(app: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String screen = 'homeScreen';
  late Widget content;

  void navigateToContactScreen() {
    setState(() {
      screen = 'contactScreen';
    });
  }

  void navigateToHomeScreen() {
    setState(() {
      screen = 'homeScreen';
    });
  }

  void navigateToAboutScreen() {
    setState(() {
      screen = 'aboutScreen';
    });
  }

  void setContent() {
    if (screen == 'contactScreen') {
      content = ContactScreen();
    } else if (screen == 'homeScreen') {
      content = HomeScreen();
    } else if (screen == 'aboutScreen') {
      content = AboutScreen();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenSize.recalculate(context);
    setContent();

    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 63, 63, 63),
        ),
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.mooliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        body: ScaffoldContainer(content),
        appBar: AppBar(
          backgroundColor:
              Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.75),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 9.wb),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBarButton(onTap: navigateToHomeScreen, data: 'Home'),
                  AppBarButton(onTap: navigateToAboutScreen, data: 'About'),
                  AppBarButton(
                      onTap: navigateToContactScreen, data: 'Services'),
                  AppBarButton(
                      onTap: navigateToContactScreen, data: 'Experience'),
                  AppBarButton(onTap: navigateToContactScreen, data: 'Contact'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScaffoldContainer extends StatelessWidget {
  final Widget widget;

  const ScaffoldContainer(
    this.widget, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/home_background.jpg'),
          opacity: 1,
        ),
      ),
      // alignment: Alignment.center,
      height: 100.hb,
      width: 100.wb,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(left: 9.wb, top: 5.hb), child: widget),
          )),
    );
  }
}
