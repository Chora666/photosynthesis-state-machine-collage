# Setup and operating guide

How to open, connect, play and shut down the installation. Software requirements are listed in
the [main README](../README.md); this page is the operating manual. It expands the author's
[USER_GUIDE.docx](../USER_GUIDE.docx) with the file and patch details needed on a new machine.

## 1. Project files

| Path | Purpose |
|---|---|
| `patch/Photosynthesis_StateMachine_Collage.maxpat` | The main Max/MSP patch |
| `patch/Photosynthesis_StateMachine_Collage_Files/Levan_Patch/` | 13 Max abstractions used by the patch |
| `patch/Photosynthesis_StateMachine_Collage_Files/S2_Leaf/` | The nine leaf images; where the two environmental WAVs belong |

The main patch and its `_Files` folder must stay side by side, and the abstractions must stay
inside `Levan_Patch/`. The patch also refers to two Valhalla VintageVerb snapshot files by
name; those snapshots are not distributed, and Max will simply skip them.

## 2. Software

- **Max 9** with **Jitter**. The patch records Max **9.0.8** (x64) as its saved version.
- **Valhalla VintageVerb** and **Scarred Piano** VST plug-ins, for the intended timbres
  (`vst~`, `mc.vst~`). Both are commercial; substitute your own instruments if you do not have
  them. The patch still opens without them — the VST voices are simply silent.
- **Arduino IDE** if you are running the physical sensor rig. The sketch is **not** included;
  see §5.
- A stereo audio output and a dim room.

## 3. Resolving the project folder and search paths

Max needs to find the abstractions and the images. Do one of the following:

1. Open the patch from the folder as shipped (`.maxpat` beside `_Files/`) and let Max treat
   that folder as the project. This is how the author's machine was set up.
2. Or add the abstractions folder explicitly: `Options → File Preferences → Add Path…` and
   choose `patch/Photosynthesis_StateMachine_Collage_Files/Levan_Patch`. Do the same for
   `S2_Leaf` if the images or WAVs are not found.

The abstractions in `Levan_Patch` are: `leafvoice`, `leaf_drone`, `Airy_Shimmer`,
`Airy_Shimmer_Pad`, `Pad_Air`, `Bell`, `A_Click`, `Organic_Click`, `Digital_Input_Device`,
`LFO_Cycle`, `MidiInputDataCollector`, `Coll_Cmaj7`, `smooth~`.

## 4. Media

- **Leaf images** ship with the repository: `Leaf1`, `Leaf2`, `Leaf3`, `Leaf4`, `Leaf6`,
  `Leaf7`, `Leaf8`, `Leaf9`, `Leaf10` (PNG, 1024×1024). The patch imports them at load time;
  if they are missing the collage cells stay empty. `Leaf10.png` is the central lotus.
- **Environmental WAVs are not stored in the repository.** The README's media table links both
  files from Google Drive; download them into `S2_Leaf/`, or supply replacement audio named
  `Ambience_Forest_Birds_WindInTrees.wav` and `Wind_Vegetation_Forest_Leaves.wav`, or run
  without those layers. Details and provenance are in the
  [media guide](../patch/Photosynthesis_StateMachine_Collage_Files/S2_Leaf/README.md).

## 5. Light input

**The distributed patch is set up for hardware-free viewing.** The author's release note
([release-note.png](visuals/release-note.png)) explains that, because no Arduino was connected
on the viewer's machine, the patch includes a mouse and random-brightness simulation of the
lighting. You can open and run the piece as shipped, without an Arduino.

The physical prototype described in the report and shown in the demo video uses four light
sensors on an Arduino. To run that version:

1. Connect the board and find its port in Max (*Options → Serial Ports*, or the port menu on
   the `serial` objects).
2. The `p Arduino` subpatcher opens two serial connections at 9600 baud (`serial c 9600` and
   `serial f 9600`). Reassign the letters so both point at the port(s) your hardware appears on.
3. The Arduino sketch that formats the sensor data was not among the project files — if you are
   rebuilding the rig, write it to send the light values the patch expects.

