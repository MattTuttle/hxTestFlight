import android.app.Application;
import android.app.Activity;
import android.content.ContextWrapper;
import android.os.Bundle;

import org.haxe.nme.GameActivity;

import com.testflightapp.lib.TestFlight;


public class TFHelper {
	
	public static Application getApp(GameActivity a) {
		return a.getApplication();
	}
}