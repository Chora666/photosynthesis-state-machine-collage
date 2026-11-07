# Setup guide for AI assistants

*Written for AI assistants helping a human install and run this project. If you are a person,
[the setup guide](setup-guide.md) is the shorter route.*

You are reading this because someone asked you, an AI agent, to help run **Photosynthesis
State-Machine Collage** — an interactive audiovisual installation in Max/MSP that grows a
collage of luminous leaves from light input and generates ambient music from the result.

This file tells you what is in the repository, what is missing, what to install, how to resolve
the project folder, and how to verify the result. Follow it in order.

**Read this first, it changes the plan:** Max is a GUI application and the piece needs light
input, audio and a Jitter window. You cannot launch it headlessly or hear it. Your job is to
prepare the environment, run the static checks below, and then guide the human through the GUI
steps and ask them to confirm what they see. Do not claim the audio or visuals work — only the
human can confirm that.

---

## 1. Facts, verified from the files

| Item | Value |
|---|---|
| Repository | `https://github.com/Chora666/photosynthesis-state-machine-collage` |
| Main patch | `patch/Photosynthesis_StateMachine_Collage.maxpat` — 1,861 objects, 28 subpatchers |
| Max version saved in the patch | 9.0.8 (x64) |
| Abstractions | 13 `.maxpat` files in `Photosynthesis_StateMachine_Collage_Files/Levan_Patch` (11 are loaded directly by the main patch) |
| Images | 9 leaf PNGs in `Photosynthesis_StateMachine_Collage_Files/S2_Leaf` (1024×1024) |
| Environmental audio | Two Soundly recordings referenced by `buffer~`; **not stored**, linked from the README media table |
| VST plug-ins | Valhalla VintageVerb and Scarred Piano — commercial, not included |
| Hardware | Arduino with four light sensors in the prototype video; the **distributed patch simulates the light with the mouse and random brightness** |
| Media | demonstration and walkthrough videos on Google Drive |
| Documents | `REPORT.pdf` (7 pages) and `USER_GUIDE.docx` |

## 2. Clone and check the files

```bash
git clone https://github.com/Chora666/photosynthesis-state-machine-collage.git
cd photosynthesis-state-machine-collage
```

Validate the patch structure without opening Max:

```bash
python3 - <<'PY'
import json, os
p = "patch/Photosynthesis_StateMachine_Collage.maxpat"
d = json.load(open(p))
patcher = d["patcher"]
def count(pat):
    n = len(pat.get("boxes", []))
    for b in pat.get("boxes", []):
        if "patcher" in b.get("box", {}):
            n += count(b["box"]["patcher"])
    return n
print("saved with:", patcher["appversion"])
print("objects:", count(patcher))
print("dependencies:")
for dep in patcher.get("dependency_cache", []):
    print("  ", dep.get("name"), "->", dep.get("bootpath"))
for f in ["Leaf1","Leaf2","Leaf3","Leaf4","Leaf6","Leaf7","Leaf8","Leaf9","Leaf10"]:
    path = "patch/Photosynthesis_StateMachine_Collage_Files/S2_Leaf/%s.png" % f
    print(f, os.path.exists(path))
PY
```

Expected: version 9.0.8, about 1,861 objects, the abstractions listed with bootpaths pointing at
the author's old machine (`~/Desktop/Program/Max/Levan_Patch`), and all nine images present.
The old bootpaths are exactly why Max must be given the project folder or an explicit search
path — do not edit the patch to fix them unless the human asks.

Check the documents:

```bash
python3 -c "import pypdf; print(len(pypdf.PdfReader('REPORT.pdf').pages))"   # 7
unzip -l USER_GUIDE.docx | head
```

## 3. What the patch contains

- `p Arduino` — two `serial` connections at 9600 baud, scaling of the sensor values, light
  position and level buses (`LightX`, `LightY`, `A_LightLevel`).
- Per-leaf sections — distance from the light spot, growth and decay rates, the leaf state
  machine, a MIDI generator per leaf (`p leaf1midi` … `p leaf9midi`), colour buses.
