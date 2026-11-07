# Environment and dependencies

## What the project files record

| Item | Value | Source |
|---|---|---|
| Max version saved in the patch | 9.0.8, x64 | `patch/Photosynthesis_StateMachine_Collage.maxpat` |
| Patch size | 1,861 objects across 28 subpatchers | the patch file |
| Abstractions | 13 `.maxpat` files | `…_Files/Levan_Patch/` |
| Leaf images | 9 PNGs, 1024×1024 | `…_Files/S2_Leaf/` |
| Environmental buffers | `Birds`, `Wind` (WAV, linked from the README) | `buffer~` objects in the patch |
| Arduino link | prototype: four light sensors, two `serial` objects at 9600 baud, port letters `c` and `f` | `p Arduino` |
| Light input in this release | simulated with the mouse and random brightness (author's release note) | `docs/visuals/release-note.png` |
| VST plug-ins | Valhalla VintageVerb, Scarred Piano | the report's credits |
| Report | 7 pages | `REPORT.pdf` |
| User guide | `USER_GUIDE.docx` | the repository |
| Demonstration video | 3840×2160, 633 s | the supplied master file |
| Walkthrough video | 1280×720, 582 s | the supplied file |

## What was not recorded

The project files do not record the computer or interface used, the operating system, the
Arduino board model, the sensor model or the wiring. The dependency cache in the patch stores
absolute bootpaths from the author's machine (`~/Desktop/Program/Max/Levan_Patch` and
`~/Documents/Max 9/Snapshots`); those paths are historical and are not part of the repository.

The two Valhalla snapshot files referenced by the patch
(`ValhallaVintageVerb_20251204.maxsnap`, `ValhallaVintageVerb_20251207_1.maxsnap`) are not
distributed: they are plug-in preset states for a commercial plug-in.

## Reproduction limits

- **Commercial audio is not stored in the repository.** The two environmental recordings come
  from Soundly (`SND0432`, `SND0247`) and are linked from the README's media table; the buffers
  stay empty until you download them or supply replacement audio.
- **Commercial plug-ins are omitted.** Valhalla VintageVerb and Scarred Piano must be installed
  separately, or substituted, otherwise the VST voices are silent.
- **The Arduino sketch is missing.** The report says it was included with the submitted
  project, but no `.ino` file was among the files supplied for this repository. The distributed
  patch therefore uses the mouse and random-brightness simulation described in the author's
  release note; the prototype in the demo video is the hardware version. The patch's serial
  expectations are documented in the [setup guide](setup-guide.md).
- **Search paths must be resolved.** Max may have stored the author's absolute abstraction
  paths; open the patch from its project folder or add the folders to File Preferences.
- **Media links.** Videos and audio live on Google Drive; static checks cannot establish that a
  signed-out visitor can play them.
- The nine leaf images were generated with an AI-assisted workflow and are distributed with the
  project. They carry the same noncommercial documentation licence as the rest of this
  repository; see [NOTICE.md](../NOTICE.md).

## Machine-independent requirements

- Max 9 (saved 9.0.8) with Jitter
- A stereo audio output
- Valhalla VintageVerb and Scarred Piano, or substitutes
- Arduino and four light sensors for the physical interaction, or the mouse fallback
- Replacement WAVs for the two environmental buffers, or run without those layers
