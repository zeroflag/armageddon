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
7 constant [n]

: stosb ( -- ) 170 c, ;
: stosw ( -- ) 171 c, ;
: lodsb ( -- ) 172 c, ;
: lodsw ( -- ) 173 c, ;
: cwd   ( -- ) 153 c, ;

: int ( n -- ) 205 c, c, ;

: mov16/ir ( n reg -- ) 184 + c, , ;
: mov8/ir  ( n reg -- ) 176 + c, c, ;

: inc8/r ( TODO ) ;
: inc16/r 64 + c, ;
: dec16/r 72 + c, ;

: push 80 + c, ;
: pop  88 + c, ;

: rm-r ( reg/m reg -- ) 3 lshift + 192 + c, ;

: mov16/rr  139  c, rm-r ;
: add16/rr  3    c, rm-r ;
: or16/rr   11   c, rm-r ;
: and16/rr  35   c, rm-r ;
: sub16/rr  43   c, rm-r ;
: xor16/rr  51   c, rm-r ;
: xor8/rr   50   c, rm-r ;
: cmp16/rr  59   c, rm-r ;
: cmp8/rr   58   c, rm-r ;
: test16/rr 133  c, rm-r ;

: inc16/m ( TODO ) ;

: m-r ( mem reg -- ) 3 lshift + c, ;
: r-m ( reg mem -- ) swap m-r ;

: add16/mr 3   c, m-r ;
: mov16/mr 139 c, m-r ;
: mov8/mr  138 c, m-r ;
: mov16/rm 137 c, r-m ;
: mov8/rm  136 c, r-m ;

: jmp/r     255 c, 4 rm-r ;
: not16/r   247 c, 2 rm-r ;
: neg16/r   247 c, 3 rm-r ;
: idiv16/r  247 c, 7 rm-r ;
: div16/r   247 c, 6 rm-r ;
: imul16/r  247 c, 5 rm-r ;
: shl16cl/r 211 c, 4 rm-r ;
: shr16cl/r 211 c, 5 rm-r ;
: 1shr16/r  209 c, 5 rm-r ;

: jz  116 c, c, ;
: jnl 125 c, c, ;
: jnb 115 c, c, ;
