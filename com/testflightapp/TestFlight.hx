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
		init();
		
		#if android
		take_off(get_app(get_activity()), token);
		#else
		take_off(token);
		#end
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
	
	private static function init()
	{
		if (isInit)
			return;
			
#if android

		// Helper
		get_app 				= JNI.createStaticMethod("TFHelper", "getApp", "(Lorg/haxe/lime/GameActivity;)Landroid/app/Application;");
		get_activity			= JNI.createStaticMethod ("org.haxe.lime.GameActivity", "getInstance", "()Lorg/haxe/lime/GameActivity;");
		
		take_off				= JNI.createStaticMethod("com/testflightapp/lib/TestFlight", "takeOff", "(Landroid/app/Application;Ljava/lang/String;)V");
		pass_checkpoint 	= JNI.createStaticMethod("com/testflightapp/lib/TestFlight", "passCheckpoint", "(Ljava/lang/String;)V");
		remote_log			= JNI.createStaticMethod("com/testflightapp/lib/TestFlight", "log", "(Ljava/lang/String;)V");

#else

		take_off        		= Lib.load("testflight", "testflight_take_off", 1);
		submit_feedback	= Lib.load("testflight", "testflight_submit_feedback", 1);
		pass_checkpoint	= Lib.load("testflight", "testflight_pass_checkpoint", 1);
		custom_info			= Lib.load("testflight", "testflight_custom_info", 2);
		remote_log			= Lib.load("testflight", "testflight_remote_log", 1);

#end
	}
	
	private static var isInit:Bool;
	
	private static var take_off:Dynamic;
    private static var submit_feedback:Dynamic;
    private static var pass_checkpoint:Dynamic;
	
	// iOS only
    private static var custom_info:Dynamic;
    private static var remote_log:Dynamic;
	
	// Android helpers
	private static var get_app:Dynamic;
	private static var get_activity:Dynamic;

}
