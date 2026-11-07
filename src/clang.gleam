pub type Target {
  /// ARM 64-bit
  Aarch64
  /// ARM 32-bit
  Arm
  /// WebAssembly
  Wasm
  /// x86-64
  X64
  /// RISC-V 64-bit
  RiscV64
}

pub type OptimizationLevel {
  /// -Og
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
  /// -w, no warnings
  WarningsNone
  /// -Wall, many warnings
  WarningsAll
  /// -Wpedantic, strict ISO conformance
  WarningsPedantic
  /// -Wextra
  WarningsExtra
  /// -Weverything
  WarningsEverything
}

pub type DebuggerTuning {
  /// -ggdb: tune DWARF output for GDB
  Gdb
  /// -glldb: tune DWARF output for LLDB
  Lldb
  /// -gcodeview: tune DWARD output for Microsoft
  Codeview
}

pub type DebuggerOptions {
  /// Line info only, smaller
  LineInfoOnly
  /// Dwarf Version 4
  Dwarf4
  /// Dwarf Version 5
  Dwarf5
  // -fno-omit-frame-pointer
  KeepFramePointer
}

pub type Options {
  /// -fsanitize=<list>
  Sanitize(sanitizers: List(Sanitizer))
  /// -std=<standard>
  Standard(standard: LanguageStandard)
}

pub type Sanitizer {
  /// address (ASan)
  AddressSanitizer
  /// undefined (UBSan)
  UndefinedBehaviorSanitizer
  /// thread (TSan); can't combine with ASan or MSan
  ThreadSanitizer
  /// memory (MSan); can't combine with ASan or TSan, Linux only
  MemorySanitizer
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
  /// -std=c23
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
  /// -std=c++2c
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
  /// -S -emit-llvm (.ll text IR)
  EmitLlvmIr
  /// -c -emit-llvm (.bc bitcode)
  EmitLlvmBitcode
}

pub type Flag {
  Target
  OptimizationLevel
  WarningLevel
  DebuggerTuning
  DebuggerOptions
  Options
}

pub fn flag(flag f: Flag) -> String {
  case f {
    Target -> ""
    OptimizationLevel -> ""
    WarningLevel -> ""
    DebuggerTuning -> ""
    DebuggerOptions -> ""
    Options -> ""
  }
}
