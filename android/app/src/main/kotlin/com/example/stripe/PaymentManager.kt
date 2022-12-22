package com.example.stripe

import android.util.Log
import cielo.orders.domain.Order
import cielo.sdk.order.payment.PaymentCode
import cielo.sdk.order.payment.PaymentError
import cielo.sdk.order.payment.PaymentListener


//
// Created by Jackson Monteiro on 20/12/2022
//

class PaymentManager {
    fun ocPayment(paymenteValue: Long, result: io.flutter.plugin.common.MethodChannel.Result) {
        try {
            //  Init and Set order to payment
            LioUtil.getInstance().initOrder()
            LioUtil.getInstance().addItemToPay(paymenteValue)
            LioUtil.getInstance().placeOrder()
            val paymentCode: PaymentCode = PaymentCode.CREDITO_AVISTA

            LioUtil.getInstance().payment(object : PaymentListener {
                override fun onStart() {}
                override fun onPayment(order: Order) {
                    Log.d("PaymentManager", "Pago!")

                    order.markAsPaid()
                    LioUtil.getInstance().updateOrder(order)
                    result.success(true)
                }

                override fun onCancel() {
                    Log.d("PaymentManager", "Cancelado")
                    result.success(false)
                }

                override fun onError(error: PaymentError) {
                    Log.e("PaymentManager", "Erro ou Negada")
                    result.success(false)

                }
            }, 1, paymentCode)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    companion object {
        var instance: PaymentManager? = null

        @JvmName("getInstance1")
        fun getInstance() : PaymentManager {
            if (instance == null) {
                instance = PaymentManager()
            }

            return instance as PaymentManager
        }
    }
}