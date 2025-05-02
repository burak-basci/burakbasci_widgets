import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLTextButton extends StatelessWidget {
  const URLTextButton({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Row(
        children: <Widget>[
          Text(
            url,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.0,
              // color: Get.theme.primaryColor
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, top: 1.0),
            child: Icon(
              Icons.open_in_new,
              size: 12,
              // color: Get.theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
