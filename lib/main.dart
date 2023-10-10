// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/home.dart';
import 'package:my_portfolio/widgets/appbar_button.dart';

Widget getApp({required Widget app}) {
  return app;
  // if (!kIsWeb) return app;
  // return Center(
  //   child: Container(
  //     decoration: BoxDecoration(
  //       color: Colors.red.shade700,
  //     ),
  //     child: ClipRect(
  //       child: SizedBox(
  //         width: 600,
  //         child: app,
  //       ),
  //     ),
  //   ),
  // );
}

void main() {
  runApp(getApp(app: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget content = const HomeScreen();

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
        body: content,
        appBar: AppBar(
          backgroundColor:
              Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.75),
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
          title: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // GestureDetector(
                //   onTap: () async {
                //     await showDialog(
                //         context: context, builder: (_) => const ImageDialog());
                //   },
                //   child: Container(
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       border: Border.all(
                //         color: Theme.of(context).colorScheme.onPrimary,
                //         width: 2.0,
                //       ),
                //     ),
                //     child: const CircleAvatar(
                //       radius: 24,
                //       backgroundImage: AssetImage('assets/images/profile.jpg'),
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: 20,
                ),
                // Text(
                //   'KHUSHANK',
                //   style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                //         color: Theme.of(context)
                //             .colorScheme
                //             .onPrimary
                //             .withAlpha(200),
                //         fontWeight: FontWeight.bold,
                //         letterSpacing: 2,
                //       ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
