// Raspberry Pi 5 five-bay slide-in HDD/SSD enclosure
// REVISION 27: REV26 fit retained; the small centred lid circle and the
// separate five-port Ethernet-board compartment at the rear are removed.
// REV19 port geometry, REV18 USB-C recess and compact Pi/N07 remain intact.
// Opening B remains filled. Original body, lid and tray geometry preserved
// Body, lid, trays and four-inch LENGTH allowance retained.
// Units: millimetres. Hardware fit-check prototype; check real cables/HAT.
// Original rev10 is preserved. No reference electronics are printable solids.
//
// Drive orientation: 2.5-inch drive long edge runs front-to-back so the
// SATA connector is at the rear. Each tray slides in from the front.
// The 24 mm rear chase is intentionally reserved for SATA data/power wiring.

part = "assembly"; // "base", "top", "tray", or "assembly"
$fn = 48;
lid_slide = 0; // negative Y slides the lid out through the FRONT
tray_slide = 0; // negative Y shows all five drive trays pulled out in preview
remove_aux_top_fan = false; // A is retained; owner selected B for removal
remove_small_lid_circle = true; // owner requested a lid without this opening
remove_rear_ethernet_box = true; // preserves normal Pi Ethernet/USB side ports

body_x = 240;
body_y = 145;
body_z = 102;
wall = 3;
floor = 3;

tray_x = 78;        // 70 mm drive width + print clearance
tray_y = 108;       // 100 mm drive length + clearance
tray_x0 = 7;
tray_y0 = 4;        // front stop remains reachable through the front opening
tray_pitch = 19;    // supports 7, 9.5, 12.5, and 15 mm drives
bay_z0 = 4;
drive_opening_h = 18;
// The VCOM CU815-class SATA-to-USB head is roughly 45 mm wide and 11 mm
// thick.  Give it a proper per-drive rear pass-through and an open corridor;
// the cable/adapter remains real hardware, never printable model geometry.
cable_lane_h = 16;
vcom_adapter_head_w = 45;
vcom_adapter_head_h = 11;
vcom_adapter_head_depth = 25;
vcom_adapter_clear_each_side = 4.5;
vcom_adapter_slot_w = vcom_adapter_head_w+2*vcom_adapter_clear_each_side; // 54
vcom_adapter_slot_h = 16;
vcom_adapter_corridor_d = 30;
drive_nominal_l = 100;
// A standard 2.5-inch drive starts 4 mm behind the tray face.  Its VCOM head
// therefore begins at global Y=108 mm and can run to Y=138 mm before the rear
// wall's 3 mm thickness begins at Y=142 mm.
vcom_adapter_corridor_y0 = tray_y0+4+drive_nominal_l;
assert(vcom_adapter_slot_w < tray_x,
       "VCOM adapter opening must leave structural side posts");
assert(vcom_adapter_slot_h < tray_pitch,
       "VCOM adapter opening must retain the bay separator");
assert(vcom_adapter_corridor_y0+vcom_adapter_corridor_d <= body_y-wall,
       "VCOM adapter must stay inside the rear cable chase");

// REV20 sliding fit: values are independent so a tray change never alters
// the lid or port locations. REV19 used 0.3 mm per side and a floating
// 0.3 mm rail gap; that could bind after FDM print tolerances.
tray_slide_side_clearance = 0.65;
tray_slide_entry_len = 8;
tray_guide_w = 3;
tray_guide_front_w = 1.8; // entry funnel opens an extra 1.2 mm each side
tray_guide_h = 96;
tray_rail_outer_overlap = 0.6; // mechanically joins each rail to its guide
tray_rail_inward = 2.0;
tray_rail_w = tray_rail_outer_overlap+tray_rail_inward; // 2.6 mm
tray_rail_h = 1.4;
tray_rail_entry_drop = 0.6; // gentle lower rail lead-in, then seated contact
tray_end_stop_t = 1.5;
tray_end_stop_h = 8;
tray_front_top_clearance = 0.6;
tray_seated_x = tray_x0+tray_slide_side_clearance;
tray_seated_z = bay_z0; // tray floor rests on the rail top; not floating

// REV26: Surface-mounted U pull handle. Two rounded mount pads overlap the
// solid front wall; two round standoffs support a smooth horizontal bar. It is
// one printable piece, with a real 11 mm finger gap behind the bar.
tray_u_handle_post_spacing = 44;
tray_u_handle_tube_r = 3.5;
tray_u_handle_mount_w = 12.5;
tray_u_handle_mount_h = 12.5;
tray_u_handle_mount_corner_r = 4.2;
tray_u_handle_mount_depth = 2.5;
tray_u_handle_outer_reach = 20.5; // front-most point from the body face

