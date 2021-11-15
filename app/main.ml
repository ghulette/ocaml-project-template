open Printf

let run _argv_offset = Proj.A.do_something ()
let walk _argv_offset = print_endline "Nice."
let subcommands = [("run", run); ("walk", walk)]

let help () =
  let subcommand_names =
    String.concat "\n" (List.map (fun (name, _f) -> "  " ^ name) subcommands)
  in
  let usage_msg =
    sprintf
      "Usage: %s SUBCOMMAND [ARGS]\n\
       where SUBCOMMAND is one of:\n\
       %s\n\n\
       For help on a specific subcommand, try:\n\
       %s SUBCOMMAND --help\n"
      Sys.argv.(0) subcommand_names Sys.argv.(0) in
  eprintf "%s%!" usage_msg

let version () =
  (* Use https://dune.readthedocs.io/en/stable/dune-libs.html#build-info *)
  printf "proj version %%VERSION%%\n%!"

let dispatch_subcommand () =
  assert (Array.length Sys.argv > 1) ;
  match Sys.argv.(1) with
  | "help" | "-h" | "-help" | "--help" -> help ()
  | "--version" | "-v" -> version ()
  | subcmd ->
      let argv_offset = 1 in
      let action =
        try List.assoc subcmd subcommands
        with Not_found ->
          eprintf "Invalid subcommand: %s\n" subcmd ;
          help () ;
          exit 1 in
      action argv_offset

let () =
  let len = Array.length Sys.argv in
  if len <= 1 then (help () ; exit 1) else dispatch_subcommand ()
