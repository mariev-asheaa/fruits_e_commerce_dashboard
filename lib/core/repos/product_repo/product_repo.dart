import 'package:dartz/dartz.dart';

import '../../../features/add_products/domain/entities/product_entity.dart';
import '../../errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity addProductInputEntity);
}