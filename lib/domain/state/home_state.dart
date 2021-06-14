import 'package:mobx/mobx.dart';
import 'package:progressivemobileapp/domain/model/product.dart';
import 'package:progressivemobileapp/domain/repository/product_repository.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  final ProductRepository? _productRepository;

  HomeStateBase(this._productRepository);

  @observable
  late List<Product> products = [];

  @observable
  bool isLoading = false;

  @action
  Future<void> getProduct() async {
    isLoading = true;
    final data = await _productRepository!.getProducts();
    products = data;
    isLoading = false;
  }
}
