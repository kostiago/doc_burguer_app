import 'package:doc_burguer_app/app/core/provider/application_binding.dart';
import 'package:doc_burguer_app/app/core/ui/theme/theme_config.dart';
import 'package:doc_burguer_app/app/pages/auth/login_page.dart';
import 'package:doc_burguer_app/app/pages/home/home_router.dart';
import 'package:doc_burguer_app/app/pages/product_detail/product_detail_router.dart';
import 'package:doc_burguer_app/app/pages/register/sigin_page.dart';
import 'package:doc_burguer_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class SeuBurguer extends StatelessWidget {
  const SeuBurguer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Seu Burguer',
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => const LoginPage(),
          '/auth/register': (context) => const SiginPage(),
        },
      ),
    );
  }
}
