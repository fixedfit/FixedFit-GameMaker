// make the preview fade in
preview_alpha += 0.1;
camera_preview_set_alpha(preview_alpha);
if (preview_alpha < 1) {
    alarm[0] = 1;
}