- `p Counter` — nine `YNumberCounter` subpatchers that accumulate maturity.
- `p ColorSystem`, `p StarSystem` — tinting and the sparkle layer.
- `p SoundCreate`, `p Sound` — voices, `vst~`/`mc.vst~`, the `cycle~` drone, reverb, mixing.
- `p LoadSet` — loads the nine images at start (`importmovie`).
- `p OB`, `p SignalAmplification`, `p Quantitative calculation process` — helpers.

## 4. Resolve the project folder

The patch resolves abstractions and images relative to its project folder. Do one of:

1. Keep the shipped layout (`maxpat` beside `Photosynthesis_StateMachine_Collage_Files/`) and
   open the patch from there.
2. Add `Photosynthesis_StateMachine_Collage_Files/Levan_Patch` and
   `Photosynthesis_StateMachine_Collage_Files/S2_Leaf` to *Options → File Preferences*.

If Max reports that abstractions are missing, check these paths before anything else.

## 5. Missing media and plug-ins — tell the human plainly

- **Environmental WAVs:** the patch loads `Ambience_Forest_Birds_WindInTrees.wav` and
  `Wind_Vegetation_Forest_Leaves.wav` into buffers named `Birds` and `Wind`. They are Soundly
  recordings and are not stored in the repo; the README's media table links them from Google
  Drive. Download them into `S2_Leaf/` or substitute your own, following
  `patch/Photosynthesis_StateMachine_Collage_Files/S2_Leaf/README.md`. Without them the piece
  runs with the ambience layers silent.
- **VST plug-ins:** Valhalla VintageVerb and Scarred Piano are commercial and not distributed.
  The Valhalla snapshot files the patch references are also absent. Without the plug-ins the
  patch opens but those voices are silent; the human can substitute instruments.
- **Arduino sketch:** referenced by the report but absent from the files. The distributed patch
  does not need it: it is set up with a mouse and random-brightness simulation
  (`docs/visuals/release-note.png`). The hardware version would read `serial c` / `serial f` at
  9600 baud.

## 6. Launch and verify

1. Max open, patch loaded, images imported (the Jitter window shows a 3×3 collage).
2. Audio configured and enabled in Max.
3. The human moves the mouse or a light; the collage responds.

What to ask the human:

| Ask | Expected |
|---|---|
| "Did the collage load — nine leaves in a 3×3 grid?" | Yes |
| "When you move the mouse (or the light), does a cell brighten and grow?" | Yes |
| "Do you hear the voices and the drone?" | Yes, once audio and plug-ins are set up |
| "Did the state change after several units matured?" | Yes, colour and sparkle behaviour change |
| "Any missing-file dialogs?" | Only the expected WAV/VST ones |

## 7. When it does not work

| Symptom | Cause | Fix |
|---|---|---|
| Missing abstractions on open | Project folder not resolved | Open from the shipped layout or add the `Levan_Patch` path |
| Empty collage | Images not found | Add `S2_Leaf` to File Preferences; confirm the nine PNGs exist |
| No sound | Audio disabled or no device | *Options → Audio Status*, enable audio, choose output |
| Light input does nothing | Serial ports wrong or no sketch | Reassign the serial port letters or use the mouse |
| Nothing ever matures | Light not held on the units long enough | Keep light on units; check the growth/decay comments in the patch |
| A VST voice is silent | Plug-in missing | Install it or substitute another instrument |

## 8. Your boundaries

- Do not claim to have seen or heard the installation. Static checks and the human's report are
  all you have.
- Do not redistribute the Soundly recordings, the VST plug-ins or their presets.
- Do not rewrite the patch's serial ports, search paths or media file names unless the human
  asks; explain first.
- Do not edit the report PDF, the user guide or the licence notices. The patch is licensed for
  noncommercial use only; commercial use needs a separate licence (see `NOTICE.md`).

## 9. Further reading

- [`setup-guide.md`](setup-guide.md) — wiring, search paths, interaction, states, shutdown.
- [`../REPORT.pdf`](../REPORT.pdf) — the report (concept, architecture, sound, visuals,
  reflection, credits).
- [`../USER_GUIDE.docx`](../USER_GUIDE.docx) — the author's prototype user guide.
- [`architecture/`](architecture/) — annotated patch figures from the walkthrough video.
- [`environment.md`](environment.md) — what the project files do and do not record.
