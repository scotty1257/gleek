import clang
import gleam/io
import gleam/list
import gleam/string

pub type Compiler {
  Gcc
  Clang
  Msvc
}

pub type Argument =
  String

pub type CallFormat =
  String

pub fn compiler(command: CompileCommand) -> CallFormat {
  case command.compiler {
    Gcc -> "gcc "
    Clang -> "clang "
    Msvc -> "cl "
  }
}

pub type CommandList =
  List(Argument)

pub type CompileCommand {
  CompileCommand(compiler: Compiler, arguments: CommandList)
}

pub fn arg(command: CompileCommand, v: Argument) -> CompileCommand {
  CompileCommand(..command, arguments: [v, ..command.arguments])
}

pub fn to_format(command: CompileCommand) -> CallFormat {
  compiler(command) <> list.reverse(command.arguments) |> string.join(" ")
}

pub fn command(compiler: Compiler) -> CompileCommand {
  CompileCommand(compiler:, arguments: [])
}

pub fn example() {
  io.println("Goodbye")
  let cmd =
    command(Gcc)
    |> arg("--std=c++20")
    |> arg("-c")
    |> arg("-o")
    |> arg("-O2")
    |> arg("main.c")

  echo to_format(cmd)
}
