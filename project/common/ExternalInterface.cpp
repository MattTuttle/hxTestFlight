#ifndef IPHONE
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include <hxcpp.h>

#include "TestFlightNME.h"
using namespace TF;

#ifdef IPHONE

void testflight_take_off(value token, value testing)
{
	take_off(val_string(token), val_bool(testing));
}
DEFINE_PRIM (testflight_take_off, 2);


void testflight_open_feedback_view()
{
	open_feedback_view();
}
DEFINE_PRIM (testflight_open_feedback_view, 0);


void testflight_pass_checkpoint(value checkpoint)
{
	pass_checkpoint(val_string(checkpoint));
}
DEFINE_PRIM (testflight_pass_checkpoint, 1);


void testflight_submit_feedback(value feedback)
{
	submit_feedback(val_string(feedback));
}
DEFINE_PRIM (testflight_submit_feedback, 1);


void testflight_custom_info(value key, value val)
{
	custom_info(val_string(key), val_string(val));
}
DEFINE_PRIM (testflight_custom_info, 2);


void testflight_remote_log(value val)
{
	remote_log(val_string(val));
}
DEFINE_PRIM (testflight_remote_log, 1);

#endif

extern "C" int testflight_register_prims () { return 0; }
