import 'package:progressivemobileapp/data/api/model/api_product.dart';

class ProductService {
  Future<List<ApiProduct>> getProduct() async {
    final json = {
      'results': {
        {'title': 'Комбо с Воппером Дж.', 'imgPath': 'img1', 'price': 189},
        {'title': 'Воппер с сыром', 'imgPath': 'img2', 'price': 249},
        {
          'title': 'Комбо на двоих с Чизбургером',
          'imgPath': 'img3',
          'price': 399
        },
        {'title': 'Кинг Наггетс (станд.)', 'imgPath': 'img4', 'price': 119},
      }
    };

    var list = json['results']!.map((e) => ApiProduct.fromApi(e)).toList();
    return list;
  }
}
