del out
del src
del forth.com
debug.com < forth.asm > out
echo "out generated"
copy forth.asm src
echo w 100 >> src
debug.com < src
echo "bin generated"
forth.com < core.fth