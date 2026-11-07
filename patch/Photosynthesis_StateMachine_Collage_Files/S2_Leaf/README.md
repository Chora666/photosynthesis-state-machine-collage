# Samples and images in this folder

The patch loads its media from file names, not by browsing. This folder is where the
original project kept them, and it is the easiest place to put replacements.

## Leaf images — included

Nine PNG files are required and are shipped here:

```
Leaf1.png   Leaf2.png   Leaf3.png   Leaf4.png
Leaf6.png   Leaf7.png   Leaf8.png   Leaf9.png   Leaf10.png
```

The patch imports them at load time with `importmovie` into matrices `Leaf1`–`Leaf9` and
composites them with `jit.glue @rows 3 @columns 3`. `Leaf10.png` is the lotus that sits in the
centre cell. The originals are 1024×1024; other sizes will be resized by the matrices but may
change the framing of the collage.

The processing relies on the images having a light background and a darker plant: the patch
inverts them (`jit.op @op absdiff @val 255`) and drives the result from each unit's growth
state. Images with a transparent or dark background will not read as luminous veins.

## Environmental audio — linked, not stored

Two WAV files are required by the `buffer~` objects:

| Buffer | File name | Played by |
|---|---|---|
| `Birds` | `Ambience_Forest_Birds_WindInTrees.wav` | `groove~ Birds @loop 1 @loopinterp 1` |
| `Wind` | `Wind_Vegetation_Forest_Leaves.wav` | `groove~ Wind @loop 1 @loopinterp 1` |

They are **not stored** in this repository. The originals come from the Soundly library
(Sound IDs `SND0432`, "Ambience, Forest, Birds, Wind In Trees 01", and `SND0247`, "Wind,
Vegetation, Forest, Leaves 01"). The main README's media table links both files from Google
Drive — download them into this folder to reproduce the original ambience. They are linked
rather than committed because the Soundly licence covers use inside a production, not
redistribution of the raw files. The report's third-party credits record the same two sources.

To replace them:

1. Put two audio files with the exact names above in this folder.
2. Stereo WAV or AIFF, 44.1 or 48 kHz, a minute or more of steady texture.
3. Keep them loopable: the buffers are looped, and the layers only fade in after a maturity
   threshold, so abrupt starts are audible.

The buffer names (`Birds`, `Wind`) are referenced elsewhere in the patch, so do not rename the
buffers — only the files on disk are replaceable.

## What the patch does when files are missing

Max will report the missing files at load and leave those buffers empty; the piece still opens,
the collage still runs, and the two environmental layers simply stay silent. Images are more
critical: without the nine PNGs the collage cells are empty.
