# Rassberi-PI5-Server-Box-

This is a modular Raspberry Pi 5 five-bay NAS/server enclosure: a 240 × 145 × 102 main shell with 3 mm walls and floor. It has five front-loading 2.5-inch HDD/SSD trays on the left and the Raspberry Pi 5/N07 NVMe area on the right. The lid slides out through the front on guided rails; it is not a fixed screw-on lid.
The Pi 5 is mounted with its USB-C power and two Micro-HDMI ports facing the front wall, and its Ethernet plus four USB-A ports facing the right wall. No Pi ports are placed on the top.
Wall	Pi 5 opening	Case cutout
Front	USB-C power	11.5 × 5.5 capsule opening, with a larger 13.2 × 7.3 × 2.4 deep outer recess for thick USB-C plug housings
Front	Micro-HDMI 0	9.5 × 6.5 opening
Front	Micro-HDMI 1	9.5 × 6.5 opening
Right side	Gigabit Ethernet RJ45	16.0 × 13.5 opening
Right side	2× USB 3.0 Type-A	Two separate 14.0 × 6.6 openings
Right side	2× USB 2.0 Type-A	Two separate 14.0 × 6.6 openings


From left to right along the Pi front edge, the ports are USB-C, Micro-HDMI 0, then Micro-HDMI 1. Their PCB-datum centre positions are 11.2 mm, 25.8 mm, and 39.2 mm, so the HDMI and USB-C openings stay close together like the real Pi 5.
The Raspberry Pi 5 board footprint used by the model is 85 × 56 mm with a 1.336 mm PCB datum. The enclosure supports the real Pi 5 port set: one USB-C power input, two Micro-HDMI display outputs, one Gigabit Ethernet port, two USB 3.0 ports, and two USB 2.0 ports. The Pi 5 itself has a quad-core 2.4 GHz Cortex-A76 processor, dual 4Kp60 Micro-HDMI capability, PCIe 2.0 x1, microSD, Wi-Fi/Bluetooth, GPIO, and MIPI connectors. Raspberry Pi recommends proper cooling and a 5 V/5 A USB-C supply for sustained loads. Official Pi 5 specifications
Under the Pi is an allowance for your GeeekPi N07 MiniTower NVMe adapter using its original brass spacers. The N07 board is only a fit reference and is not included as printable geometry. Its allocated bay is 4 inches / 101.6 mm long—not 4 inches tall. The under-Pi area uses a compact 10 mm SSD/underside allowance, a 7 mm Pi-to-N07 spacer gap, and places the Pi PCB underside about 21.6 mm above the case floor.
The storage side has five individual 2.5-inch drive trays:
- Each tray uses a 78 mm guide channel and a 76.7 mm printed tray body.
- Tray depth is 108 mm.
- It supports 7, 9.5, 12.5, and 15 mm thick 2.5-inch HDDs or SSDs.
- Each tray has a solid front panel with a permanently fused, rounded U-pull handle—no centre hole.
- The handle uses a 7 mm round bar, 44 mm post spacing, an 11 mm finger gap, and projects about 20.5 mm forward.
- The rear includes a 54 × 16 mm pass-through and cable corridor for the VCOM USB 3.0-to-SATA adapter head; the VCOM cable itself is not printed.
Cooling is built into the shell:
- One large top exhaust opening sized around a 74 mm clear diameter for an 80 mm-class fan.
- One retained auxiliary top fan opening.
- One right-side Pi/electronics intake opening with a 36 mm clear bore and 44 mm outer ring.
- Side ventilation slots by the drive cage.
- Fans are not included as printed solids.
The lid includes a generic 120 × 75 mm support frame for a 5-inch display. The small centred screen cable circle is removed and filled solid. The former rear five-port Ethernet-board compartment, its five RJ45 holes, 12 V round jack hole, and large rear capacitor/air opening are also removed. The normal single Pi 5 Ethernet opening on the right side remains.
The complete editable source is in one file: [REV27 Pi 5 server-box source](C:/Users/saeed/Documents/Codex/2026-09-13/this-is-almost-perfect-almost-see/outputs/REV27_NO_CIRCLE_NO_REAR_ETHERNET/Server_Box_REV27_NO_CIRCLE_NO_REAR_ETHERNET.scad). Set part to base, top, or tray to export the individual printable parts; assembly is only for viewing the complete layout. The packaged release
