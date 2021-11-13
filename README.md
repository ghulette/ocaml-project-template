# OCaml Project Template

This is not trying to be all things to all people -- this template is
intentionally simple and restricted to what I use most. For better or worse,
you have a lot of choices with OCaml tooling -- opam, dune, etc. These are the
options I use most.

## How to use

First change these things:

1. Rename myproject.opam...
2. Rename the directory
3. `rm -rf .git`

Now run `opam install .`

## Run, test, debug cycle

1. Change the code
2. Run `dune test`
3. When you are happy, promote the tests and run `opam install .`

This template provides both a library and executable target. The idea is that
you write most of the logic in the library and then the executable just parses
command line arguments and calls the library functions for the heavy lifting.

## Install the executable

Can opam even do this? Maybe add a Makefile?
