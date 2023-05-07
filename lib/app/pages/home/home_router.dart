import 'package:doc_burguer_app/app/pages/home/home_controller.dart';
import 'package:doc_burguer_app/app/pages/home/home_page.dart';
import 'package:doc_burguer_app/app/repositories/products/product_repository.dart';
import 'package:doc_burguer_app/app/repositories/products/product_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductRepository>(
            create: (context) => ProductRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => HomeController(context.read()),
          )
        ],
        child: const HomePage(),
      );
}
