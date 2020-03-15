package com.example.moa_flutter.utils;

import android.app.Activity;
import com.example.moa_flutter.conference.ConferenceActivity;
import org.jitsi.meet.sdk.JitsiMeet;
import org.jitsi.meet.sdk.JitsiMeetConferenceOptions;

import java.net.MalformedURLException;
import java.net.URL;

public class ConferenceUtils {

    public static void joinConference(Activity activity, JitsiMeetConferenceOptions option){
        // Launch the new activity with the given options. The launch() method takes care
        // of creating the required Intent and passing the options.
        ConferenceActivity.launch(activity, option);
    }

    public static void joinConference(Activity activity,int requestCode, JitsiMeetConferenceOptions option){
        ConferenceActivity.launch(activity, requestCode, option);
    }

    public static void initJitsiMeet(){
        URL serverURL;
        try {
            serverURL = new URL("https://meet.jit.si");
        } catch (MalformedURLException e) {
            e.printStackTrace();
            throw new RuntimeException("Invalid server URL!");
        }
        JitsiMeetConferenceOptions defaultOptions
                = new JitsiMeetConferenceOptions.Builder()
                .setServerURL(serverURL)
                .setWelcomePageEnabled(false)
                .build();
        JitsiMeet.setDefaultConferenceOptions(defaultOptions);

    }
}
