import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/add_products/presentation/add_product_view.dart';
import '../../features/add_products/presentation/cubit/add_product_cubit.dart';
import '../../features/dashboard/dashboard_view.dart';
import '../repos/images_repo/images_repo.dart';
import '../repos/product_repo/product_repo.dart';
import '../services/get_it_service.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) =>BlocProvider(
           create: (context) => AddProductCubit(
             imagesRepo:  getIt.get<ImagesRepo>(),
             productsRepo:getIt.get<ProductsRepo>(),
             ),
               child: const AddProductView()
      )
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}