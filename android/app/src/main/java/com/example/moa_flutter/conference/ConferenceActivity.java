package com.example.moa_flutter.conference;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.example.moa_flutter.MainActivity;
import org.jitsi.meet.sdk.JitsiMeetActivity;
import org.jitsi.meet.sdk.JitsiMeetConferenceOptions;

import java.util.Map;


@SuppressLint("Registered")
public class ConferenceActivity extends JitsiMeetActivity {

    public static void launch(Context context, JitsiMeetConferenceOptions options) {
        Intent intent = new Intent(context, ConferenceActivity.class);
        intent.setAction("org.jitsi.meet.CONFERENCE");
        intent.putExtra("JitsiMeetConferenceOptions", options);
        context.startActivity(intent);
    }

    public static void launch(Activity context,int requestCode, JitsiMeetConferenceOptions options) {
        Intent intent = new Intent(context, ConferenceActivity.class);
        intent.setAction("org.jitsi.meet.CONFERENCE");
        intent.putExtra("JitsiMeetConferenceOptions", options);
        context.startActivityForResult(intent,requestCode);
    }

    @Override
    public void onConferenceWillJoin(Map<String, Object> data) {
        Log.d("ConferenceActivity", "will join");
        super.onConferenceWillJoin(data);
    }

    @Override
    public void onConferenceJoined(Map<String, Object> data) {
        Log.d("ConferenceActivity", "joined");
        super.onConferenceJoined(data);
    }

    @Override
    public void onConferenceTerminated(Map<String, Object> data) {
        Log.d("ConferenceActivity", "terminated");
        //退出到Main2Activity发起退出请求
        setResult(RESULT_OK);
        super.onConferenceTerminated(data);
    }
}
