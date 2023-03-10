
$fn=120;

union(){
   grundkoerper();
   translate([4,-4,8] ) rotate([90,0,-90]) halter_bohrung();
   // translate([-4,4,35] ) rotate([-90,0,180]) halter_bohrung();
   translate([4,-4,32] ) rotate([90,0,-90]) halter_bohrung();
   // translate([-4,4,65] ) rotate([-90,0,180]) halter_bohrung();
   
}
   



module grundkoerper(){
    difference(){
        translate([0,0,25]) cube([8,8,50],center=true);
        translate([1,1,-1]) minkowski(){
            cube([4,4,52]);
            cylinder(r=3,h=0.01);
        }
        //translate([1,1,-0.5]) cylinder(r=3,h=76);
        // translate([0,0,-0.5]) cube([5,5,76]);
    }
}

module halter_bohrung(){
    difference(){
        union() {
            translate([0,-1,0]) cube([5,12,5]);
            translate([5,5,0]) cylinder(r=5,h=5);
                         
            
        }
        translate([5,5,-0.5]) cylinder(d=4,h=4);
        translate([5,5, 1]) cylinder(d1=4,d2=6.75, h=2.25);
        
        
        
        translate([6,-3.5,2]) minkowski(){
                cube([10,5,6], center=true);
                cylinder(r=1,h=0.01);
        }
        
        translate([6,13.5,2]) minkowski(){
                cube([10,5,6], center=true);
                cylinder(r=1,h=0.01);
        }
        
        translate([1,-2,4]) minkowski(){
            cube([10,14,2]);
            rotate([90,0,0]) cylinder(r=1,h=0.01);
        } 
         
        
       
    }
}




