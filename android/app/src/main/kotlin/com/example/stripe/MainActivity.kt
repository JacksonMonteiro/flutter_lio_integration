package com.example.stripe

// Cielo Imports
import cielo.orders.domain.Credentials
import cielo.orders.domain.Order
import cielo.orders.domain.ResultOrders
import cielo.sdk.order.OrderManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    val CHANNEL = "jacksonmonteiro.space/native"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "initSDK" -> {
                        LioUtil.getInstance().initSDK(this, result)
                    }
                    "startPayment" -> {
                        PaymentManager.getInstance().ocPayment(100, result)
                    }
                    "unbind" -> {
                        LioUtil.getInstance().unBind(result)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }
}