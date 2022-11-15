del out
del src
del make.log
del dforth.com
debug.com < dforth.asm > out
echo "out generated"
copy dforth.asm src
echo w 100 >> src
debug.com < src
del src
echo "bin generated"
type core.fth > in.fth
type asm.fth >> in.fth
type armagdn.fth >> in.fth
type test.fth >> in.fth
echo bye >> in.fth
dforth.com < in.fth > make.log
del in.fth
type make.log