// The removable lid uses the same printable side clearance and a narrower
// first 8 mm, so it finds the channel instead of scraping both walls.
lid_slide_side_clearance = 0.65;
lid_slide_entry_len = 8;
lid_slide_entry_inset = 1.2;
lid_plate_x0 = wall+lid_slide_side_clearance;
lid_plate_w = body_x-2*lid_plate_x0;
lid_plate_y = body_y-wall; // rear edge meets the existing rear stop

drive_back_y = 115; // end of drive cage
chase_start_y = 118;
// The old 120 mm separators intersected the separate Ethernet PCB.
cable_lane_width_safe = 83;
// Owner clarified: 4 inches is the N07 LENGTH ALLOWANCE, not PCB size.
// Actual board dimensions and a separately reserved bay are defined below.
port_depth = 25.4;  // 1 inch internal connector clearance
// Measured five-port Ethernet board: 103 x 73 mm, 5 mm PCB/underside,
// 16 mm total board/metal/component height, and a 2-inch rear air keepout.
board_x0 = 105;
board_y0 = 66;
board_l = 103;
board_w = 73;
board_base_z = 8;
pcb_total_t = 5;
ethernet_board_height = 16;
rj45_bank_x = 132;
rj45_bank_w = 73;
rj45_bank_z = board_base_z;
rj45_bank_h = 21;
rj45_external_x = 132;
// User-specified Ethernet envelope: 16 x 15 x 21 mm (L x W x H).
// The visible face is kept at 14 mm per the requested opening dimension.
ethernet_port_length = 16;
ethernet_port_depth = 15;
ethernet_port_height = 21;
ethernet_opening_w = 14;
ethernet_opening_z = 6;
rj45_external_w = ethernet_opening_w;
rj45_external_z = ethernet_opening_z;
rj45_external_h = ethernet_port_height;
// Five lower RJ45 openings line up with the five-port board.  The round
// spare hole remains separate and is not converted to Ethernet.
rj45_port_slots = [
    [132, ethernet_opening_z, ethernet_opening_w, ethernet_port_height],
    [146, ethernet_opening_z, ethernet_opening_w, ethernet_port_height],
    [160, ethernet_opening_z, ethernet_opening_w, ethernet_port_height],
    [174, ethernet_opening_z, ethernet_opening_w, ethernet_port_height],
    [188, ethernet_opening_z, ethernet_opening_w, ethernet_port_height]
];
// Power circle moved to the opposite side of the lower Ethernet row.
// The row ends at x=202; 3 mm clearance plus the 5.5 mm radius gives 210.5.
dc_jack_x = 210.5;
dc_jack_clear_d = 17;
dc_jack_z = board_base_z + dc_jack_clear_d/2;
dc_jack_r = 5.5; // approx. 11 mm circular barrel-jack opening
cap_keep_height = 50.8; // 2 in air-conditioning clearance
// REV12: the former square openings at [108,100,14,14] and
// [125,100,14,14] are deleted. That lid region is solid, 3 mm thick.
// Separate top-entry Ethernet/12V routing is no longer provided there.
spare_air_hole_x = 209;
spare_air_hole_z = ethernet_opening_z + ethernet_port_height + 3 + 25.4;
spare_air_hole_r = 25.4; // 2 in diameter, enlarged from the 1.8 in request
screen_x0 = 105;
screen_y0 = 18;
screen_w = 120;
screen_h = 75;
// Shared PCB datum, measured from official RP-010083-CA-1 STEP (May 2026).
// STEP board underside Z=0; copper top Z=1.336. No reference CAD imported.
// The owner approved removing the former two-inch under-Pi height reserve.
// An 8 mm SSD/underside design envelope plus 2 mm floor clearance sets the
// N07 seat. This is a design allowance, not a measured SSD/heatsink height.
pi_x = 149;
pi_y = 3.2;
// N07 only: no kit case, cooler, fan, display or reference PCB is printed.
// Manufacturer EP-0211 mechanical drawing: 87.5 x 56 x 1.6 mm PCB.
// ZP-0187 kit hardware sheet: M2.5 x 7+6 mm inter-board posts.
// Owner confirmed ORIGINAL KIT spacers. Standalone N07's 6 mm spacing
// must not be substituted for this kit-specific nominal 7 mm gap.
n07_l = 87.5;
n07_w = 56;
n07_bay_length = 101.6; // 4 inches reserved for N07, not a scaled board
n07_bay_x1 = body_x-wall; // inside right wall X=237
n07_bay_x0 = n07_bay_x1-n07_bay_length; // X=135.4
// 13.6 mm length allowance left of PCB and 0.5 mm to its right.
// Bay is an allocated keepout, not extra printed walls. Mounts occupy it.
assert(pi_x >= n07_bay_x0 && pi_x+n07_l <= n07_bay_x1,
       "N07 PCB must fit within its four-inch allocated length");
