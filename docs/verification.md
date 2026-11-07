# Verification notes

## What was checked

Static checks were run on the repository during the documentation pass (7 November 2026):

| Check | Result |
|---|---|
| `patch/Photosynthesis_StateMachine_Collage.maxpat` parses as JSON | Pass |
| Object and subpatcher count | 1,861 objects, 28 subpatchers |
| Abstractions referenced by the patch | 10 `.maxpat` files plus `smooth~`; all 13 supplied files are present |
| Leaf images referenced by `importmovie` | `Leaf1`, `Leaf2`, `Leaf3`, `Leaf4`, `Leaf6`, `Leaf7`, `Leaf8`, `Leaf9`, `Leaf10` — all present |
| Environmental WAVs | Not stored in the repository; linked from the README media table |
| VST plug-ins | Absent by design (commercial); substitution documented |
| Arduino sketch | Absent from the supplied files; documented |
| `REPORT.pdf` opens and has the expected page count | Pass — 7 pages |
| `USER_GUIDE.docx` opens | Pass |
| Repository images referenced by both READMEs exist | Pass |
| Media URLs | Hosted on Google Drive; set to *anyone with the link can view* |

The demonstration and walkthrough videos document the system running on the author's setup and
are the evidence for the behaviour described in the documentation. **No new runtime test was
performed on the machine that prepared this repository**, and the Arduino rig, the VST plug-ins
and the original Soundly samples were not available: the checks above cover the files, not a
fresh end-to-end installation.

## Optional checks on a fresh installation

1. **Patch opens.** Open the main patch from the shipped folder layout. No missing-abstraction
   dialogs should appear (missing WAV/VST dialogs are expected).
2. **Collage loads.** Nine leaves appear in a 3×3 grid in the Jitter window.
3. **Light input responds.** Moving the mouse (or moving a light over the sensors) brightens
   and grows the corresponding cell.
4. **Audio runs.** With Max audio enabled and the VST plug-ins installed, voices and the drone
   are audible.
5. **State advances.** As several units mature, the colour system and sparkle behaviour change
   and environmental layers fade in (once the WAVs are downloaded or substituted).
6. **Tempo converges.** After maturity, per-state BPM converges toward the global maximum.

Report the results of steps 2–6 only from the human's observation: they involve hearing and
seeing a GUI application, which cannot be checked from the repository.
