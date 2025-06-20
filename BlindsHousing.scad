include <OpenSCAD-tray/tray.scad>
// Dimensions
block_z = 22;
block_y = 47;
block_x = 36;
cylinder_cutout_depth = 25;
equipment_housing_length = 70;
equipment_housing_margin = 5;
equipment_housing_calc_length = equipment_housing_length + equipment_housing_margin;
equipment_housing_calc_width = block_y - equipment_housing_margin;
equipment_housing_calc_depth = block_x;

// Motor Housing
difference() {
  // Yellow: main square motor housing 
  cube([block_x, block_y, block_z], center=true);
  
  // Blue: main cylinder cutout
  color("blue") translate([0,0,3]) cylinder(r=14.1, h=cylinder_cutout_depth, $fn=100, center=true);
  
  // Red: top square cutout for motor
  color("red") translate([5.7,0,6]) cube([17,18,30.5], center=true);
  
  // Black: top motor channel
  color("black") translate([10,0,6]) cube([17,15,30.5], center=true);
  
  // Purple: cylinder holes for motor mounts
  color("purple") translate([0,17.4,10]) cylinder(r=3.35, h=2, $fn=100);
  color("purple") translate([0,-17.4,10]) cylinder(r=3.35, h=2, $fn=100);
  
  // Orange: square cutouts for motor mounts
  color("orange") translate([0,14.05,11]) cube([6.7,6.7,2], center=true);
  color("orange") translate([0,-14.05,11]) cube([6.7,6.7,2], center=true);
  
  // Green: screw holes
  color("green") translate([0,-17.4,6]) cylinder(r=1.5, h=5, $fn=100);
  color("green") translate([0,17.4,6]) cylinder(r=1.5, h=5, $fn=100);
  
  // White: top channel for wires
  color("white") translate([14,-(7.5),-11]) cube([4,15,block_z]);
  
  // Magenta: Cut out notches on corners for blind lip.
  // color("magenta") translate([-((block_x - 2.5)/2), ((block_y - 2.5)/2), 0]) cylinder(r= (2.5/1), h=block_z, center=true, $fn=100);
  // color("magenta") translate([-((block_x - 2.5)/2), -((block_y - 2.5)/2), 0]) cylinder(r= (2.5/1), h=block_z, center=true, $fn=100);
  
  // Cyan: tiny cylindrical channel for wires - replaced with above White channel
  // color("cyan") translate([(block_x / 2),0,-(block_z/2)]) cylinder(r=1.5, h=4, $fn=100, center=true);
}

difference() {
  translate([-(block_x / 2), -(block_y / 2), -10.5]) 
    rotate([0,90,0])
      tray([70, 47, 36], curved=false);

  // White: rear top channel for wires
  color("white") translate([14,-(7.5),-(equipment_housing_calc_length + block_z/ 2)]) cube([4,15,equipment_housing_calc_length+2]);
}

// Equipment housing
// difference() {
//   // Cyan: rear housing outer box for microcontroller/battery/etc.
//   color("cyan") translate([-(block_x / 2), -(block_y / 2), -((block_z / 2) + (equipment_housing_calc_length+2))]) cube([block_x, block_y, equipment_housing_calc_length+2]);
  
//   // White: rear top channel for wires
//   color("white") translate([14,-(7.5),-(equipment_housing_calc_length + block_z/ 2)-2]) cube([4,15,equipment_housing_calc_length+2]);
  
//   // Cyan: rear housing inner box for microcontroller/battery/etc.
//   color("cyan") translate([2,0,-equipment_housing_length + block_z]) cube([equipment_housing_calc_depth,equipment_housing_calc_width,equipment_housing_calc_length], center=true);
// }
