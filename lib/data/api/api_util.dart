import 'package:progressivemobileapp/data/api/service/product_service.dart';
import 'package:progressivemobileapp/data/mapper/product_mapper.dart';
import 'package:progressivemobileapp/domain/model/product.dart';

class ApiUtil {
  final ProductService _productService;

  ApiUtil(this._productService);

  Future<List<Product>> getProduct() async {
    final result = await _productService.getProduct();
    var list = result.map((e) => ProductMapper.fromApi(e)).toList();
    return list;
  }
}
