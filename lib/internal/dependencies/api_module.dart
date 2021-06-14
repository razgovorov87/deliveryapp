import 'package:progressivemobileapp/data/api/api_util.dart';
import 'package:progressivemobileapp/data/api/service/product_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil? apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(ProductService());
    }
    return _apiUtil;
  }
}