n07_pcb_t = 1.6;
n07_pi_gap = 7;
ssd_underside_envelope_h = 8;
ssd_floor_gap = 2;
n07_support_h = ssd_underside_envelope_h+ssd_floor_gap; // 10 mm
n07_under_z = floor+n07_support_h; // seat Z=13
n07_top_z = n07_under_z+n07_pcb_t; // 14.6
pi_pcb_under_z = n07_top_z+n07_pi_gap; // 21.6
pi_pcb_t = 1.336; // reference model, NOT a universal production tolerance
pi_pcb_top_z = pi_pcb_under_z+pi_pcb_t;
n07_post_d = 8;
n07_foot_d = 12;
n07_neck_h = 8; // narrow support alongside the SSD design envelope
n07_taper_h = 1; // plus 1 mm straight foot, below the SSD keepout
assert(n07_support_h > n07_neck_h+n07_taper_h,
       "Support must retain a positive-height foot");
n07_head_access_d = 5.6; // long screwdriver / M2.5 screw-head passage
n07_screw_clear_d = 2.8;
n07_seat_t = 2;
// M2.5 x 6 screws pass up through 2 mm plastic and 1.6 mm N07 PCB,
// leaving nominal 2.4 mm engagement into original spacer's female end.
// Fit-test actual heads, spacers and printer tolerances before final use.
// Nominal face openings, distinct from full metal shell relief pockets.
pi_usb_stack_w = 14.0;
pi_usb_stack_h = 16.19; // blue shell top above PCB reference surface
pi_usb_stack_d = 17.3;
pi_usb_stack_gap = 4;
pi_ethernet_w = 16.0;
pi_ethernet_h = 13.5;
pi_ethernet_d = 21.2;
// Long edge faces FRONT. Short edge faces RIGHT. Do not position separately.
front_usbc_center_x = pi_x + 11.2;
front_hdmi_centers_x = [pi_x+25.8, pi_x+39.2];
front_port_center_z = pi_pcb_under_z+2.466;
front_hdmi_w = 9.5; // REV19: 8.5 + 1.0 mm, fixed centre
front_hdmi_h = 6.5; // REV19: 5.5 + 1.0 mm; independent of USB-C height
front_hdmi_corner = 0.7; // small lower bevels; not measured plug geometry
front_usbc_w = 11.5;
front_port_h = 5.5;

// Owner images.jpg: housing 12.2 wide x 6.3 high, exposed tip 6.7 long.
// Treat product-image dimensions as nominal, not a measured fit guarantee.
// Pocket is outside-facing; original USB-C throat and Pi datum stay fixed.
usbc_plug_body_w = 12.2;
usbc_plug_body_h = 6.3;
usbc_plug_tip_l = 6.7; // reference only; does not change socket geometry
usbc_plug_clearance = 0.5; // each side, a chosen printer fit allowance
usbc_recess_w = usbc_plug_body_w+2*usbc_plug_clearance; // 13.2
usbc_recess_h = usbc_plug_body_h+2*usbc_plug_clearance; // 7.3
usbc_recess_depth = 2.4; // outside Y=0 to Y=2.4; 0.6 mm inner rim remains
usbc_recess_corner_r = 0.4; // small radius clears a rectangular housing
// STEP front shell opening Z=1.436..4.596; tongue centred at Z=3.016.
// This mating axis is 0.55 mm above the original full-shell throat centre.
usbc_plug_axis_z = pi_pcb_under_z+3.016;
assert(usbc_recess_depth > pi_y-1.2 && usbc_recess_depth <= wall-0.6,
       "USB-C recess must reach socket nose and retain its inner rim");

// STEP face references (all below relative to PCB underside):
// USB3 clear mouths Z=2.456..8.476 and 10.956..16.976: pitch 8.500.
// USB2 clear mouths Z=2.336..8.306 and 10.966..16.936: pitch 8.630.
// Cutout height 6.6 is a design allowance (~0.3 above/below each mouth).
side_pi_ethernet_cy = pi_y+10.25;
side_pi_usb3_cy = pi_y+29.0001;
side_pi_usb2_cy = pi_y+46.9997;
side_pi_ethernet_slot = [side_pi_ethernet_cy-pi_ethernet_w/2,
    pi_pcb_under_z+7.986-pi_ethernet_h/2,pi_ethernet_w,pi_ethernet_h];
usb_face_h = 6.6;
side_pi_usb3_slots = [for (cz=[5.466,13.966])
    [side_pi_usb3_cy-pi_usb_stack_w/2,pi_pcb_under_z+cz-usb_face_h/2,pi_usb_stack_w,usb_face_h]];
side_pi_usb2_slots = [for (cz=[5.321,13.951])
    [side_pi_usb2_cy-pi_usb_stack_w/2,pi_pcb_under_z+cz-usb_face_h/2,pi_usb_stack_w,usb_face_h]];
