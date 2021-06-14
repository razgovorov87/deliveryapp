import 'package:progressivemobileapp/domain/model/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
