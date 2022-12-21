import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreateOrder extends StatefulWidget {
  static const routerName = "/create";
  const CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  child: Image.asset("assets/images/banner.png",
                  fit: BoxFit.cover,
                ),
              ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}