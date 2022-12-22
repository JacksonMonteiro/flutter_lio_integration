import 'package:flutter/material.dart';
import 'package:stripe/app/components/button.dart';
import 'package:stripe/app/models/product_model.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: mQuery.size.width,
              height: mQuery.size.height * 0.2,
              child: Image.asset(
                "assets/images/banner.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: mQuery.size.height * 0.12,
              child: SizedBox(
                width: mQuery.size.width,
                height: mQuery.size.height * 0.15,
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: mQuery.size.height * 0.12,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5, color: Colors.grey, spreadRadius: 1)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text("R\$ ${product.price}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue))
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              ButtonApp(txt: "Pagar", onPressed: () {
                
              })
            ],
          ),
        )
      ],
    )));
  }
}
