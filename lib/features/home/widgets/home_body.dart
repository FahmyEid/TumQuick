import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/utils/spacing.dart';
import 'package:yumquick/features/home/product_cubit.dart';
import 'package:yumquick/features/home/product_model.dart';
import 'package:yumquick/features/home/product_state.dart';
import 'package:yumquick/features/home/widgets/header_of_home_view.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
  
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await context.read<ProductsCubit>().getProducts();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                HeaderOfHomeView(),
                verticalSpace(16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Text(
                        "BestSeller",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(color: AppColors.orangeBase),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(8),
                _productsHorizontal(),
                verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Align(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      "Recommend",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                verticalSpace(8),
                _productsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= HORIZONTAL LIST =================
  Widget _productsHorizontal() {
    return SizedBox(
      height: 200.h,
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return _shimmerHorizontal();
          }
          if (state is ProductsError) {
            return Center(child: Text(state.message));
          }
          if (state is ProductsSuccess) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              separatorBuilder: (_, __) => horizontalSpace(12),
              itemBuilder: (_, i) => SizedBox(
                width: 160.w,
                child: _productCard(state.products[i]),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  // GRID
  Widget _productsGrid() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return _shimmerGrid();
        }
        if (state is ProductsSuccess) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (_, i) => _productCard(state.products[i]),
          );
        }
        return const SizedBox();
      },
    );
  }

  // SHIMMER
  Widget _shimmerHorizontal() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(width: 12),
      itemBuilder: (_, i) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _shimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (_, i) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  //  CARD
  Widget _productCard(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: product.img != null && product.img!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl:
                        "https://rehabko.abdaealmasi.store/${product.img}",
                    height: 120,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(height: 120, color: Colors.grey[300]),
                    errorWidget: (context, url, error) => Container(
                      height: 120,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error),
                    ),
                  )
                : Container(
                    height: 120,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? "No name",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "${product.price ?? 0} EGP",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  
}
