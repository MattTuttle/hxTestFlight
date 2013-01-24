import com.testflightapp.TestFlight;

import flash.events.Event;

class Example extends flash.display.Sprite
{

	public function new()
	{
		super();
		addEventListener (Event.ADDED_TO_STAGE, onAddedToStage);
	}

	private function init()
	{
		TestFlight.takeOff("7adecb48-85c8-485a-86ef-4f56bdb45132");
		TestFlight.passCheckpoint("check1");
		TestFlight.remoteLog("Hello world");
		TestFlight.submitFeedback("This is a comment about the app");
		TestFlight.customInfo("foo", ["bar", 1]);
	}

	private function onAddedToStage(e:Event)
	{
		stage.align = flash.display.StageAlign.TOP_LEFT;
		stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;

		init();
	}

	public static function main()
	{
		flash.Lib.current.addChild(new Example());
	}
}