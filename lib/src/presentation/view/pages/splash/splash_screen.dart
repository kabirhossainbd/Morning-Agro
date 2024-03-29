import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harvesthub_agro/src/presentation/view/pages/auth/otp_screen.dart';
import 'package:harvesthub_agro/src/utils/constants/m_colors.dart';
import 'package:harvesthub_agro/src/utils/constants/m_styles.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  initState() {
    _route();
    super.initState();
  }

  void _route() {
    Timer(const Duration(seconds: 2), () async {
      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=> const OtpScreen()), (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration:  BoxDecoration(
               color: MyColor.getSurfaceColor(),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('HarvestHub Agro', style: robotoRegular.copyWith(color: MyColor.colorPrimary, fontSize: 35),),
            ),
          ],
        )
    );
  }
}

