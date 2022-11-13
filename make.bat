del out
del src
del make.log
del forth.com
debug.com < forth.asm > out
echo "out generated"
copy forth.asm src
echo w 100 >> src
debug.com < src
del src
echo "bin generated"
type core.fth > in.fth
type test.fth >> in.fth
echo bye >> in.fth
forth.com < in.fth > make.log
del in.fth
type make.log