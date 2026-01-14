import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/spacing.dart';
import 'package:yumquick/features/login/set_finger_print_view.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(child: Icon(Icons.social_distance_rounded)),
        horizontalSpace(12),
        CircleAvatar(child: Icon(Icons.facebook)),
        horizontalSpace(12),
        CircleAvatar(child: InkWell(onTap: () {
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SetFingerprintView()));
        }, child: Icon(Icons.fingerprint))),
      ],
    );
  }
}
