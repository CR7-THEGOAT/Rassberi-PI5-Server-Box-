# REV22 — VCOM USB-to-SATA adapter clearance

This revision fixes the rear HDD cable passage for the VCOM USB 3.0-to-SATA
adapter cable used with your 2.5-inch SSD/HDD.  The adapter is **not** added to
the printable model; only the space it needs is added.

## What changed

- All five rear HDD pass-through openings are now **54 mm wide × 16 mm high**.
- The rear cable chase reserves **30 mm** from the rear edge of a standard
  100 mm-long 2.5-inch drive to the inside of the rear wall.
- The pass-through is centered in each drive bay and keeps **12 mm printed
  structural posts** on the left and right.
- The lid, HDD tray, tray pull handles, Raspberry Pi ports, fan openings, and
  outer box dimensions are unchanged from REV21.

## Adapter clearance used for the design

The VCOM CU815 product family is a USB 3.0-to-2.5-inch-SATA cable.  VCOM does
not publish a complete molded-head drawing, so this model checks a deliberately
conservative **50 mm wide × 11 mm high × 30 mm deep** non-printing clearance
envelope.  That leaves 2 mm at each side of the 54 mm opening and 3 mm above
the 11 mm tall envelope when it rests on the tray floor.

Measure your exact cable head before printing all five trays: similar-looking
USB-to-SATA adapters can have different molds.

## Print files

- `base_REV22.stl` — the changed enclosure body
- `top_REV22.stl` — unchanged removable slide-in lid
- `tray_REV22.stl` — unchanged pull-handle tray; print it five times
- `Server_Box_REV22_ASSEMBLY.stl` — reference assembly only; do not print it
  as one object
- `Server_Box_REV22.scad` — consolidated editable OpenSCAD source

Print the body, lid, and five trays as separate parts.  Insert a tray, attach
your VCOM SATA head through the new rear opening, and test one complete drive
before printing the rest.

## Verified

- A 50 × 11 × 30 mm adapter envelope has zero collision with the new body and
  seated tray in every one of the five bays.
- The same envelope collided with the older 38 mm-wide pass-through.
- Each printable part is one watertight solid.
- The five tray extraction paths and their existing rear stops remain valid.
- No VCOM cable, drive, Raspberry Pi, N07 kit, fan, or other reference hardware
  is included as printable geometry.
