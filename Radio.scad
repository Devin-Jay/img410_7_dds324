// Parameters
head_size = 20;
head_height = 18;
eye_radius = 2.5;
tentacle_length = 30;
tentacle_thickness = 3;
num_tentacles = 8;

// Main model
union()
{

    // Square head
    difference()
    {
        // Head block
        translate([-head_size/2, -head_size/2, 0])
            cube([head_size, head_size, head_height], center = false);

        // Mouth
        translate([-6, head_size/2 - 0.1, head_height/3])
            cube([12, 2, 2], center = false);
    }

    // Eyes
    translate([-head_size/4, head_size/2 + eye_radius/2, head_height * 0.65])
        sphere(r = eye_radius);

    translate([ head_size/4, head_size/2 + eye_radius/2, head_height * 0.65])
        sphere(r = eye_radius);
    
    // Tentacles
    for (i = [0 : 360/num_tentacles : 360 - 360/num_tentacles])
    {
        rotate([0, 0, i])
            translate([head_size/3, 0, -tentacle_length])
                cube([tentacle_thickness, tentacle_thickness, tentacle_length], center = false);
    }
}