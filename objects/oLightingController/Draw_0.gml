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

// Draw onto surface
surface_set_target(light_surf);

// Clear with darkness
draw_clear_alpha(c_black, 0.85);

// Move into camera space
matrix_set(matrix_world, matrix_build(-vx, -vy, 0, 0, 0, 0, 1, 1, 1));

// =====================
// 🔥 ALL LIGHTS HERE
// =====================
gpu_set_blendmode(bm_subtract);

// ---------------------
// 🔦 FLASHLIGHT
// ---------------------
var p = instance_find(oPlayer, 0);

if (instance_exists(p) && p.flashlightOn) {

    var dir = point_direction(p.x, p.y, mouse_x, mouse_y);

    var cone_angle = 60;
    var max_length = 300;

    var rays = 25; // 🔥 smoothness (higher = smoother)

    gpu_set_blendmode(bm_subtract);

    for (var i = 0; i < rays; i++) {

        var t = i / (rays - 1);

        // Smooth easing (VERY important)
        var eased = t * t;

        var len = lerp(20, max_length, eased);

        // Smooth fade curve (not linear = more natural light falloff)
        var alpha = (1 - eased) * 0.08;

        var spread = lerp(0, cone_angle * 0.5, eased);

        var a1 = dir - spread;
        var a2 = dir + spread;

        var x1 = p.x;
        var y1 = p.y;

        var x2 = x1 + lengthdir_x(len, a1);
        var y2 = y1 + lengthdir_y(len, a1);

        var x3 = x1 + lengthdir_x(len, a2);
        var y3 = y1 + lengthdir_y(len, a2);

        draw_set_alpha(alpha);

        draw_primitive_begin(pr_trianglefan);
        draw_vertex(x1, y1);
        draw_vertex(x2, y2);
        draw_vertex(x3, y3);
        draw_primitive_end();
    }

    draw_set_alpha(1);
    gpu_set_blendmode(bm_normal);
}

// ---------------------
// 🔥 CAMPFIRES
// ---------------------
with (oCampfire) {

    flicker_timer += 0.2;

    var flicker = sin(flicker_timer) * 2;

    var rings = 12;

    for (var i = 0; i < rings; i++) {

        var t = i / (rings - 1);
        var eased = t * t;

        var r = lerp(10, 70, eased) + flicker;
        var alpha = (1 - eased) * 0.06;

        draw_set_alpha(alpha);
        draw_circle(x, y, r, false);
    }

    draw_set_alpha(1);
}

gpu_set_blendmode(bm_normal);

// Reset matrix
matrix_set(matrix_world, matrix_build_identity());

// Done drawing to surface
surface_reset_target();

// Draw final lighting
draw_surface(light_surf, vx, vy);