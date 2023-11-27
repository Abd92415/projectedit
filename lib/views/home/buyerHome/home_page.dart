import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:graduation_project/views/home/buyerHome/component/pageNav/cartBuyer.dart';
import 'package:graduation_project/views/home/buyerHome/component/pageNav/homeBuyer.dart';
import 'package:graduation_project/views/home/buyerHome/component/pageNav/item_select.dart';
import 'package:graduation_project/views/home/buyerHome/component/pageNav/notification.dart';
import 'package:graduation_project/views/home/buyerHome/component/pageNav/profileBuyer.dart';
import '../bodyhome/body.dart';
import 'package:flutter/material.dart';

class PageHomeBuyer extends StatefulWidget {
  const PageHomeBuyer({super.key});

  @override
  State<PageHomeBuyer> createState() => _PageHomeBuyerState();
}

class _PageHomeBuyerState extends State<PageHomeBuyer> {
  int indexPage = 0;
  List<Widget> pageNav = const [
    HomePageBuyer(),
    ItemSelectBuyer(),
    // NotificationPageBuyer(),
    CartPageBuyer(),
    ProfilePageBuyer()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: bulidAppBar(context),
        // body: const Body(),
        body: pageNav[indexPage],

        bottomNavigationBar: covexBottomNav(),
      ),
    );
  }

  AppBar bulidAppBar(context) {
    return AppBar(
      title: searchText(context),
      centerTitle: true,
    );
  }

  Container searchText(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      width: MediaQuery.of(context).size.width / 2,
      child: const TextField(
        decoration:
            InputDecoration(hintText: 'Search', icon: Icon(Icons.search)),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }

  ConvexAppBar covexBottomNav() {
    return ConvexAppBar(
      backgroundColor: Colors.blue,
      shadowColor: Colors.red,
      elevation: 10,
      initialActiveIndex: indexPage,
      items: [
        TabItem(
            icon: Icon(Icons.home,
                size: 25, color: indexPage == 0 ? Colors.red : Colors.white),
            title: 'Home'),
        TabItem(
            icon: Icon(Icons.favorite,
                size: 25, color: indexPage == 1 ? Colors.red : Colors.white),
            title: 'favorite'),
        // TabItem(icon: Icons.notifications, title: 'Notification'),
        TabItem(
            icon: Icon(Icons.shopping_cart,
                size: 25, color: indexPage == 2 ? Colors.red : Colors.white),
            title: 'cart'),
        TabItem(
            icon: Icon(Icons.person,
                size: 25, color: indexPage == 3 ? Colors.red : Colors.white),
            title: 'Profile')
      ],
      onTap: (int value) {
        setState(() {
          indexPage = value;
        });
      },
    );
  }
}
