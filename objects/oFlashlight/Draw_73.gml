// Camera info
var cam = view_camera[0];
var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);

// Create surface if needed
if (!surface_exists(light_surf)) {
    light_surf = surface_create(vw, vh);
}

// Set surface target
surface_set_target(light_surf);

// Clear with darkness
draw_clear_alpha(c_black, 0.8);

// Move into camera space
matrix_set(matrix_world, matrix_build(-vx, -vy, 0, 0, 0, 0, 1, 1, 1));

// Get direction toward mouse
var dir = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);

// Calculate cone edges
var left_dir  = dir - cone_angle * 0.5;
var right_dir = dir + cone_angle * 0.5;

// Cone points
var x1 = oPlayer.x;
var y1 = oPlayer.y;

var x2 = x1 + lengthdir_x(cone_length, left_dir);
var y2 = y1 + lengthdir_y(cone_length, left_dir);

var x3 = x1 + lengthdir_x(cone_length, right_dir);
var y3 = y1 + lengthdir_y(cone_length, right_dir);

// Subtract the cone from darkness
gpu_set_blendmode(bm_subtract);

draw_primitive_begin(pr_trianglefan);
draw_vertex(x1, y1);
draw_vertex(x2, y2);
draw_vertex(x3, y3);
draw_primitive_end();
draw_circle(oPlayer.x, oPlayer.y, 17, false);
gpu_set_blendmode(bm_normal);

// Reset matrix
matrix_set(matrix_world, matrix_build_identity());

// Reset surface target
surface_reset_target();

// Draw darkness overlay
draw_surface(light_surf, vx, vy);