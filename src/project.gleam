pub type Project {
  Project(
    source_folder: String,
    includes: String,
    build: String,
    tests: String,
    dependencies: String,
    docs: String,
    utils: String,
    scripts: String,
  )
}

pub fn new() -> Project {
  Project(
    source_folder: "src/",
    includes: "include/",
    build: "build/",
    tests: "tests/",
    dependencies: "deps/",
    docs: "docs/",
    utils: "utils/",
    scripts: "scripts/",
  )
}

pub fn source_folder(project: Project, src: String) -> Project {
  Project(..project, source_folder: src)
}

pub fn include_folder(project: Project, inc: String) -> Project {
  Project(..project, includes: inc)
}

pub fn build_folder(project: Project, bld: String) -> Project {
  Project(..project, build: bld)
}

pub fn tests_folder(project: Project, tst: String) -> Project {
  Project(..project, tests: tst)
}

pub fn deps_folder(project: Project, dep: String) -> Project {
  Project(..project, dependencies: dep)
}

pub fn docs_folder(project: Project, doc: String) -> Project {
  Project(..project, docs: doc)
}

pub fn utils_folder(project: Project, util: String) -> Project {
  Project(..project, utils: util)
}

pub fn scripts_folder(project: Project, script: String) -> Project {
  Project(..project, scripts: script)
}
