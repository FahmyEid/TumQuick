import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/features/login/widgets/login_header.dart';


class SetFingerprintView extends StatefulWidget {
  const SetFingerprintView({super.key});

  @override
  _SetFingerprintViewState createState() => _SetFingerprintViewState();
}

class _SetFingerprintViewState extends State<SetFingerprintView> {
  bool isSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: AppColors.yellowBase,
      body: Column(
        children: [
           LoginHeader(text: ' Set Your Finger Print ',),
         
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 50),
                  Icon(
                    Icons.fingerprint,
                    size: 300.sp,
                    color: isSet ? AppColors.orangeBase : Colors.orange[100],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text('Skip'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isSet = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(120, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text('Continue'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
