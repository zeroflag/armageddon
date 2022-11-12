: ok 79 emit 75 emit ;
: assert ( bool -- ) if ok else 70 emit quit then ;

: =assert ( n1 n2 -- )
  2dup <> if
    swap . 60 emit 62 emit .
    quit
  else
    drop drop ok
  then ;

depth 0 =assert

 0 invert         assert
-1 invert invert  assert
-1 invert   0    =assert
 0 invert  -1    =assert

depth 0 =assert

1 0 or   1 =assert 
0 1 or   1 =assert
1 1 or   1 =assert 
0 0 or   0 =assert
1 0 and  0 =assert 
0 1 and  0 =assert
1 1 and  1 =assert 
0 0 and  0 =assert
1 0 xor  1 =assert 
0 1 xor  1 =assert
1 1 xor  0 =assert
0 0 xor  0 =assert

depth 0 =assert

1 2 3 depth 3 =assert
swap depth  3 =assert
drop depth  2 =assert
dup depth   3 =assert
rot depth   3 =assert
-rot depth  3 =assert
nip depth   2 =assert
drop depth  1 =assert
drop depth  0 =assert

depth 0 =assert

4 dup +     8 =assert
3 dup *     9 =assert
10 dup -    0 =assert
5 dup /     1 =assert
6 dup %     0 =assert

depth 0 =assert

6 4 +      10 =assert
-5 -9 +   -14 =assert
5 4 -       1 =assert
10 15 -    -5 =assert
-5 -4 -    -1 =assert
-5 4  -    -9 =assert
5 3 *      15 =assert
6 -4 *    -24 =assert
-6 -3 *    18 =assert
12 3 /      4 =assert
13 3 /      4 =assert
8 -2 /     -4 =assert
13 3 %      1 =assert

depth 0 =assert

1 2 <>         assert
-9 9 <>        assert
5 5 =          assert
-5 -5 =        assert
1 4 <          assert
-3 0 <         assert
5 4 >          assert
-3 -4 >        assert
4 4 >=         assert
4 4 <=         assert
5 4 >=         assert
5 6 <=         assert

depth 0 =assert

variable v
42 v !

v @       42 =assert
5 v ! v @  5 =assert

314 constant c
depth 0 =assert
314 c =assert

depth 0 =assert

3 4 min    3 =assert
3 4 max    4 =assert
4 3 min    3 =assert
4 3 max    4 =assert
-4 -1 min -4 =assert
-4 -1 max -1 =assert

depth 0 =assert

here 123 allot here swap - 123 =assert

depth 0 =assert

: fact ( n -- n! )
    1 2 rot
    begin
        2dup <=
    while
        -rot tuck
        * swap
        1 + rot
    repeat
    drop drop ;

5 fact 120 =assert

depth 0 =assert

: test-until ( -- 2048 ) 2 10 begin 1 - swap 2 * swap dup 0 = until drop ;

test-until 2048  =assert

depth 0 =assert