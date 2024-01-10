package com.example.stripe

import android.content.Context
import android.util.Log
import cielo.orders.domain.CheckoutRequest
import cielo.orders.domain.Credentials
import cielo.orders.domain.Order
import cielo.orders.domain.ResultOrders
import cielo.sdk.order.OrderManager
import cielo.sdk.order.ServiceBindListener
import cielo.sdk.order.payment.PaymentCode
import cielo.sdk.order.payment.PaymentListener
import io.flutter.plugin.common.MethodChannel
import java.util.*
import kotlin.Boolean
import kotlin.Exception
import kotlin.Int
import kotlin.Long
import kotlin.Throwable
import kotlin.Throws


//
// Created by Jackson Monteiro on 20/12/2022
//

class LioUtil {
    private lateinit var orderManager: OrderManager
    private lateinit var credentials: Credentials
    private lateinit var resultOrders: ResultOrders
    private lateinit var order: Order

    fun initSDK(context: Context?, result: MethodChannel.Result) {
        /*======================= Credenciais ======================*/
        credentials =
            Credentials("", "")
        /*======================= Criando OrderManager ======================*/orderManager =
            OrderManager(
                credentials,
                context!!
            )
        val serviceBindListener: ServiceBindListener = object : ServiceBindListener {
            override fun onServiceBoundError(throwable: Throwable) {
                Log.e("onServiceBoundError", throwable.message!!)
                //Ocorreu um erro ao tentar se conectar com o serviço OrderManager
            }

            override fun onServiceBound() {
                //Você deve garantir que sua aplicação se conectou com a LIO a partir desse listener
                //A partir desse momento você pode utilizar as funções do OrderManager, caso contrário uma exceção será lançada.

                Log.e("onServiceBound", "Conectado")
                setResultOrders(orderManager.retrieveOrders(200, 0)!!)
                result.success(true)
            }

            override fun onServiceUnbound() {
                // O serviço foi desvinculado
                Log.e("onServiceUnBound", "Desconectado")
            }
        }
        orderManager.bind(context, serviceBindListener)
    }

    fun setResultOrders(resultOrders: ResultOrders) {
        this.resultOrders = resultOrders
    }

    @Throws(Exception::class)
    fun initOrder() {
        order = orderManager.createDraftOrder(UUID.randomUUID().toString())!!
    }

    @Throws(Exception::class)
    fun addItemToPay(value: Long) {
        order.addItem(
            "01",
            "Transação Flutter",
            value,
            1,
            "UNIDADE"
        )
    }

    fun placeOrder() {
        orderManager.placeOrder(order)
    }

    @Throws(java.lang.Exception::class)
    fun payment(callbackPayment: PaymentListener?, installments: Int, paymentCode: PaymentCode) {
        val request: CheckoutRequest = CheckoutRequest.Builder()
            .orderId(order.id)
            .amount(order.price)
            .installments(installments)
            .paymentCode(paymentCode)
            .build()
        orderManager.checkoutOrder(request, callbackPayment!!)
    }

    fun unBind(result: MethodChannel.Result) {
        orderManager.unbind()
        result.success(true)
    }

    fun updateOrder(order: Order?) {
        this.order = order!!
        orderManager.updateOrder(this.order)
    }

    companion object {
        var instance: LioUtil? = null

        @JvmName("getInstance1")
        fun getInstance() : LioUtil {
            if (instance == null) {
                instance = LioUtil()
            }

            return instance as LioUtil
        }
    }
}
