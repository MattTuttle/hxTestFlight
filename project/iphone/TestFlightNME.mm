#import <TestFlight.h>
#import <UIKit/UIKit.h>

#include <TestFlightNME.h>

namespace TF
{
	void take_off(const char *token)
	{
		#if debug
		[TestFlight setDeviceIdentifier: [[UIDevice currentDevice] uniqueIdentifier]];
		#endif
		[TestFlight takeOff:[NSString stringWithUTF8String:token]];
	}

	void pass_checkpoint(const char *checkpoint)
	{
		[TestFlight passCheckpoint:[NSString stringWithUTF8String:checkpoint]];
	}

	void submit_feedback(const char *feedback)
	{
		[TestFlight submitFeedback:[NSString stringWithUTF8String:feedback]];
	}

	void custom_info(const char *key, const char *value)
	{
		[TestFlight addCustomEnvironmentInformation: [NSString stringWithUTF8String:value]
											 forKey: [NSString stringWithUTF8String:key]];
	}

	void remote_log(const char *value)
	{
		TFLog(@"[INFO] %@", [NSString stringWithUTF8String:value]);
	}
}