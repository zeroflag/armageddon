( registers )
0 constant ax
1 constant cx
2 constant dx
3 constant bx
4 constant sp
5 constant bp
6 constant si
7 constant di
0 constant al
1 constant cl
2 constant dl
3 constant bl
4 constant ah
5 constant ch
6 constant dh
7 constant bh

( addressing )
0 constant [bx+si]
1 constant [bx+di]
2 constant [bp+si]
3 constant [bp+di]
4 constant [si]
5 constant [di]
6 constant [bp]
7 constant [bx]
7 constant [abs]

: stosb ( -- ) 170 c, ;
: stosw ( -- ) 171 c, ;
: lodsb ( -- ) 172 c, ;
: lodsw ( -- ) 173 c, ;
: cwd   ( -- ) 153 c, ;

: int ( n -- ) 205 c, c, ;

: mov16/ir ( n reg -- ) 184 + c, , ;
: mov8/ir  ( n reg -- ) 176 + c, c, ;

: inc16 64 + c, ;
: dec16 72 + c, ;

: push 80 + c, ;
: pop  88 + c, ;

: rm-r ( reg/m reg -- ) 3 lshift + 192 + c, ;

: mov16/rr 139 c, rm-r ;
: add16/rr 3   c, rm-r ;
: or16/rr  11  c, rm-r ;
: and16/rr 35  c, rm-r ;
: sub16/rr 43  c, rm-r ;
: xor16/rr 51  c, rm-r ;
: cmp16/rr 59  c, rm-r ;

: m-r ( mem reg -- ) 3 lshift + c, ;
: r-m ( reg mem -- ) swap m-r ;

: mov16/mr 139 c, m-r ;
: mov8/mr  138 c, m-r ;
: mov16/rm 137 c, r-m ;

: jmp/r    255 c, 4 rm-r ;
: not16/r  247 c, 2 rm-r ;
: idiv16/r 247 c, 7 rm-r ;
: imul16/r 247 c, 5 rm-r ;

: NEXT lodsw ax jmp/r ;

: primitive: word mkhdr ;

primitive: swap
  ax pop
  bx pop
  ax push
  bx push
  NEXT ;

primitive: drop
  ax pop
  NEXT ;

primitive: dup
  ax pop
  ax push
  ax push
  NEXT ;

primitive: rot
  cx pop
  bx pop
  ax pop
  bx push
  cx push
  ax push
  NEXT ;

primitive: or
  ax pop
  bx pop
  bx ax or16/rr
  ax push
  NEXT ;

primitive: xor
  ax pop
  bx pop
  bx ax xor16/rr
  ax push
  NEXT ;

primitive: and
  ax pop
  bx pop
  bx ax and16/rr
  ax push
  NEXT ;

primitive: emit
  dx pop
  2  ah mov8/ir
  33 int
  NEXT ;

primitive: +
  ax pop
  bx pop
  bx ax add16/rr
  ax push
  NEXT ;

primitive: -
  bx pop
  ax pop
  bx ax sub16/rr
  ax push
  NEXT ;

primitive: /mod
  bx pop
  ax pop
  dx dx xor16/rr
  cwd
  bx idiv16/r
  dx push
  ax push
  NEXT ;

primitive: *
  ax pop
  bx pop
  bx imul16/r 
  ax push
  NEXT ;

primitive: !
  di pop
  ax pop
  stosw
  NEXT ;

primitive: c!
  di pop
  ax pop
  stosb
  NEXT ;

primitive: @
  bx pop
  [bx] ax mov16/mr
  ax push
  NEXT ;

primitive: c@
  bx pop
  ax ax xor16/rr
  [bx] al mov8/mr
  ax push
  NEXT ;

primitive: exec
  ax pop
  ax jmp/r ;

primitive: lit
  lodsw
  ax push
  NEXT ;
  
primitive: bye    
  ax ax xor16/rr
  76 ah mov8/ir
  33 int ;

primitive: (bye)    
  ax pop
  76 ah mov8/ir
  33 int ;
