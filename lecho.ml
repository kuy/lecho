open Core.Std
open Async.Std

let print text =
  print_endline text;
  return ()

let run () =
  print_string "Welcome to local echo. Input something and hit enter key.\n> ";
  Reader.read_line (Reader.create (Fd.stdin ()))
  >>= function
    | `Ok t -> print t
    | `Eof -> print "[EOF]"

let _ =
  Command.async ~summary:"local echo"
    Command.Spec.empty run
  |> Command.run
