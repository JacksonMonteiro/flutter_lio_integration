import 'package:flutter/material.dart';
import 'package:stripe/app/components/button.dart';
import 'package:stripe/app/components/dialog_message.dart';
import 'package:stripe/app/components/dialog_message_error.dart';
import 'package:stripe/app/models/product_model.dart';
import 'package:stripe/app/presenters/summary_presenter.dart';

class SummaryView extends StatefulWidget {
  const SummaryView({super.key});

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> implements SummaryViewContract {
  late SummaryPresenter _presenter;
  
  @override
  void initState() {
    super.initState();
    _presenter = SummaryPresenter(this);
    initSDK();
  }

  @override
  void message({required String message}) {
     showDialog(
        context: context,
        builder: (context) => DialogMessage(
              message: message,
            ));
  }

  @override
  void messageError({required String message}) {
    showDialog(
        context: context,
        builder: (context) => DialogMessageError(
              message: message,
            ));
  }

  @override
  Future<void> initSDK() async {
    await _presenter.initSDK();
  }

  @override
  void initPayment() async {
    await _presenter.startPayment();
  }

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
              ButtonApp(txt: "Pagar", onPressed: initPayment)
            ],
          ),
        )
      ],
    )));
  }
}
