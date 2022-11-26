( Armageddon FORTH, going to be bootstrapped by DFORTH  )

( Inner Interpreter )
: NEXT lodsw ax jmp/r ;

: primitive: word mkhdr ;

( New set of primitives defined by the Forth assembler )
primitive: swap
  ax pop
  bx pop
  ax push
  bx push
  NEXT

primitive: drop
  ax pop
  NEXT

primitive: dup
  ax pop
  ax push
  ax push
  NEXT

primitive: rot
  cx pop
  bx pop
  ax pop
  bx push
  cx push
  ax push
  NEXT

primitive: or
  ax pop
  bx pop
  bx ax or16/rr
  ax push
  NEXT

primitive: xor
  ax pop
  bx pop
  bx ax xor16/rr
  ax push
  NEXT

primitive: and
  ax pop
  bx pop
  bx ax and16/rr
  ax push
  NEXT

primitive: lshift
  cx pop
  ax pop
  ax shl16cl/r
  ax push
  NEXT

primitive: rshift
  cx pop
  ax pop
  ax shr16cl/r
  ax push
  NEXT   

primitive: neg
  ax pop
  ax neg16/r
  ax push
  NEXT

primitive: invert
  ax pop
  ax not16/r
  ax push
  NEXT

primitive: emit
  dx pop
  2  ah mov8/ir
  33 int
  NEXT

primitive: +
  ax pop
  bx pop
  bx ax add16/rr
  ax push
  NEXT

primitive: -
  bx pop
  ax pop
  bx ax sub16/rr
  ax push
  NEXT

primitive: /mod
  bx pop
  ax pop
  dx dx xor16/rr
  cwd
  bx idiv16/r
  dx push
  ax push
  NEXT

primitive: u/mod
  bx pop
  ax pop
  dx dx xor16/rr
  bx div16/r
  dx push
  ax push
  NEXT

primitive: *
  ax pop
  bx pop
  bx imul16/r 
  ax push
  NEXT

primitive: !
  di pop
  ax pop
  stosw
  NEXT

primitive: c!
  di pop
  ax pop
  stosb
  NEXT

primitive: @
  bx pop
  [bx] ax mov16/mr
  ax push
  NEXT

primitive: c@
  bx pop
  ax ax xor16/rr
  [bx] al mov8/mr
  ax push
  NEXT

primitive: ,
  772 bx mov16/ir     ( 0x304 = var_here )
  [bx] di mov16/mr    ( di = here )
  ax pop
  stosw
  di [bx] mov16/rm    ( update var_here )
  NEXT

primitive: c,
  772 bx mov16/ir     ( 0x304 = var_here )
  [bx] di mov16/mr    ( di = here )
  ax pop
  stosb
  di [bx] mov16/rm    ( update var_here )
  NEXT

primitive: depth
  512 ax mov16/ir     ( 0x200 = TOS )
  sp bx mov16/rr
  bx ax sub16/rr
  ax 1shr16/r
  ax push
  NEXT  

primitive: exec
  ax pop
  ax jmp/r

primitive: lit
  lodsw
  ax push
  NEXT

primitive: <
  ax ax xor16/rr
  bx pop
  dx pop  
  bx dx cmp16/rr
  3 jnl             ( @not_less )  
  -1 ax mov16/ir
( @not_less: )
  ax push
  NEXT

primitive: u<
  ax ax xor16/rr
  bx pop
  dx pop
  bx dx cmp16/rr
  3 jnb             ( @not_below )
  -1 ax mov16/ir
( @not_below: )
  ax push
  NEXT

primitive: branch
  [si] si add16/mr
  NEXT

primitive: branch0
  ax pop
  ax ax test16/rr
  4 jz             ( @dojump )
  lodsw            ( skip the address )
  NEXT
( @dojump )
  [si] si add16/mr
  NEXT

primitive: exit
  bp dec16/r
  bp dec16/r
  bp bx mov16/rr   ( TODO: [bp] si mov16/mr does not work )
  [bx] si mov16/mr
  NEXT

primitive: bye
  ax ax xor16/rr
  76 ah mov8/ir
  33 int

primitive: (bye)    
  ax pop
  76 ah mov8/ir
  33 int

: .c$ ( 0..15 -- c ) dup 10 u< if 48 + emit else 55 + emit then ;
: .$ ( n -- ) 16 u/mod dup 16 u< if .c$ else .$ then .c$ ;
: space 32 emit ;
: crlf 13 emit 10 emit ;

: dump ( n -- )
  dup 16 ( cols ) 8 ( row ) * + swap
  begin
    2dup - 16 % 0 = if crlf dup .$ space 124 emit space then
    dup c@ .$ space
    1 +
    2dup =
  until ;

: dump: ( -- ) word find if nip dump then ;


