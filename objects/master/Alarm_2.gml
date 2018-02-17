image_loaded=true;
image_width=sprite_get_width(image);
image_height=sprite_get_height(image);
o_image_width=image_width;//to be used when exporting
o_image_height=image_height;//to be used when exporting
image_xs=1;
image_ys=1;
if(o_image_width>__view_get( e__VW.WView, 0 )){
    image_xs=__view_get( e__VW.WView, 0 )/o_image_width;
    image_ys=image_xs;
}else{
    image_xs=1;
    image_ys=1;
}   
if(o_image_height*image_ys>__view_get( e__VW.HView, 0 )-global.top_height){
    image_ys=(__view_get( e__VW.HView, 0 )-global.top_height)/o_image_height;
    image_xs=image_ys;
}
image_width*=image_xs;
image_width=round(image_width);
image_height*=image_ys;
image_height=round(image_height);