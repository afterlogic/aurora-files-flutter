package com.privaterouter.crypto_plugin

import android.annotation.SuppressLint
import com.privaterouter.crypto_plugin.aes.Aes
import com.privaterouter.crypto_plugin.pgp.PgpApi
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.reactivex.*
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.internal.schedulers.SingleScheduler

class CryptoPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "crypto_plugin")
      channel.setMethodCallHandler(CryptoPlugin())
    }
  }

  private var pgp = PgpApi()
  private var getterScheduler: Scheduler = SingleScheduler()
  private var executionScheduler: Scheduler = SingleScheduler()

  @SuppressLint("CheckResult")
  override fun onMethodCall(call: MethodCall, result: Result) {

    val arguments = call.arguments as List<*>
    val route = call.method.split(".")
    val algorithm = route.first()
    val method = route.last()

    println("$algorithm.$method")

    Single.create<Any> {
      try {
        it.onSuccess(execute(algorithm, method, arguments))
      } catch (e: Throwable) {
        it.onError(e)
      }
    }
            .subscribeOn(if (arguments.isEmpty()) getterScheduler else executionScheduler)
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe({
              result.success(it)
            }, {
              if (it is NotImplemented) {
                result.notImplemented()
              } else {
                result.error("", it.message, "")
              }
            })

  }

  private fun execute(algorithm: String, method: String, arguments: List<*>): Any {
    when (algorithm) {
      "aes" -> {
        val fileData = arguments[0] as ByteArray
        val rawKey = arguments[1] as String
        val iv = arguments[2] as String
        val isLast = arguments[3] as Boolean
        val isDecrypt = method == "decrypt"

        return Aes.performCryption(fileData, rawKey, iv, isLast, isDecrypt)
      }
      "pgp" -> {
        when (method) {
          "clear" -> {
            pgp = PgpApi()
            return ""
          }
          "getProgress" -> {
            val progress = pgp.getProgress()
            return if (progress == null) {
              ""
            } else {
              arrayListOf(progress.total, progress.current)
            }

          }
          "setTempFile" -> {
            val tempFile = arguments[0] as String?
            pgp.setTempFile(tempFile)
            return ""
          }
          "setPrivateKey" -> {
            val privateKey = arguments[0] as String?
            pgp.setPrivateKey(privateKey)
            return ""
          }
          "setPublicKey" -> {
            val publicKey = arguments[0] as String?
            pgp.setPublicKey(publicKey)
            return ""
          }
          "decryptBytes" -> {
            val array = arguments[0] as ByteArray
            val password = arguments[1] as String
            return pgp.decryptBytes(array, password)

          }
          "decryptFile" -> {
            val inputFile = arguments[0] as String
            val outputFile = arguments[1] as String
            val password = arguments[2] as String
            pgp.decryptFile(inputFile, outputFile, password)
            return ""
          }
          "encryptFile" -> {
            val inputFile = arguments[0] as String
            val outputFile = arguments[1] as String
            pgp.encriptFile(inputFile, outputFile)
            return ""
          }
          "encryptBytes" -> {
            val text = arguments[0] as ByteArray
            return pgp.encriptBytes(text)

          }
        }
      }
    }
    throw  NotImplemented()
  }

  private class NotImplemented : Throwable()

}