package com.privaterouter.crypto_plugin.pgp

import KeyDescription
import org.bouncycastle.openpgp.PGPPublicKey
import java.io.*

open class PgpApi {
    private val pgp = Pgp()
    private var publicKey: String? = null
    private var privateKey: String? = null
    private var tempFile: File? = null

    fun getKeyDescription(key: String): KeyDescription {
        return pgp.getEmailFromKey(ByteArrayInputStream(key.toByteArray()))
    }

    fun setPrivateKey(key: String?) {
        privateKey = key
    }

    fun setPublicKey(key: String?) {
        publicKey = key
    }

    fun setTempFile(filePath: String?) {
        tempFile =
                filePath?.let {
                    File(it).apply {
                        createNewFile()
                        assert(isFile)
                        assert(canWrite())
                    }
                }

    }

    fun getProgress(): Progress? {
        return if (pgp.progress?.complete == false) {
            pgp.progress
        } else {
            null
        }
    }

    private fun decrypt(inputStream: InputStream, outputStream: OutputStream, password: String, length: Long, checkSign: Boolean) {
        if (checkSign) {
            assert(publicKey != null)
        }
//        pgp.decrypt(inputStream, outputStream, ByteArrayInputStream(privateKey!!.toByteArray()), password.toCharArray(), length)
        pgp.decrypt(inputStream, outputStream, privateKey, password, length, if (checkSign) {
            publicKey
        } else {
            null
        }
        )

    }

    fun decryptBytes(array: ByteArray, password: String, checkSign: Boolean = false): ByteArray {
        val outStream = ByteArrayOutputStream()
        decrypt(ByteArrayInputStream(array), outStream, password, array.size.toLong(), checkSign)
        return outStream.toByteArray()
    }


    fun decryptFile(inputFilePath: String, outputFilePath: String, password: String, checkSign: Boolean = false) {
        val inputFile = File(inputFilePath)
        val outputFile = File(outputFilePath)
        assert(inputFile.isFile)
        assert(inputFile.exists())
        outputFile.createNewFile()
        assert(outputFile.isFile)
        assert(outputFile.canWrite())
        decrypt(FileInputStream(inputFile), FileOutputStream(outputFile), password, inputFile.length(), checkSign)

    }

    private fun encrypt(outputStream: OutputStream, inputStream: InputStream, length: Long, password: String, sign: Boolean) {
        if (sign) {
            assert(privateKey != null)
        }
        pgp.encrypt(
                outputStream,
                inputStream,
                publicKey,
                if (sign) {
                    privateKey
                } else {
                    null
                },
                password,
                length
        )
    }

    fun encriptFile(inputFilePath: String, outputFilePath: String, sign: Boolean = false, password: String = "") {
        val inputFile = File(inputFilePath)
        val outputFile = File(outputFilePath)
        assert(inputFile.isFile)
        assert(inputFile.exists())
        assert(inputFile.canRead())
        outputFile.createNewFile()
        assert(outputFile.isFile)
        assert(outputFile.canWrite())
        encrypt(FileOutputStream(outputFile), FileInputStream(inputFile), inputFile.length(), password, sign)
    }

    fun encriptBytes(array: ByteArray, sign: Boolean = false, password: String = ""): ByteArray {
        val outStream = ByteArrayOutputStream()
        encrypt(outStream, ByteArrayInputStream(array), array.size.toLong(), password, sign)
        return outStream.toByteArray()
    }

    fun createKeys(length: Int, email: String, password: String): List<String> {
        return pgp.createKeys(length, email, password).mapIndexed { i, it ->
            it.toString(Charsets.UTF_8)
        }
    }


    fun decryptSymmetric(inputStream: InputStream, outputStream: OutputStream, password: String, sign: Boolean) {
        pgp.symmetricallyDecrypt(inputStream, outputStream, password, if (sign) {
            assert(publicKey != null)
            publicKey
        } else {
            null
        })
    }

    fun encryptSymmetric(inputStream: InputStream, outputStream: OutputStream, length: Long, password: String, keyPassword: String?) {
        assert(tempFile != null)
        pgp.symmetricallyEncrypt(
                inputStream,
                outputStream,
                tempFile!!,
                length,
                password,
                if (keyPassword != null) {
                    assert(privateKey != null)
                    privateKey
                } else {
                    null
                },
                keyPassword
        )
    }

    fun encryptSymmetricBytes(array: ByteArray, password: String, keyPassword: String? = null): ByteArray {
        val outStream = ByteArrayOutputStream()
        encryptSymmetric(ByteArrayInputStream(array), outStream, array.size.toLong(), password, keyPassword)
        return outStream.toByteArray()
    }

    fun encryptSymmetricFile(inputFilePath: String, outputFilePath: String, password: String, keyPassword: String? = null) {
        val inputFile = File(inputFilePath)
        val outputFile = File(outputFilePath)
        assert(inputFile.isFile)
        assert(inputFile.exists())
        assert(inputFile.canRead())
        outputFile.createNewFile()
        assert(outputFile.isFile)
        assert(outputFile.canWrite())
        encryptSymmetric(FileInputStream(inputFile), FileOutputStream(outputFile), inputFile.length(), password, keyPassword)
    }

    fun decryptSymmetricBytes(array: ByteArray, password: String, checkSign: Boolean = false): ByteArray {
        val outStream = ByteArrayOutputStream()
        decryptSymmetric(ByteArrayInputStream(array), outStream, password, checkSign)
        return outStream.toByteArray()
    }

    fun decryptSymmetricFile(inputFilePath: String, outputFilePath: String, password: String, checkSign: Boolean = false) {
        val inputFile = File(inputFilePath)
        val outputFile = File(outputFilePath)
        assert(inputFile.isFile)
        assert(inputFile.exists())
        outputFile.createNewFile()
        assert(outputFile.isFile)
        assert(outputFile.canWrite())
        decryptSymmetric(FileInputStream(inputFile), FileOutputStream(outputFile), password, checkSign)
    }
}