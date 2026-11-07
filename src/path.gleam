import filepath
import gleam/io
import gleam/list
import gleam/result
import gleam/string

pub type SystemPath {
  SystemPath(entry: String)
}

pub type PathError {
  EscapesRoot(requested: String)
  InvalidPath
}

pub fn locate(path: String) -> Result(SystemPath, PathError) {
  case filepath.expand(path) {
    Ok(relative) -> Ok(SystemPath(entry: relative))
    Error(Nil) -> {
      io.println_error("Path could not found, resolve left root folder.")
      Error(EscapesRoot(path))
    }
  }
}

pub fn create(segments: List(String)) -> Result(SystemPath, PathError) {
  let parts =
    list.map(segments, fn(s) { result.unwrap(locate(s), SystemPath(".")) })

  let res =
    list.fold(parts, "", fn(str, syspath) { filepath.join(str, syspath.entry) })

  case string.length(res) > 0 {
    True -> Ok(SystemPath(res))
    False -> Error(InvalidPath)
  }
}
