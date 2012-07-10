# Palaver -- A 'dialog' API for Ruby

Palaver is a ruby library for making text user interfaces based on the program "dialog"
(http://invisible-island.net/dialog/). It aims at making all the features of the "dialog" program
available for Ruby programs.

The project was started because the RDialog (http://rdialog.rubyforge.org/) project with similar
aims seemed idle and missed some features that I needed. I also felt that RDialogs API was not a
very good match for some of the more complex dialogs supported by the "dialog" program.

In order to scratch these itches I have implemented, what I call the "blocks based API", in
Palaver. This API works by passing a Ruby block to a factory method, the function calls in this
block then defines the dialog to be created. I believe this kind of API is well suited for things
like the "menu" and "form" dialogs from the "dialog" program. For the simpler dialogs a more
conventional API where the factory methods are given hashes containing parameter to value mappings
is implemented. The examples in the "examples" directory show how both kind of APIs can be used.
