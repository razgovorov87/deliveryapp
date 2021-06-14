import 'package:progressivemobileapp/data/api/api_util.dart';
import 'package:progressivemobileapp/domain/repository/product_data_repository.dart';
import 'package:progressivemobileapp/domain/repository/product_repository.dart';
import 'package:progressivemobileapp/internal/dependencies/api_module.dart';

class RepositoryModule {
  static ProductRepository? _productRepository;

  static ProductRepository? productRepository() {
    if (_productRepository == null) {
      _productRepository = ProductDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _productRepository;
  }
}
