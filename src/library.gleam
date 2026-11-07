/// Unique ID to define a library
pub type LibraryIdentifier =
  String

/// ### LibraryLinkage
/// _Associate an ID with the Library Record, with its access qualifier_
/// 
/// - Used for linking into library 
/// - Given this lib 'Example' and we link in MyLib 
///   - E.g.: `#("MyLib", MyLib(...), ProtectedVisibility)`
pub type LibraryLinkage =
  #(LibraryIdentifier, Library, LibraryConsumption)

/// ### define_link
/// _Generate a new LibraryLinkage tuple_
/// 
/// @param[in] id The String Identifier (must be unique) **LibraryIdentifier**
pub fn define_link(
  id: LibraryIdentifier,
  lib: Library,
  lcon: LibraryConsumption,
) -> LibraryLinkage {
  #(id, lib, lcon)
}

/// Defines how a library will be built as part of a project
pub type LibraryType {
  /// Statically Linked as part of Executable 
  StaticLinkage

  /// Dynamicaly Linked to load at runtime
  DynamicLinkage

  /// Linkage unavailable, can be opened and used at runtime
  Module
}

/// Access modifiers for other libraries to use this library
pub type LibraryConsumption {
  /// All others can use this one
  PublicVisibility

  /// Only others specifically granted access
  ProtectedVisibility

  /// No others may use this library (interal only)
  PrivateVisibility
}

/// A library such as a .dll, .so
/// 
/// - `source_files` can be either a rel/abs/glob path 
/// 
/// - `include_files` can be either a rel/abs/glob path 
/// 
/// - `lib_type` is Static, Dynamic, Module
pub type Library {
  Library(
    identifier: LibraryIdentifier,
    source_files: List(String),
    include_files: List(String),
    lib_type: LibraryType,
    access: LibraryConsumption,
    links: List(LibraryLinkage),
  )
}

pub fn link_with(
  lib: Library,
  id: LibraryIdentifier,
  access: LibraryConsumption,
) -> Library {
  Library(..lib, links: [define_link(id, lib, access), ..lib.links])
}
