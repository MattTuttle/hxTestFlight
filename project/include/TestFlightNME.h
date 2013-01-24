#ifndef TestFlightNME
#define TestFlightNME

namespace TF {

	void take_off(const char *token, bool testing);
	void pass_checkpoint(const char *checkpoint);
	void open_feedback_view();
	void submit_feedback(const char *feedback);
	void custom_info(const char *key, const char *value);
	void remote_log(const char *value);

}

#endif