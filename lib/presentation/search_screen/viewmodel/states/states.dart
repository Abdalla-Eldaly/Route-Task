import '../../../../domain/models/models.dart';
import '../../../base/base_states.dart';

class ProductDataSuccessState extends BaseStates {
  final List<Product> products;

  ProductDataSuccessState({required this.products});
}
