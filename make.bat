del out
del src
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
echo quit >> in.fth
forth.com < in.fth
del in.fth