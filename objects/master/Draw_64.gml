if(room==rAdd){
    if(image_loaded){
        if(sprite_exists(image)){
            var xx=d_w/2-image_width/2;
            var yy=d_h/2-image_height/2;
            draw_sprite_ext(image,0,xx,yy,image_xs,image_ys,0,c_white,1);
        }
    }
}

