import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/features/cart/cart_view.dart';
import 'package:yumquick/features/favourite/favourite_view.dart';
import 'package:yumquick/features/home/product_cubit.dart';
import 'package:yumquick/features/home/widgets/home_body.dart';
import 'package:yumquick/features/profile/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> pages = [HomeBody(), FavouriteView(), CartView(), ProfileView()];

  int currentIndex=0;

//BOTTOM NAV
Widget _bottomNav() {
  return  BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourite"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        );
}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsCubit()..getProducts(),
      child: Scaffold(bottomNavigationBar: _bottomNav(),
      body: pages[currentIndex],
      ),
    );
  }
}
