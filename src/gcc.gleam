/// GCC has no --target flag. Cross-compiling means running a different
/// toolchain binary, so this picks the executable, not a flag.
pub type Target {
  /// aarch64-linux-gnu-gcc
  Aarch64
  /// arm-linux-gnueabihf-gcc
  Arm
  /// x86_64-linux-gnu-gcc
  X64
  /// riscv64-linux-gnu-gcc
  RiscV64
}

pub type OptimizationLevel {
  /// -Og: optimizations that don't interfere with debugging
  OptimizeDebug
  /// -O0
  OptimizeNone
  /// -O1
  OptimizeSome
  /// -O2
  OptimizeFast
  /// -O3
  OptimizeUltra
}

pub type WarningLevel {
  /// -w: suppress all warnings
  WarningsNone
  /// -Wall: the common set, not every warning
  WarningsAll
  /// -Wextra
  WarningsExtra
  /// -Wpedantic: strict ISO conformance
  WarningsPedantic
}

pub type DebuggerOptions {
  /// -g1: line tables and backtrace info, no locals
  LineInfoOnly
  /// -gdwarf-4
  Dwarf4
  /// -gdwarf-5
  Dwarf5
  /// -ggdb: debug info with GDB-specific extensions
  GdbExtensions
  /// -fno-omit-frame-pointer
  KeepFramePointer
}

pub type Sanitizer {
  /// address (ASan)
  AddressSanitizer
  /// undefined (UBSan)
  UndefinedBehaviorSanitizer
  /// thread (TSan); can't combine with ASan
  ThreadSanitizer
  /// leak (LSan); already included in ASan on Linux
  LeakSanitizer
}

pub type LanguageStandard {
  /// -std=c99
  C99
  /// -std=c11
  C11
  /// -std=c17
  C17
  /// -std=c23 (GCC 14+, older versions use -std=c2x)
  C23
  /// -std=c++11
  Cpp11
  /// -std=c++14
  Cpp14
  /// -std=c++17
  Cpp17
  /// -std=c++20
  Cpp20
  /// -std=c++23
  Cpp23
  /// -std=c++26 (GCC 14+, experimental)
  Cpp26
}

pub type OutputStage {
  /// no flag: compile and link
  Link
  /// -c
  CompileOnly
  /// -S
  EmitAssembly
  /// -E
  PreprocessOnly
}

pub type Flag {
  Optimization(level: OptimizationLevel)
  Warnings(level: WarningLevel)
  Debug(option: DebuggerOptions)
  Sanitize(sanitizers: List(Sanitizer))
  Standard(standard: LanguageStandard)
  Stage(stage: OutputStage)
}
