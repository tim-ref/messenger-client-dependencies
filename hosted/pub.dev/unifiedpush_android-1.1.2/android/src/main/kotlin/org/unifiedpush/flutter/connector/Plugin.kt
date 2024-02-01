package org.unifiedpush.flutter.connector

import android.content.Context
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONArray
import org.unifiedpush.android.connector.UnifiedPush

private const val TAG = "Plugin"

class Plugin : FlutterPlugin, MethodCallHandler {
    private var mContext : Context? = null

    companion object {
        var pluginChannel: MethodChannel? = null
        private var up = UnifiedPush

        @JvmStatic
        private fun getDistributors(context: Context,
                                    args: ArrayList<String>?,
                                    result: Result?){
            val features = parseFeatures(args?.get(0))
            val distributors = up.getDistributors(context, features = features)
            result?.success(distributors)
        }

        @JvmStatic
        private fun getDistributor(context: Context,
                                   result: Result?) {
            val distributor = up.getDistributor(context)
            result?.success(distributor)
        }

        @JvmStatic
        private fun saveDistributor(context: Context,
                                    args: ArrayList<String>?,
                                    result: Result?) {
            val distributor = args!![0]
            up.saveDistributor(context, distributor)
            result?.success(true)
        }

        @JvmStatic
        private fun registerApp(context: Context,
                                args: ArrayList<String>?,
                                result: Result?) {
            val instance = args?.get(0)
            val features = parseFeatures(args?.get(1))
            Log.d(TAG, "registerApp: instance=$instance")
            if (instance.isNullOrBlank()) {
                up.registerApp(context, features = features)
            } else {
                up.registerApp(context, instance, features = features)
            }
            result?.success(true)
        }

        @JvmStatic
        private fun unregister(context: Context,
                               args: ArrayList<String>?,
                               result: Result) {
            val instance = args?.get(0)
            Log.d(TAG, "unregisterApp: instance=$instance")
            if (instance.isNullOrEmpty()) {
                up.unregisterApp(context)
            } else {
                up.unregisterApp(context, instance)
            }
            result.success(true)
        }

        @JvmStatic
        private fun parseFeatures(arg: String?): ArrayList<String> {
            val jsonArray = JSONArray(arg ?: "[]")
            val knownFeatures = arrayOf(up.FEATURE_BYTES_MESSAGE)
            return (0 until jsonArray.length()).mapNotNull {
                val feature = jsonArray.getString(it)
                if (knownFeatures.contains(feature)) {
                    feature
                } else {
                    null
                }
            } as ArrayList<String>
        }
    }

    fun getChannel(): MethodChannel? {
        return pluginChannel
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        Log.d(TAG, "onAttachedToEngine")
        mContext = binding.applicationContext
        pluginChannel = MethodChannel(binding.binaryMessenger, PLUGIN_CHANNEL)
        pluginChannel?.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        Log.d(TAG, "onDetachedFromEngine")
        pluginChannel?.setMethodCallHandler(null)
        pluginChannel = null
        mContext = null
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        Log.d(TAG, "Method: ${call.method}")
        val args = call.arguments<ArrayList<String>>()
        when(call.method) {
            PLUGIN_EVENT_GET_DISTRIBUTORS -> getDistributors(mContext!!, args, result)
            PLUGIN_EVENT_GET_DISTRIBUTOR -> getDistributor(mContext!!, result)
            PLUGIN_EVENT_SAVE_DISTRIBUTOR -> saveDistributor(mContext!!, args, result)
            PLUGIN_EVENT_REGISTER_APP -> registerApp(mContext!!, args, result)
            PLUGIN_EVENT_UNREGISTER -> unregister(mContext!!, args, result)
            else -> result.notImplemented()
        }
    }
}
