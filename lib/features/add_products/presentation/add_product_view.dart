import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/add_product_view_body.dart';

import '../../../core/helper_functions/build_error_bar.dart';
import '../../../core/widgets/build_app_bar.dart';
import '../../../core/widgets/custom_progress_hud.dart';
import 'cubit/add_product_cubit.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName='addProductView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Add Product',
      ),
      body: SafeArea(child: BlocConsumer<AddProductCubit, AddProductState>(
        listener: (context, state) {
          if (state is AddProductSuccess) {
            buildBar(context, 'Product added successfully');
          }
          if (state is AddProductFailure) {
            buildBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          return CustomProgressHud(
            isLoading: state is AddProductLoading,
            child: const AddProductViewBody(),
          );
        },
      )
      )
    );
      }
}