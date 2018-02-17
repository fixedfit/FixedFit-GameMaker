if (camera_is_recording()) {
    camera_stop_recording();
    camera_idle_timer_enable(true);
}
else {
    camera_start_recording();
    camera_idle_timer_enable(false);
}
audio_play_sound(gmcamera_snd_record, 0, false);

