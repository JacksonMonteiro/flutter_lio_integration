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
    fun ocPayment(paymenteValue: Long) : String {
        var result = ""

        try {
            //  Init and Set order to payment
            LioUtil.getInstance().initOrder()
            LioUtil.getInstance().addItemToPay(paymenteValue)
            LioUtil.getInstance().placeOrder()
            val paymentCode: PaymentCode = PaymentCode.CREDITO_AVISTA

            LioUtil.getInstance().payment(object : PaymentListener {
                override fun onStart() {}
                override fun onPayment(order: Order) {
                    result = "Paid"
                    order.markAsPaid()
                    LioUtil.getInstance().updateOrder(order)
                    Log.d("PaymentManager", "Pago!")
                }

                override fun onCancel() {
                    result = "Cancelled"
                    Log.d("PaymentManager", "Cancelado")
                }

                override fun onError(error: PaymentError) {
                    result = "Error"
                    Log.e("PaymentManager", "Erro ou Negada")
                }
            }, 1, paymentCode)
        } catch (e: Exception) {
            e.printStackTrace()
        }

        return ""
    }

    fun clearOrderManager() {
        LioUtil.getInstance().unBind()
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