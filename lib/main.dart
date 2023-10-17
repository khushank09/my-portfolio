import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/contact.dart';
import 'package:my_portfolio/screens/home.dart';
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
  Widget content = const HomeScreen();

  Widget scaffoldContainer(Widget child) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/home_background.jpg'),
          opacity: 1,
        ),
      ),
      // alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 200),
      child: child,
    );
  }

  void navigateToContactScreen() {
    setState(() {
      content = const ContactScreen();
    });
  }
  void navigateToHomeScreen() {
    setState(() {
      content = const HomeScreen();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        body: scaffoldContainer(content),
        appBar: AppBar(
          backgroundColor:
              Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.75),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBarButton(onTap: navigateToHomeScreen, data: 'Home'),
                  AppBarButton(onTap: navigateToContactScreen, data: 'About'),
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