// Recess full connector shells behind the 1.8 mm outer face mask.
// Metal front faces X~236.78..237.05. Plastic dividers begin at X=238.2.
pi_face_mask_inner_x = body_x-1.8;

// Centered wire relief under the generic 5-inch display support frame.
// Reduced to the requested 1-inch round opening.
screen_opening_x = screen_x0 + screen_w/2;
screen_opening_y = screen_y0 + screen_h/2;
screen_wire_opening_d = 25.4; // 1 in
screen_rail_t = 3;
screen_support_h = 4;
screen_support_z = 2.5;
screen_plate_h = 1.5;
top_fan_mode = "exhaust";
side_fan_mode = "intake";
side_fan_y = 45;
side_fan_z = 66; // owner approved above the newly lowered ports; no new fan
aux_top_fan_mode = "exhaust";
aux_top_fan_x = 195;
aux_top_fan_y = 121;
aux_top_fan_r = 18;
aux_top_fan_mount = 16;
fan_screw_hole_r = 1.8;
fan_screw_head_r = 3.2;

// Port profiles in local XY, extruded through the front wall along -Y.
// USB-C is capsule-shaped. HDMI has bevelled lower corners like the photo.
// These are enclosure cutouts, not printed electronic sockets.
module front_profile_cut(cx, kind) {
    translate([cx,wall+1,front_port_center_z]) rotate([90,0,0])
        linear_extrude(height=wall+2) {
            if (kind == "usbc") {
                hull() for (x=[-(front_usbc_w-front_port_h)/2,(front_usbc_w-front_port_h)/2])
                    translate([x,0]) circle(d=front_port_h);
            } else {
                w=front_hdmi_w/2;
                h=front_hdmi_h/2;
                c=front_hdmi_corner;
                polygon([[-w,-h+c],[-w+c,-h],[w-c,-h],[w,-h+c],[w,h],[-w,h]]);
            }
        }
}

module usbc_plug_recess() {
    // Rounded rectangle, NOT an enlarged capsule: capsule corners would
    // obstruct the corners of the thicker rectangular cable housing.
    translate([front_usbc_center_x,usbc_recess_depth,usbc_plug_axis_z])
        rotate([90,0,0]) linear_extrude(height=usbc_recess_depth+0.1)
            hull() for (x=[-1,1]) for (z=[-1,1])
                translate([x*(usbc_recess_w/2-usbc_recess_corner_r),
                           z*(usbc_recess_h/2-usbc_recess_corner_r)])
                    circle(r=usbc_recess_corner_r);
}

// A 2D rounded rectangle used in the tray's X/Z front plane.
module tray_handle_rounded_rect_2d(w, h, r) {
    assert(w > 2*r && h > 2*r, "Tray handle corner radius is too large");
    hull() for (x=[-w/2+r, w/2-r]) for (z=[-h/2+r, h/2-r])
        translate([x,z]) circle(r=r);
}

module tray_u_handle_mount_pad(x, z) {
    // This pad grows backward from Y=0.1 into the original solid front wall,
    // so it cannot detach at a zero-thickness interface.
    translate([x,0.1,z]) rotate([90,0,0])
        linear_extrude(height=tray_u_handle_mount_depth+0.1)
            tray_handle_rounded_rect_2d(tray_u_handle_mount_w,
                                        tray_u_handle_mount_h,
                                        tray_u_handle_mount_corner_r);
}

module tray_surface_u_pull(tw, front_h) {
    assert(tray_u_handle_post_spacing + tray_u_handle_mount_w < tw,
           "U-handle mounts must remain inside the tray front");
    assert(tray_u_handle_mount_h < front_h,
           "U-handle mounts must remain inside the tray bay height");

    z = front_h/2;
    left_x = tw/2-tray_u_handle_post_spacing/2;
    right_x = tw/2+tray_u_handle_post_spacing/2;
    // The bar's front-most radius reaches -20.5 mm. Its rear surface remains
    // 11 mm ahead of the mount-pad face, forming an actual finger grip space.
    bar_y = -tray_u_handle_outer_reach+tray_u_handle_tube_r;

    // Two oval surface mounts, directly fused into the closed front panel.
    for (x=[left_x,right_x]) tray_u_handle_mount_pad(x,z);

    // Rounded standoffs lead from the two mounts to the bar. The spheres at
    // both ends make each elbow smooth rather than square or sharp.
    for (x=[left_x,right_x]) hull() {
        translate([x,-tray_u_handle_mount_depth+0.1,z])
            sphere(r=tray_u_handle_tube_r);
        translate([x,bar_y,z]) sphere(r=tray_u_handle_tube_r);
    }

    // The same endpoint spheres fuse this comfortable round bar to both legs,
    // producing a single surface-mounted U pull, not a separate loose handle.
    hull() for (x=[left_x,right_x])
        translate([x,bar_y,z]) sphere(r=tray_u_handle_tube_r);
}

