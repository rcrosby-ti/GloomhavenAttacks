# GloomhavenAttacks

Gloomhaven Attacks! is an unofficial app developed with Godot
to implement attack modifier decks for the Gloomhaven boardgame
and its successors.

In its current form, it uses a customized version of Godot 3.5.2.
The only difference from the release version of Godot 3.5.2 is
that RichTextLabel has been modded to allow alignment options for
images.  This mod is indicated in the source code with the
comments "TINY_INSIGHT_FIX begin" and "TINY_INSIGHT_FIX end".
This customized version of Godot is not necessary to build and
run the app.  Running the app with the release version of Godot
will only result in the images in the perks list not lining up
properly with the text.

## Installation

Create a Gogot project using the files in the GHAttacks
directory.

To create the customized version of Godot 3.5.2, follow the
directions in the Godot docs to build Godot and then
substitute in the modified rich_text_label.cpp in
godot-3.5.2-stable/scene/gui.
