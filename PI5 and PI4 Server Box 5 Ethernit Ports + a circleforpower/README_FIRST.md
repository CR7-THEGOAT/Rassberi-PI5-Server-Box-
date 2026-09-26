# REV26 — complete all-new model

This is the single current version of the complete Raspberry Pi 5 server box. It includes the latest body and port layout, the removable slide-out lid, the five storage bays, the rear VCOM USB-to-SATA adapter clearance, and the latest solid-front trays with attached round U-shaped handles.

## One file that shows everything

**`Server_Box_REV26_ALL_NEW_ASSEMBLY.stl`** contains the base, lid, and all five latest trays together in their correct assembled positions. Use it to inspect the entire finished model in your slicer or 3D viewer.

It has seven disconnected printable components inside one STL, so do **not** slice it as one print-in-place object.

## Files to print

- `base_REV26.stl` — print once.
- `top_REV26_slide_lid.stl` — print once.
- `tray_REV26_U_Pull.stl` — print five copies, one per drive bay.

## Latest tray details

- Solid front panel: there is no center hole through the tray face.
- Real surface-mounted U pull: round 7 mm bar, two rounded end mounts, and approximately 11 mm finger clearance behind the bar.
- Each handle is fused to its tray as one watertight printable solid.

## Included source

`Server_Box_REV26_ALL_NEW.scad` is the full editable OpenSCAD source with `part = "base"`, `"top"`, `"tray"`, or `"assembly"` support.

No GeeekPi case or fan is included as printable geometry. Test one tray in your printed base before printing all five.