module hdd_tray() {
    // 76.7 mm clears the fixed 78 mm guide channel by 0.65 mm per side.
    // Open top: drive drops in vertically; the old obstructing lips are gone.
    tw = tray_x-2*tray_slide_side_clearance;
    floor_h = 2;
    side_h = 8;
    side_w = 2.5; // retains 71.7 mm internal width for a 69.85 mm drive
    front_h = drive_opening_h-tray_front_top_clearance;
    drive_nominal_w = 69.85;
    drive_datum_x = (tw-drive_nominal_w)/2;
    drive_datum_y = 4;
    mounting_x = [(tw-61.72)/2, (tw+61.72)/2];
    mounting_y = [drive_datum_y+14, drive_datum_y+90.6];

    // Open rear centre: SATA connector and cable can exit the tray.
    difference() {
        union() {
            cube([tw, tray_y, floor_h]);
            cube([tw, 3, front_h]);
            // Solid front face with a two-post, surface-mounted U pull.
            // There is no opening cut through the middle of this panel.
            tray_surface_u_pull(tw, front_h);
            cube([side_w, tray_y, side_h]);
            translate([tw-side_w, 0, 0]) cube([side_w, tray_y, side_h]);
            // Two short corner guards leave the SATA face unobstructed.
            translate([0, tray_y-2, 0]) cube([4, 2, side_h]);
            translate([tw-4, tray_y-2, 0]) cube([4, 2, side_h]);
        }

        // Common 2.5-inch M3 mounting grid: 61.72 x 76.6 mm.
        // Verify against the specific drive manual before selecting screws.
        // 0.8 mm longitudinal slot travel; shallow underside countersinks.
        for (x = mounting_x) for (y = mounting_y) {
            hull() for (dy = [-0.4,0.4])
                translate([x,y+dy,-0.1]) cylinder(h=2.2,d=3.4);
            hull() for (dy = [-0.4,0.4])
                translate([x,y+dy,-0.01]) cylinder(h=1.41,d1=6.2,d2=3.4);
        }
        // Cooling grid retains perimeter beams and transverse support ribs.
        for (x = [17:13:56]) for (y = [25:17:76])
            translate([x,y,-0.1]) cube([8,11,2.2]);
        // Two supplementary side-mount holes per side, centred 3 mm above
        // the drive seating plane. Bottom screws are sufficient by themselves.
        for (y=mounting_y) {
            translate([-0.1,y,5]) rotate([0,90,0]) cylinder(h=3.2,d=3.4);
            translate([tw-3.1,y,5]) rotate([0,90,0]) cylinder(h=3.2,d=3.4);
        }
    }
}

module pi_bosses() {
    for (p = [
        [pi_x + 3.5,  pi_y + 3.5],
        [pi_x + 61.5, pi_y + 3.5],
        [pi_x + 3.5,  pi_y + 52.5],
        [pi_x + 61.5, pi_y + 52.5]
    ]) translate([p[0], p[1], floor]) {
        cylinder(h=n07_support_h-n07_neck_h-n07_taper_h,d=n07_foot_d);
        translate([0,0,n07_support_h-n07_neck_h-n07_taper_h])
            cylinder(h=n07_taper_h,d1=n07_foot_d,d2=n07_post_d);
        translate([0,0,n07_support_h-n07_neck_h])
            cylinder(h=n07_neck_h,d=n07_post_d);
    }
}

module corner_bosses() {
    // The screw-lid posts have been replaced by continuous slide channels.
    // This also removes the old posts that intersected the HDD trays.
    for (x=[0,body_x-wall])
        translate([x,0,body_z-0.2]) cube([wall,body_y,5.8]);
    for (x=[0,body_x-6])
        translate([x,0,body_z-1]) cube([6,body_y,1]);
    for (x=[0,body_x-5.4])
        translate([x,0,body_z+3.6]) cube([5.4,body_y,1.8]);
    // Rear positive stop. Front is open so the panel can slide all the way out.
    translate([0,body_y-wall,body_z-0.2]) cube([body_x,wall,5.8]);
}

module tray_guide_columns() {
    // A broad 1.8 mm front tip funnels into each 3 mm guide over 8 mm.
    // The entry has 1.85 mm side clearance before narrowing to 0.65 mm.
    translate([tray_x0-tray_guide_w, tray_y0+tray_slide_entry_len, floor])
        cube([tray_guide_w, tray_y+6-tray_slide_entry_len, tray_guide_h]);
    hull() {
        translate([tray_x0-tray_guide_w, tray_y0, floor])
            cube([tray_guide_front_w, 0.02, tray_guide_h]);
        translate([tray_x0-tray_guide_w, tray_y0+tray_slide_entry_len-0.02, floor])
            cube([tray_guide_w, 0.04, tray_guide_h]);
    }
    translate([tray_x0+tray_x, tray_y0+tray_slide_entry_len, floor])
        cube([tray_guide_w, tray_y+6-tray_slide_entry_len, tray_guide_h]);
    hull() {
        translate([tray_x0+tray_x+tray_guide_w-tray_guide_front_w, tray_y0, floor])
            cube([tray_guide_front_w, 0.02, tray_guide_h]);
        translate([tray_x0+tray_x, tray_y0+tray_slide_entry_len-0.02, floor])
            cube([tray_guide_w, 0.04, tray_guide_h]);
    }
}

