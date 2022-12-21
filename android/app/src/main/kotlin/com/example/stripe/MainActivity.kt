package com.example.stripe

import android.util.Log
import io.flutter.embedding.android.FlutterActivity

// Stripe imports
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    val CHANNEL = "jacksonmonteiro.space/native"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "initSDK" -> {
                    Log.d("MainActivity", "initSDK Called")
                    Log.d("MainActivity", "Value: ${LioUtil.getInstance().initSDK(this)}")
                    if (LioUtil.getInstance().initSDK(this)) {
                        Log.d("MainActivity", "InitSDK return true")
                    }

                    result.success(
                        LioUtil.getInstance().initSDK(this)
                    )
                }
                "startPayment" -> {
                    Log.d("MainActivity", PaymentManager.getInstance().ocPayment(100).toString())
                    result.success(
                        PaymentManager.getInstance().ocPayment(100)
                    )
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}