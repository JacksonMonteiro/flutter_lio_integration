// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stripe/app/components/button.dart';
import 'package:stripe/app/presenters/home_presenter.dart';
import 'package:stripe/app/utils/router.dart';
import 'package:stripe/app/views/create_order_view.dart';

class HomeView extends StatefulWidget {
  static const routerName = "/home";
  const HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> implements HomeContract{

  late HomePresenter homePresenter;


  @override
  void initState() {
    super.initState();
    //initSDK();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.black,
            child: Image.asset(
              'assets/images/inicio_back.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  //physics: ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      ButtonApp(txt: "Criar pedido", onPressed: () {
                        Navigator.of(context).pushNamed(Routes.CREATE_ORDER_VIEW_ROUTE);
                      }),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      
    );
  }
  
}