module tray_slide_rail(x, z) {
    // The front is 0.6 mm below the final rail height and rises over 8 mm,
    // letting the tray enter smoothly before it rests on the rail top.
    translate([x, tray_y0+tray_slide_entry_len, z-tray_rail_h])
        cube([tray_rail_w, tray_y+6-tray_slide_entry_len, tray_rail_h]);
    hull() {
        translate([x, tray_y0, z-tray_rail_h])
            cube([tray_rail_w, 0.02, tray_rail_h-tray_rail_entry_drop]);
        translate([x, tray_y0+tray_slide_entry_len-0.02, z-tray_rail_h])
            cube([tray_rail_w, 0.04, tray_rail_h]);
    }
}

module tray_end_stop(x, z) {
    // Side-only stop: tray side walls touch it at the correct seated depth,
    // while the middle stays open for SATA connector and cable access.
    translate([x, tray_y0+tray_y, z])
        cube([tray_rail_w, tray_end_stop_t, tray_end_stop_h]);
}

module lid_slide_plate() {
    // Tapering only the leading 8 mm makes front insertion forgiving; the
    // remainder has the full 0.65 mm-per-side clearance in the fixed channel.
    hull() {
        translate([lid_plate_x0+lid_slide_entry_inset, 0, 0])
            cube([lid_plate_w-2*lid_slide_entry_inset, 0.02, 3]);
        translate([lid_plate_x0, lid_slide_entry_len-0.02, 0])
            cube([lid_plate_w, 0.04, 3]);
    }
    translate([lid_plate_x0, lid_slide_entry_len, 0])
        cube([lid_plate_w, lid_plate_y-lid_slide_entry_len, 3]);
}

module fan_ring() {
    // Hollow circular 40 mm-class intake ring, overlapping the side wall.
    difference() {
        translate([body_x-0.5, side_fan_y, side_fan_z])
            rotate([0,90,0]) cylinder(h=4.5, r=22);
        translate([body_x-1, side_fan_y, side_fan_z])
            rotate([0,90,0]) cylinder(h=6, r=18);
    }
}

module drive_back_bulkhead() {
    // A bulkhead closes the drive cage while leaving five VCOM adapter
    // windows.  The 54 x 16 mm clear mouths pass the 45 x 11 mm SATA head
    // and preserve 12 mm structural side posts on both sides.
    adapter_x0 = (tray_x-vcom_adapter_slot_w)/2;
    union() {
        cube([adapter_x0, 3, body_z]);
        translate([adapter_x0+vcom_adapter_slot_w, 0, 0])
            cube([tray_x-(adapter_x0+vcom_adapter_slot_w), 3, body_z]);
        for (i = [0:4]) {
            z0 = bay_z0 + i*tray_pitch;
            if (i == 0)
                translate([adapter_x0,0,0]) cube([vcom_adapter_slot_w,3,z0]);
            if (i < 4)
                translate([adapter_x0,0,z0+vcom_adapter_slot_h])
                    cube([vcom_adapter_slot_w,3,tray_pitch-vcom_adapter_slot_h]);
            if (i == 4)
                translate([adapter_x0,0,z0+vcom_adapter_slot_h])
                    cube([vcom_adapter_slot_w,3,body_z-(z0+vcom_adapter_slot_h)]);
        }
    }
}

module ethernet_board_support() {
    // Four underside pads and two side retainers hold the measured board.
    // The RJ45 edge and DC jack side remain open toward the rear wall.
    for (p = [
        [board_x0+4, board_y0+4],
        [board_x0+board_l-12, board_y0+4],
        [board_x0+4, board_y0+board_w-12],
        [board_x0+board_l-12, board_y0+board_w-12]
    ]) translate([p[0],p[1],floor])
        cube([8,8,board_base_z-floor]);
    translate([board_x0-3,board_y0,floor])
        cube([3,board_w,board_base_z-floor+1]);
    translate([board_x0+board_l,board_y0,floor])
        cube([3,board_w,board_base_z-floor+1]);
    translate([board_x0-0.5,board_y0,board_base_z+0.2])
        cube([0.5,board_w,1]);
    translate([board_x0+board_l,board_y0,board_base_z+0.2])
        cube([0.5,board_w,1]);
}

