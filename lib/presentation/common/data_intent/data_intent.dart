import 'package:route_task/domain/models/models.dart';

class DataIntent {
  DataIntent._();

  // search screen
  static Stream<List<Product>>? _productStream;

  static void pushSearchStream(Stream<List<Product>> productStream) =>
      _productStream = productStream;
}
