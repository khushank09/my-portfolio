import 'package:flutter/material.dart';
import 'package:my_portfolio/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

var myEmail = 'khushankmadaan2k@gmail.com';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  var isHoveringEmail = false;

  void _launchEmailApp() async{
    Uri url = Uri.parse('mailto:$myEmail');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 4.5.hb),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               Text(
                'Email : ',
                style: TextStyle(fontSize: 3.rb, color: Colors.white),
              ),
              GestureDetector(
                onTap: _launchEmailApp,
                child: MouseRegion(
                  cursor: MaterialStateMouseCursor.clickable,
                  onEnter: (event) {
                    setState(() {
                      isHoveringEmail = true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      isHoveringEmail = false;
                    });
                  },
                  child: Text(
                    myEmail,
                    style: TextStyle(
                        fontSize: 3.rb,
                        color: isHoveringEmail ? Colors.blueAccent : Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
