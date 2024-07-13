import 'package:dartz/dartz.dart';
import 'package:route_task/data/network/failure.dart';
import 'package:route_task/domain/models/models.dart';
import 'package:route_task/domain/repository/repository.dart';
import 'package:route_task/domain/usecase/base_usecase.dart';

abstract class HomeUseCase extends BaseUseCase<void ,ProductObject>{
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, ProductObject>> call(void input)async{
    return await _repository.getProductData();
  }

}