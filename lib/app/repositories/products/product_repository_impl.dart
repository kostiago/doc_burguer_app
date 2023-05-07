import 'package:dio/dio.dart';
import 'package:doc_burguer_app/app/core/rest_client/custom_dio.dart';
import 'package:doc_burguer_app/app/models/product_model.dart';
import 'dart:developer' as developer;
import '../../core/exceptions/repository_exception.dart';
import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio dio;

  ProductRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      developer.log('Erro ao buscar produto', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar Produto');
    }
  }
}
