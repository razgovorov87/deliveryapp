import 'package:progressivemobileapp/domain/state/home_state.dart';
import 'package:progressivemobileapp/internal/dependencies/repository_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(
      RepositoryModule.productRepository(),
    );
  }
}
