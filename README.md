# emscripten-wasm

This repository contains tools to compile C/C++ to WebAssembly s-expressions, using [Emscripten](http://emscripten.org/), by translating Emscripten's asm.js output into WebAssembly.

This repository contains an asm.js-to-WebAssembly compiler, **asm2wasm**, built on Emscripten's asm optimizer infrastructure. That can directly compile asm.js to WebAssembly. You can use Emscripten to build C++ into asm.js, and together the two tools let you compile C/C++ to WebAssembly.

## Building asm2wasm

```
$ build.sh
```

## Running

Just run

```
bin/asm2wasm [input.asm.js file]
```

This will print out a WebAssembly module in s-expression format to the console.

For example, try

```
$ bin/asm2wasm test/hello_world.asm.js
```

On Linux and Mac you should see pretty colors. Set `COLORS=0` in the env to disable colors if you prefer that. Set `COLORS=1` in the env to force colors (useful when piping to `more`, for example).

Set `ASM2WASM_DEBUG=1` in the env to see debug info, about asm.js nodes as they are parsed, etc.

## Starting from C/C++ Source

[Grab Emscripten](http://kripken.github.io/emscripten-site/docs/getting_started/downloads.html), and build

Limitations:

 * WebAssembly lacks global variables, so `asm2wasm` maps them onto addresses in memory. This requires that you have some reserved space for those variables. You can do that with `emcc -s GLOBAL_BASE=1000`. We still need to write the code to copy the globals there.
 * Emscripten emits asm.js and JavaScript, that work together using web APIs to do things like print, render, etc. Not sure if there is a way to test that full output yet.

## Testing

```
./check.py
```

(or `python check.py`) will run `asm2wasm` on the testcases in `test/`, and verify their outputs.

## License & Contributing

Same as Emscripten: MIT license. This code is sync'ed with Emscripten's repo.
