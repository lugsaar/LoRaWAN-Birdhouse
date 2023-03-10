//Wägezelle

$fn=60;

difference(){
union(){
// translate([0,0,12.5/2])color([1,1,1]) waegezelle();
translate([0,0,0]) teller();
//translate([0,0,12.5]) rotate ([180,0,180]) teller();
}
//translate([0,-100,0]) cube([200,200,80],center=true);//schnitt
}


 // translate([0,-21,-0.9])  rippe();
//translate([0,21,-0.9])  rippe();
//translate([0,0,0]) aussparung();



module teller(){
difference(){
    union(){
        minkowski(){
            translate([0,0,-2]) cube([123,123,4],center=true);//platte
            cylinder(r=2,h=0.01);
            }
        translate([0,0,-1]) cylinder(r=55,h=6);//scheibe
        }
    translate([0,0,0]) aussparung();
         //  translate([0,30,6]) cube([40,20,12],center=true);
    translate([0,0,0]) befestigungs_bohrungen();
    translate([0,0,0]) fase_unten();
    }
    

}

 module regular_polygon(order = 4, r=1){
     angles=[ for (i = [0:order-1]) i*(360/order) ];
     coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
     polygon(coords);
 }



module befestigungs_bohrungen(){
    translate([48,48,-4.5]) cylinder(d=4.5, h=5);
    translate([48,48, -1.5]) linear_extrude(2) regular_polygon( 6, 4);
    // translate([48,48,-0.5]) cylinder(d=7.7, h=5);
    translate([-48,48,-4.5]) cylinder(d=4.5, h=5);
    translate([-48,48, -1.5]) linear_extrude(2) regular_polygon( 6, 4);
    translate([48,-48,-4.5]) cylinder(d=4.5, h=5);
    translate([48,-48, -1.5]) linear_extrude(2) regular_polygon( 6, 4);
    translate([-48,-48,-4.5]) cylinder(d=4.5, h=5);    
    translate([-48,-48, -1.5]) linear_extrude(2) regular_polygon( 6, 4);
}



module fase_unten(){
    translate([-62,62,-2.5]) rotate([0,0,45]) cube([15,5,6],center=true);
}

module waegezelle(){
    difference(){
cube([80,12.5,12.5],center=true);
translate([-3.5,8,0]) rotate([90,0,0])cylinder(r=5.5,h=16);
translate([3.5,8,0]) rotate([90,0,0])cylinder(r=5.5,h=16);
        
        translate([40-5,0,-8]) cylinder(d=3.5,h=16);
         translate([40-5-15,0,-8]) cylinder(d=3.5,h=16);
         translate([-40+5+15,0,-8]) cylinder(d=3.5,h=16);
         translate([-40+5,0,-8]) cylinder(d=3.5,h=16);
    }
}


module aussparung(){
 translate([0.5,0,15]) cube([82,12.8,30],center=true);   
 translate([13,0,13.5])   cube([57,16,33],center=true);   
  translate([5.5,0,15])   cube([70,16,30],center=true);   
 translate([-40.5,6,0.3]) rotate([0,90,0]) color([1,0,0]) cylinder(r=0.5,h=12);   
  translate([-40.5,-6,0.3]) rotate([0,90,0]) color([1,0,0]) cylinder(r=0.5,h=12);  
    
      translate([-40.5,6,0]) rotate([0,0,0]) color([1,0,0]) cylinder(r=0.5,h=22);  //senkrechte freistellung     
    translate([-40.5,-6,0]) rotate([0,0,0]) color([1,0,0]) cylinder(r=0.5,h=22);     //senkrechte freistellung
  translate([-25,60,5]) rotate([90,0,0]) color([1,1,0]) cylinder(r=2.5,h=120);     
       // translate([40-5,0,-25]) cylinder(d=5,h=50);
       //  translate([40-5-15,0,-25]) cylinder(d=5,h=50);
         translate([-40+5+15,0,-25]) cylinder(d=5,h=50);
         translate([-40+5,0,-25]) cylinder(d=5,h=50);
    
    translate([-40+5+15,0,-4.5]) cylinder(d1=10,d2=5,h=3);
    translate([-40+5,0,-4.5]) cylinder(d1=10,d2=5,h=3);

}





