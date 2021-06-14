import 'package:progressivemobileapp/data/api/api_util.dart';
import 'package:progressivemobileapp/domain/model/product.dart';
import 'package:progressivemobileapp/domain/repository/product_repository.dart';

class ProductDataRepository extends ProductRepository {
  final ApiUtil? _apiUtil;

  ProductDataRepository(this._apiUtil);

  @override
  Future<List<Product>> getProducts() {
    return _apiUtil!.getProduct();
  }
}