module base() {
    difference() {
        union() {
            cube([body_x, body_y, floor]);
            cube([wall, body_y, body_z]);
            translate([body_x-wall, 0, 0]) cube([wall, body_y, body_z]);

            // Front and rear perimeter walls are opened below for ports.
            cube([body_x, wall, body_z]);
            translate([0, body_y-wall, 0]) cube([body_x, wall, body_z]);

            // Drive-cage connector bulkhead and rear cable chase.
            translate([tray_x0, drive_back_y, 0]) drive_back_bulkhead();

            // Four separators create five independent cable lanes, one lane
            // per drive row, continuing toward the SATA/controller bay.
            for (i = [0:3]) {
                translate([tray_x0, chase_start_y, bay_z0+cable_lane_h+i*tray_pitch])
                    cube([cable_lane_width_safe, body_y-wall-chase_start_y+0.8, tray_pitch-cable_lane_h]);
            }

            // Divider: closed beside the Pi, open at the rear chase level.
            translate([90, 3, 0]) cube([3, 109, body_z]);
            translate([90, 3, 0]) cube([3, 39, 40]);
            translate([90, 3, 64]) cube([3, 39, body_z-64]);

            // Funnel-shaped side guides keep every tray centered.
            tray_guide_columns();

            fan_ring();

            // REV27: no separate five-port Ethernet-board compartment at the
            // rear. The ordinary Raspberry Pi Ethernet/USB side-port system
            // below stays independent and is therefore retained.
            if (!remove_rear_ethernet_box) ethernet_board_support();

            pi_bosses();
            corner_bosses();

            // Narrow support rails with entry ramps and positive side stops.
            for (i = [0:4]) {
                z = bay_z0 + i*tray_pitch;
                tray_slide_rail(tray_x0-tray_rail_outer_overlap, z);
                tray_slide_rail(tray_x0+tray_x-tray_rail_inward, z);
                tray_end_stop(tray_x0-tray_rail_outer_overlap, z);
                tray_end_stop(tray_x0+tray_x-tray_rail_inward, z);
            }
        }

        // Five front slide-in openings, 18 mm high for 7–15 mm drives.
        for (i = [0:4])
            translate([tray_x0, -2, bay_z0+i*tray_pitch]) cube([tray_x, wall+4, drive_opening_h]);

        // REV27: Close the complete rear five-port Ethernet-board zone: its
        // internal connector pocket, circular 12 V jack, and five RJ45 mouths
        // are all absent. This restores a continuous rear exterior wall.
        if (!remove_rear_ethernet_box) {
            // Blind internal pocket for the five-port board's connector bank.
            translate([rj45_bank_x-0.6, body_y-port_depth,
                       rj45_bank_z-0.6])
                cube([rj45_bank_w+1.2, port_depth-wall+0.2,
                      rj45_bank_h+1.2]);

            // Expose the board's circular 12 V barrel-power jack beside the
            // lower Ethernet row. The visible opening remains circular.
            translate([dc_jack_x, body_y-port_depth, dc_jack_z])
                rotate([-90,0,0]) cylinder(h=port_depth+2, r=dc_jack_r);

            // Five lower RJ45 openings aligned with the five-port board.
            for (p = rj45_port_slots)
                translate([p[0], body_y-ethernet_port_depth, p[1]])
                    cube([p[2], ethernet_port_depth+2, p[3]]);
        }

        // FRONT: one USB-C + TWO SEPARATE micro-HDMI openings.
        // Two enlarged HDMI openings retain a 3.9 mm central plastic web.
        front_profile_cut(front_usbc_center_x,"usbc");
        usbc_plug_recess();
        for (cx=front_hdmi_centers_x) front_profile_cut(cx,"hdmi");

        // The large rear air/capacitor opening belonged to the removed
        // Ethernet board, so it is closed with that rear compartment.
        if (!remove_rear_ethernet_box)
            translate([spare_air_hole_x, body_y-port_depth, spare_air_hole_z])
                rotate([-90,0,0]) cylinder(h=port_depth+2, r=spare_air_hole_r);

        // 40 mm fan opening on the Raspberry Pi/electronics side wall.
        translate([body_x-6, side_fan_y, side_fan_z]) rotate([0,90,0]) cylinder(h=9,r=18);

        // Pi shell pockets on the INSIDE only. The USB divider webs are
        // outside the metal fronts, not projected through the connector.
        for (cy=[side_pi_usb3_cy,side_pi_usb2_cy])
            translate([body_x-wall-0.2,cy-7.65,pi_pcb_under_z-0.5])
                cube([pi_face_mask_inner_x-(body_x-wall)+0.21,15.3,18.4]);
        translate([body_x-wall-0.2,side_pi_ethernet_cy-8.3,pi_pcb_under_z-0.9])
            cube([pi_face_mask_inner_x-(body_x-wall)+0.21,16.6,15.9]);

        // Right-side Pi ports: Ethernet + four USB-A, native corner mapping.
        translate([body_x-wall-0.2, side_pi_ethernet_slot[0],
                   side_pi_ethernet_slot[1]])
            cube([wall+2, side_pi_ethernet_slot[2],
                  side_pi_ethernet_slot[3]]);
        for (p=concat(side_pi_usb3_slots,side_pi_usb2_slots))
            translate([body_x-wall-0.2,p[0],p[1]])
                cube([wall+2,p[2],p[3]]);

        // Ventilation slots at the drive cage side.
        for (z = [10:13:94])
            translate([-2, 20, z]) cube([wall+4, 76, 4]);

        // N07 seats replace the continuous posts that passed through its PCB.
        // Four underside-access bores leave a 2 mm seating roof. Board +
        // stock brass spacer clamp to the roof using an upward M2.5 x 6 screw.
        for (p = [
            [pi_x + 3.5,  pi_y + 3.5],
            [pi_x + 61.5, pi_y + 3.5],
            [pi_x + 3.5,  pi_y + 52.5],
            [pi_x + 61.5, pi_y + 52.5]
        ]) {
            translate([p[0],p[1],-1])
                cylinder(h=n07_under_z-n07_seat_t+1,d=n07_head_access_d);
            translate([p[0],p[1],n07_under_z-n07_seat_t-0.01])
                cylinder(h=n07_seat_t+1,d=n07_screw_clear_d);
        }
    }
}

