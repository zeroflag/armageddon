# Armageddon

### Creating a programming language out of nothing i.e. The Zombie Apocalypse Driven Development.

A programming language defined entirely in DEBUG.COM.

Imagine the earth is being destroyed by some virus-infected zombies. Technology is mostly destroyed. You desperately need to find a computer to develop the cure against the virus. You found sheltered in an abandoned museum. The only computer available is 16bit IBM AT 80286 with DOS installed on it. There is no programming language interpreter, there is no compiler available on that machine. You found a program called DEBUG.COM which is about 10k in size. The whole binary fits into 2-3 QR codes. 

<img src="imgs/debug.png" align="center">

You have no choice but to build a programming language in the debugger by laying out bits directly into the memory and dumping the result into the disk.

<img src="imgs/armageddon1.png" align="center">

You start defining a FORTH. You write the primitives and the inner interpreter in assembly, you lay out dictionary structure in the memory, and you compile the text interpreter and the defining words in your head and enter each byte one bye one. Then you can write the flow control structures in FORTH. 

The next step is to write a meta-compiler and create a new, more powerful FORTH out of the original version.
