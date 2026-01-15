import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/features/home/product_cubit.dart';
import 'package:yumquick/features/on_boarding/on_boarding.dart';

void main() {
  runApp(YumQuick());
}

class YumQuick extends StatelessWidget {
  const YumQuick({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => ProductsCubit()..getProducts(),
        child: MaterialApp(home: OnBoarding()),
      ),
    );
  }
}
