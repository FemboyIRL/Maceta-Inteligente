import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  final SocialMediaModel socialMedia;

  const SocialMediaWidget({super.key, required this.socialMedia});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: socialMedia.onTap, child: socialMedia.child);
  }
}

class SocialMediaModel {
  final Widget child;
  final VoidCallback? onTap;

  SocialMediaModel({required this.child, this.onTap});
}