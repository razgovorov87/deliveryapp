import 'package:progressivemobileapp/data/api/model/api_product.dart';
import 'package:progressivemobileapp/domain/model/product.dart';

class ProductMapper {
  static Product fromApi(ApiProduct product) {
    return Product(
      title: product.title.toString(),
      imgPath: product.imgPath.toString(),
      price: product.price.toInt(),
    );
  }
}
