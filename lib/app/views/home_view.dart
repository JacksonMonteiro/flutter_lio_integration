import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const channel = MethodChannel("jacksonmonteiro.space/native");


  Future<void> initSDK() async {
    try {
      var response = await channel.invokeMethod("initSDK");
      print('initSdkResponse: $response');
    } on PlatformException {
      print("Erro no Platform Channel");  
    }
  }


  Future<void> _startPayment() async {
    try {
      final result = await channel.invokeMethod("startPayment");
      print(result);
    } on PlatformException {
      print('Erro no platform Channel');
    }
  }

  @override
  void initState() {
    super.initState();
    initSDK();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _startPayment,
          child: Text('Iniciar pagamento LIO'),
        ),
      )
    );
  }
}
