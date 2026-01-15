import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/features/home/product_services.dart';
import 'package:yumquick/features/home/product_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());

    try {
      final products = await ProductsService.fetchProducts();
      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsError('Something went wrong'));
    }
  }
}
