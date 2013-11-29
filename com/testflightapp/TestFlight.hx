package com.testflightapp;

#if android
import openfl.utils.JNI;
#elseif cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

class TestFlight
{

	public static function takeOff(token:String)
	{
		take_off(token);
	}

	public static function submitFeedback(feedback:String)
	{
		#if !android
		submit_feedback(feedback);
		#end
	}

	public static function remoteLog(value:String)
	{
		remote_log(value);
	}

	public static function passCheckpoint(checkpoint:String)
	{
		pass_checkpoint(checkpoint);
	}

	public static function customInfo(key:String, value:Dynamic)
	{
		#if !android
		custom_info(key, Std.string(value));
		#end
	}

#if android

    private static var take_off        = JNI.createStaticMethod("com/testflightapp/lib/TestFlight", "takeOff", "(Landroid/app/ApplicationLjava/lang/String)");
    private static var pass_checkpoint = JNI.createStaticMethod("com/testflightapp/lib/TestFlight", "passCheckpoint", "(Ljava/lang/String)");
    private static var remote_log      = JNI.createStaticMethod("com/testflightapp/lib/TestFlight", "log", "(Ljava/lang/String)");

#else

    private static var take_off        = Lib.load("testflight", "testflight_take_off", 1);
    private static var submit_feedback = Lib.load("testflight", "testflight_submit_feedback", 1);
    private static var pass_checkpoint = Lib.load("testflight", "testflight_pass_checkpoint", 1);
    private static var custom_info     = Lib.load("testflight", "testflight_custom_info", 2);
    private static var remote_log      = Lib.load("testflight", "testflight_remote_log", 1);

#end
}
