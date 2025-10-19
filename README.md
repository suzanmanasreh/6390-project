# Building and running

First, install `elan`, which is Lean's version mananger following the instructions provided [here](https://lean-lang.org/install/manual/). `lake` -- Lean's package manager, will be installed with it.

Then to build, simply type

```sh
lake build
```

and to run `Main.lean`, type

```sh
lake exe refinement_borrows
```
