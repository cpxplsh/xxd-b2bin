xxd-b2bin
=========
`xxd -b` to binary.

## Description
Convert a text file generated by `xxd -b` into a binary file. By editing the text file, you can insert and delete bits.

## Usage
```
$ xxd-b2bin.sh in-xxd-b-file out-binary-file
```

## Example
```
$ hexdump file1.bin
0000000 64 75 6d 6d 79
0000005
$ xxd -b file1.bin file2-xxd-b.txt
$ cat file2-xxd-b.txt
00000000: 01100100 01110101 01101101 01101101 01111001           dummy
```
```
$ vi file2-xxd-b.txt
```
```
00000000: 011010100 01110101 01101101 01101101 01111001           dummy
              ^ (Insert '1')
```
```
00000000: 011010100 01110101 01101101    01101 01111001           dummy
                                      ^^^ (delete '011')
```
```
$ ./xxd-b2bin.sh file2-xxdb-b.txt file2.bin
$ hexdump file2.bin
0000000 6a 3a b6 b5 e4
0000005
$ xxd -b file2-xxdb-b.bin
00000000: 01101010 00111010 10110110 10110101 11100100           j:...
                                                    ^^ (zero padding)
```
## License
[MIT](https://github.com/cpxplsh/xxd-b2bin/LICENSE.txt)
