import 'package:flutter/services.dart';

abstract class SummaryViewContract {
  void message({required String message});
  void messageError({required String message});
  Future<void> initSDK();
  void initPayment();
}

class SummaryPresenter {
  final SummaryViewContract _contract;
  SummaryPresenter(this._contract);

  // Channel
  static const channel = MethodChannel("jacksonmonteiro.space/native");

  // Inicia a SDK da LIO
  Future<void> initSDK() async {
    try {
      await channel.invokeMethod("initSDK");
    } on PlatformException {
      _contract.messageError(
          message: "Erro ao conectar-se com os servidores da Cielo");
    }
  }

  // Inicia o pagamento na LIO
  Future<void> startPayment() async {
    try {
      final result = await channel.invokeMethod("startPayment");
      if (result) {
        _contract.message(message: "Pagamento realizado com sucesso");
      } else {
        _contract.messageError(message: "O Seu pagamento foi cancelado, negado, ou ocorreu um erro no pagamento");
      }
    } on PlatformException {
      _contract.messageError(message: "Erro ao conectar-se com a LIO");
    }
  }
}
