# Armageddon

### Creating a programming language out of nothing; the Zombie Apocalypse Driven Development.

#### A programming language defined entirely in `DEBUG.COM`.

Imagine the earth is being destroyed by some virus-infected zombies. Technology is mostly wiped out. You desperately need to find a computer to develop the cure against the virus. You find shelter in an abandoned museum. The only computer available is 16 bit IBM AT 80286 with DOS installed on it. There is no programming language interpreter, there is no compiler available on that machine. You find a program called `DEBUG.COM` which is about 10k in size. The whole binary fits into 2-3 QR codes. 

<img src="imgs/debug.png" align="center">

You have no choice but to build a programming language in the debugger by laying out bits directly into the memory and dumping the result into the disk.

<img src="imgs/armageddon1.png" align="center">

You start defining a FORTH. You write the [primitieves](DFORTH.ASM#L107) and the inner interpreter in assembly, you lay out dictionary structure in the memory. Then you compile the [text interpreter](DFORTH.ASM#L58) and the [defining words](DFORTH.ASM#L395) on paper then you enter each byte one by one. Then you can write the [control flow structures](CORE.FTH) in FORTH. 

You name this version DFORTH (Debug Forth) which is going to host a `meta-compiler`. The next step is to create a new, more powerful version of the language out of original one. The new version is written entirely in DFORTH. The new set of [primitives](ARMAGDN.FTH) are defined in [DFORTH assembler](ASM.FTH).


## Usage

 * Install DOSBox 0.74-3
 * `git clone git@github.com:zeroflag/armageddon.git`
 * `cd armageddon`
 * Start DosBox and run: `mount c /path/to/armageddon`
 * `C:`
 * `make.bat`
 * `forth.com`
 
 The `make.bat` script builds the project (by redirecting `dforth.asm` to the stdin of `debug.com`), runs `dforth.com` and loads `core.forth`. You can start `dforth.com` afterwards, but by default the `core.forth` file is not loaded.
 You can do that manually by running `dforth.com < core.forth`. Unfortunately there must be a `bye` at the end of `core.forth`, so you can't play with it interactivly because the process will exit (without the `bye` the process would hang because of how stdin redirect works in DOS). But you can start `dforth.com` alone and type in commands interactivly (this is what I did on the 2nd screenshot).
 
 This thing is in early phase and very incomplete, and possibly buggy. There is no meta-compiler yet.
 
 ## Known issues
 
  * The end of line of the source file should be either CRLF or CR, but not LF.
  * There must be a new line at the end of the file.
