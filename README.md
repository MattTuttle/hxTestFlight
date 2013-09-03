TestFlight SDK for NME
======================

TestFlight comes with a set of SDK calls that can add helpful feedback from your app. Checkpoints are especially useful for games.

A Brief Example
---------------

```haxe
import com.testflightapp.TestFlight;

class Example
{

	private function new()
	{
		// do this once at the beginning of your app
		TestFlight.takeOff("your-testflight-token");

		// use these methods to send data to TestFlight
		TestFlight.passCheckpoint("check1");
		TestFlight.remoteLog("Hello world");

		// only works in iOS
		TestFlight.submitFeedback("This is a comment about the app");
		TestFlight.customInfo("foo", ["bar", 1]);
	}

}
```