For the released version, move the mouse across the visual area and the light spot follows
(`Get Mouse Location` in the patch, `mouseX` / `mouseY` buses).

## 6. First run

1. Start Max, open `patch/Photosynthesis_StateMachine_Collage.maxpat`.
2. Wait for the images to import (the patch sends nine `importmovie` messages from a
   `loadbang`). The Jitter window opens at 3×3.
3. Configure Max audio: *Options → Audio Status*, choose a stereo output, enable audio.
   The sound is generated inside Max — there is no DAW in the chain.
4. Set a conservative master level. The piece can build up; start low.
5. Calibrate the light input: shine a light at the sensors (or move the mouse) and check that
   the corresponding collage cell brightens.
6. Click the **GStart** toggle — the main start control, called the Start button in the user
   guide. The state machine begins to accumulate maturity.
7. To stop, switch the same control off / press the Stop control as described in the user
   guide; then close the patch.

## 7. Interface and interaction

- **Light spot** — the position and brightness of the light on the sensor board (or the mouse).
  Stronger light brightens the corresponding circle, expands the visuals and feeds growth.
  Weaker light contracts and decays them.
- **Nine units** — each has a distance to the light spot, a growth state and a voice. The
  visual cell brightens, shifts from yellow toward green, and — in the central lotus — toward
  red and purple as the global level rises.
- **Maturity count** — the global measure of how many units have matured; it drives the state
  machine and the state's visual arrangement.
- **Sparkles** — sparse white-green points; later states add random colours.

The user guide summarises the state visuals as:

| Element | Early state | Later state |
|---|---|---|
| Leaves | invisible at minimum brightness; yellow as light raises them; then a non-linear drift to green | brighter, greener, fuller |
| Central lotus | invisible, then yellow | drifts to red/purple as global volume rises |
| Sparkles | white and green, sparse | white, green and random colours together |

## 8. Sound behaviour

- **Leaf voices** — each leaf has its own timbre (Max synthesis or VST) and its own texture
  algorithm. Volume and note generation respond to the light spot's distance from the unit.
- **Central lotus** — a continuously fluctuating `cycle~` layer that carries the current global
  harmony (Cmaj7 / Fmaj7). The viewer's light position changes its stability.
- **Environmental layers** — leaf rustle and bird calls (`groove~` on the two buffers), fading
  in only after maturity thresholds.
- **Pulse** — density and breathing rhythm follow the current state.

Sound does not loop: it evolves, mutates and transitions between states.

## 9. Harmony and tempo

- The harmonic centres are **Cmaj7** and **Fmaj7**; the transition between them is decided by
  the number of mature units.
- At the highest maturity threshold the patch shifts key globally.
- Each state has its own BPM mapping. Before maturity, BPM follows the unit's internal state
  value; at maturity it converges to the global maximum — the asynchronous units gradually
  synchronise.

## 10. Recording

The patch has no recorder. To document a run, capture Max's stereo output with screen/audio
capture software, or route Max's output into an audio interface and record there.

## 11. Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| Leaves do not appear | Images not found | Add `S2_Leaf` to Max's search path, or open the patch from its project folder |
| Patch opens with missing-file warnings | Environmental WAVs absent (expected) or VST plug-ins missing | Supply the WAVs; install the plug-ins or ignore the VST voices |
| No sound | Max audio not enabled, or no output device chosen | *Options → Audio Status*; enable audio; set a device |
| Light does not move the visuals | On the hardware version: serial port letters wrong or sketch not running | Reassign ports in `p Arduino`, or use the mouse in the released version |
| Visuals stop changing | All units are at a limit state | Change the light input or use the mouse to trigger a transition |
| Collage looks dark | Light level is low, or the room is bright | Dim the room and point the light at the sensors; the piece is designed for darkness |
| Per-leaf voice silent | Its growth state never crossed the trigger threshold | Keep light on that unit for longer |

## 12. Verify a fresh setup

Use the [verification checklist](verification.md). The demo and walkthrough videos document the
system running on the author's setup; no new runtime test was performed for this documentation.
