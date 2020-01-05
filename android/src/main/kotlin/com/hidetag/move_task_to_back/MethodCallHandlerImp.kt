package com.hidetag.move_task_to_back

import android.app.Activity
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * author: lixin(<a href="mailto:lixin@goldenridge.ltd">lixin@goldenridge.ltd</a>)<br/>
 * version: 1.0.0<br/>
 * since: 2020-01-05 15:19<br/>
 *
 * <p>
 * 内容描述区域
 * </p>
 */
class MethodCallHandlerImp : MethodChannel.MethodCallHandler {

    private var activity: java.lang.ref.WeakReference<Activity>? = null

    fun setActivity(activity: Activity) {
        this.activity = java.lang.ref.WeakReference(activity)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val nonRoot: Boolean? = call.argument<Boolean>("nonRoot")
        if (activity == null || activity!!.get() == null) {
            Log.i("hidetag", "android: moveTaskToBack: activity = null")
            result.error("activity can't be null", call.method, Exception("activity can't be null"))
        } else {
            try {
                if (call.method == "moveTaskToBack") {
                    // 当 nonRoot 为 false 时，当前 activity 必须为栈底，也就是最底层的 activity，
                    // 如果其他 activity 没有及时 finish 掉，就会出现异常，导致崩溃等情况的发生；
                    // nonRoot 为 true 时，不需要考虑当前 activity 是否在栈底。
                    activity!!.get()!!.moveTaskToBack(nonRoot ?: true)
                    Log.i("hidetag", "android: moveTaskToBack: $nonRoot")
                    result.success("")
                } else {
                    Log.i("hidetag", "android: moveTaskToBack: notImplemented")
                    result.notImplemented()
                }
            } catch (e: Exception) {
                Log.i("hidetag", "android: moveTaskToBack: exception")
                result.error("操作失败", call.method, e)
            }
        }
    }

    fun release() {
        if (activity != null) {
            activity = null
        }
    }

}