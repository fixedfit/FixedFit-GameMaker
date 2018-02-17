if(object_index!=oLogin){
    if(button_down){
        image_alpha=.5;
    }else{
        image_alpha=1;
    }
    draw_sprite_ext(sprite_index,image_index,x2gui(x),y2gui(y),image_xscale*.6,image_yscale*.6,0,c_white,image_alpha);
}