# Release notes

## v1.0.0 — initial public release

First publication of *Photosynthesis State-Machine Collage*.

### Included

- `patch/Photosynthesis_StateMachine_Collage.maxpat` — the complete Max/MSP patch: Arduino
  input, per-leaf distance and growth, the nine-unit state machine, MIDI/voice generation,
  audio bus with VST processing, Jitter collage and sparkle system.
- `patch/Photosynthesis_StateMachine_Collage_Files/Levan_Patch/` — 13 Max abstractions.
- `patch/Photosynthesis_StateMachine_Collage_Files/S2_Leaf/` — the nine leaf images and the
  media replacement guide.
- `REPORT.pdf` — the written report (7 pages).
- `USER_GUIDE.docx` — the author's prototype user guide.
- `docs/` — operating guide, AI-assistant setup guide, environment notes, verification notes
  and annotated patch figures.
- Demonstration video, technical walkthrough and audio recording, hosted on Google Drive and
  linked from the README.

### Known limitations

- The two environmental WAVs come from a commercial Soundly library and are not stored in the
  repository; the README links them from Google Drive, and replacements are documented in
  `patch/…/S2_Leaf/README.md`.
- Valhalla VintageVerb and Scarred Piano are commercial plug-ins and are not included; the
  patch runs without them but their voices stay silent.
- The Arduino sketch, described in the report, was not among the supplied project files.
- The patch's dependency cache stores the author's absolute paths, so Max needs the project
  folder or a search-path entry.
- No automated tests; verification is documented in [verification.md](verification.md).

### Licence

Patch and abstractions: PolyForm Noncommercial 1.0.0. Documentation, report and leaf images:
CC BY-NC 4.0. See [NOTICE.md](../NOTICE.md).