module top() {
    difference() {
        union() {
            // 0.65 mm side clearance plus tapered first 8 mm for easy entry.
            lid_slide_plate();
            // Raised textured pull grip, no extra lid cutout or screws.
            translate([106,3,2.8]) cube([24,5,2]);
            for (x=[108:4:128]) translate([x,3,4.7]) cube([1,5,0.6]);
            // Full plate overlaps the lid by 0.5 mm, preventing floating rails.
            translate([screen_x0, screen_y0, screen_support_z])
                cube([screen_w, screen_h, screen_plate_h]);
            // Generic 120 x 75 mm support frame for a 5-inch screen.
            translate([screen_x0, screen_y0, 3])
                cube([screen_w, screen_rail_t, screen_support_h]);
            translate([screen_x0, screen_y0+screen_h-screen_rail_t, 3])
                cube([screen_w, screen_rail_t, screen_support_h]);
            translate([screen_x0, screen_y0, 3])
                cube([screen_rail_t, screen_h, screen_support_h]);
            translate([screen_x0+screen_w-screen_rail_t, screen_y0, 3])
                cube([screen_rail_t, screen_h, screen_support_h]);
        }
        // 80 mm exhaust fan over the drive cage.
        translate([45, 55, -1]) cylinder(h=5, r=37);
        for (p = [[9,18], [81,18], [9,92], [81,92]]) {
            translate([p[0],p[1],-1]) cylinder(h=5,r=fan_screw_hole_r);
            translate([p[0],p[1],2]) cylinder(h=2,r=fan_screw_head_r);
        }
        // Opening A: auxiliary fan preserved by the owner's selection of B.
        if (!remove_aux_top_fan) {
        translate([aux_top_fan_x, aux_top_fan_y, -1])
            cylinder(h=5, r=aux_top_fan_r);
        for (p = [
            [aux_top_fan_x-aux_top_fan_mount, aux_top_fan_y-aux_top_fan_mount],
            [aux_top_fan_x+aux_top_fan_mount, aux_top_fan_y-aux_top_fan_mount],
            [aux_top_fan_x-aux_top_fan_mount, aux_top_fan_y+aux_top_fan_mount],
            [aux_top_fan_x+aux_top_fan_mount, aux_top_fan_y+aux_top_fan_mount]
        ]) {
            translate([p[0],p[1],-1]) cylinder(h=5,r=fan_screw_hole_r);
            translate([p[0],p[1],2]) cylinder(h=2,r=fan_screw_head_r);
        }
        }
        // Opening B removed: no square cable cutters remain in the lid.

        // REV27: the small centered 1-inch lid circle is removed. The screen
        // support frame remains, but the lid surface below it is now solid.
        if (!remove_small_lid_circle)
            translate([screen_opening_x, screen_opening_y, -1])
                cylinder(h=8, r=screen_wire_opening_d/2);
    }
}

if (part == "base") base();
else if (part == "top") top();
else if (part == "tray") hdd_tray();
else {
    color("#a4b0ba") base();
    color("#63849c") translate([0,lid_slide,body_z]) top();
    for (i = [0:4])
        color("#c59b64") translate([tray_seated_x,tray_y0+tray_slide,tray_seated_z+i*tray_pitch]) hdd_tray();
}
