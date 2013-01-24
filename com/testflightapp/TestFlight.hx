package com.testflightapp;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

class TestFlight
{

	public static function takeOff(token:String, testing:Bool=false)
	{
		take_off(token, testing);
	}

	public static function submitFeedback(feedback:String)
	{
		submit_feedback(feedback);
	}

	public static function openFeedbackView()
	{
		open_feedback_view();
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
		custom_info(key, Std.string(value));
	}

	private static var take_off = Lib.load("testflight", "testflight_take_off", 2);
	private static var submit_feedback = Lib.load("testflight", "testflight_submit_feedback", 1);
	private static var open_feedback_view = Lib.load("testflight", "testflight_open_feedback_view", 0);
	private static var pass_checkpoint = Lib.load("testflight", "testflight_pass_checkpoint", 1);
	private static var custom_info = Lib.load("testflight", "testflight_custom_info", 2);
	private static var remote_log = Lib.load("testflight", "testflight_remote_log", 1);
}