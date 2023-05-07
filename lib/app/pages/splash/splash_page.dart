import 'package:doc_burguer_app/app/core/ui/helpers/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widget/delivery_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.10),
                  ),
                  Image.asset(
                    'assets/images/burguer.png',
                    height: context.percentHeight(.50),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DeliveryButton(
                    width: context.percentWidth(.6),
                    height: 50,
                    label: 'ENTRAR',
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
