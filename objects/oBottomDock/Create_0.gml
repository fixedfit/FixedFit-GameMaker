width=master.v_w;
height=width/5;

x1=0;
x2=width;
y1=master.v_h-height;
y2=master.v_h;
xx = -master.x_dif/2+height/2;
yy = room_height-height/2;
dis = height;

in[0]=instance_create(xx,yy,oHome);
xx+=dis;
in[1]=instance_create(xx,yy,oCloset);
xx+=dis;
in[2]=instance_create(xx,yy,oAdd);
xx+=dis;
in[3]=instance_create(xx,yy,oNotifications);
xx+=dis;
in[4]=instance_create(xx,yy,oProfile);

var scale = (height/512);
for(var i=0;i<5;i+=1){
    in[i].image_index=i;
    in[i].image_xscale=scale;
    in[i].image_yscale=scale;
}

xx = -master.x_dif/2+height/2;