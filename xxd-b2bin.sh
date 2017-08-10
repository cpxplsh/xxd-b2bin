#!/bin/sh
#
# 'xxd -b' to binary
#
# Usage example:
#   $ xxd -b file1.bin file2-xxd-b.txt
#   $ vi file2-xxd-b.txt
#   [ Edit bits (e.g., inserting and deleting bits). ]
#   $ ./xxd-b2bin.sh file2-xxd-b.txt file2.bin
#
set -u

# check arguments
if [ $# -ne 2 ]; then
  echo "Usage: xxd-b2bin.sh in-xxd-b-file out-binary-file"
  exit 1
fi
infile=$1
outfile=$2

# conversion
cat "${infile}" |
  perl -pe 's/^[0-9a-fA-F]+: //g' |
  perl -pe 's/  .{0,6}$//g'       |
  perl -pe 's/(\r\n|\r|\n| )//g'  |
  perl -pe 's/(.{1,8})/$1\n/g'    |
while read BITS
do
  # for speeding up ...
  case "${BITS}" in
    00000000)  printf "%b" "\x00"  ;;
    00000001)  printf "%b" "\x01"  ;;
    00000010)  printf "%b" "\x02"  ;;
    00000011)  printf "%b" "\x03"  ;;
    00000100)  printf "%b" "\x04"  ;;
    00000101)  printf "%b" "\x05"  ;;
    00000110)  printf "%b" "\x06"  ;;
    00000111)  printf "%b" "\x07"  ;;
    00001000)  printf "%b" "\x08"  ;;
    00001001)  printf "%b" "\x09"  ;;
    00001010)  printf "%b" "\x0A"  ;;
    00001011)  printf "%b" "\x0B"  ;;
    00001100)  printf "%b" "\x0C"  ;;
    00001101)  printf "%b" "\x0D"  ;;
    00001110)  printf "%b" "\x0E"  ;;
    00001111)  printf "%b" "\x0F"  ;;
    00010000)  printf "%b" "\x10"  ;;
    00010001)  printf "%b" "\x11"  ;;
    00010010)  printf "%b" "\x12"  ;;
    00010011)  printf "%b" "\x13"  ;;
    00010100)  printf "%b" "\x14"  ;;
    00010101)  printf "%b" "\x15"  ;;
    00010110)  printf "%b" "\x16"  ;;
    00010111)  printf "%b" "\x17"  ;;
    00011000)  printf "%b" "\x18"  ;;
    00011001)  printf "%b" "\x19"  ;;
    00011010)  printf "%b" "\x1A"  ;;
    00011011)  printf "%b" "\x1B"  ;;
    00011100)  printf "%b" "\x1C"  ;;
    00011101)  printf "%b" "\x1D"  ;;
    00011110)  printf "%b" "\x1E"  ;;
    00011111)  printf "%b" "\x1F"  ;;
    00100000)  printf "%b" "\x20"  ;;
    00100001)  printf "%b" "\x21"  ;;
    00100010)  printf "%b" "\x22"  ;;
    00100011)  printf "%b" "\x23"  ;;
    00100100)  printf "%b" "\x24"  ;;
    00100101)  printf "%b" "\x25"  ;;
    00100110)  printf "%b" "\x26"  ;;
    00100111)  printf "%b" "\x27"  ;;
    00101000)  printf "%b" "\x28"  ;;
    00101001)  printf "%b" "\x29"  ;;
    00101010)  printf "%b" "\x2A"  ;;
    00101011)  printf "%b" "\x2B"  ;;
    00101100)  printf "%b" "\x2C"  ;;
    00101101)  printf "%b" "\x2D"  ;;
    00101110)  printf "%b" "\x2E"  ;;
    00101111)  printf "%b" "\x2F"  ;;
    00110000)  printf "%b" "\x30"  ;;
    00110001)  printf "%b" "\x31"  ;;
    00110010)  printf "%b" "\x32"  ;;
    00110011)  printf "%b" "\x33"  ;;
    00110100)  printf "%b" "\x34"  ;;
    00110101)  printf "%b" "\x35"  ;;
    00110110)  printf "%b" "\x36"  ;;
    00110111)  printf "%b" "\x37"  ;;
    00111000)  printf "%b" "\x38"  ;;
    00111001)  printf "%b" "\x39"  ;;
    00111010)  printf "%b" "\x3A"  ;;
    00111011)  printf "%b" "\x3B"  ;;
    00111100)  printf "%b" "\x3C"  ;;
    00111101)  printf "%b" "\x3D"  ;;
    00111110)  printf "%b" "\x3E"  ;;
    00111111)  printf "%b" "\x3F"  ;;
    01000000)  printf "%b" "\x40"  ;;
    01000001)  printf "%b" "\x41"  ;;
    01000010)  printf "%b" "\x42"  ;;
    01000011)  printf "%b" "\x43"  ;;
    01000100)  printf "%b" "\x44"  ;;
    01000101)  printf "%b" "\x45"  ;;
    01000110)  printf "%b" "\x46"  ;;
    01000111)  printf "%b" "\x47"  ;;
    01001000)  printf "%b" "\x48"  ;;
    01001001)  printf "%b" "\x49"  ;;
    01001010)  printf "%b" "\x4A"  ;;
    01001011)  printf "%b" "\x4B"  ;;
    01001100)  printf "%b" "\x4C"  ;;
    01001101)  printf "%b" "\x4D"  ;;
    01001110)  printf "%b" "\x4E"  ;;
    01001111)  printf "%b" "\x4F"  ;;
    01010000)  printf "%b" "\x50"  ;;
    01010001)  printf "%b" "\x51"  ;;
    01010010)  printf "%b" "\x52"  ;;
    01010011)  printf "%b" "\x53"  ;;
    01010100)  printf "%b" "\x54"  ;;
    01010101)  printf "%b" "\x55"  ;;
    01010110)  printf "%b" "\x56"  ;;
    01010111)  printf "%b" "\x57"  ;;
    01011000)  printf "%b" "\x58"  ;;
    01011001)  printf "%b" "\x59"  ;;
    01011010)  printf "%b" "\x5A"  ;;
    01011011)  printf "%b" "\x5B"  ;;
    01011100)  printf "%b" "\x5C"  ;;
    01011101)  printf "%b" "\x5D"  ;;
    01011110)  printf "%b" "\x5E"  ;;
    01011111)  printf "%b" "\x5F"  ;;
    01100000)  printf "%b" "\x60"  ;;
    01100001)  printf "%b" "\x61"  ;;
    01100010)  printf "%b" "\x62"  ;;
    01100011)  printf "%b" "\x63"  ;;
    01100100)  printf "%b" "\x64"  ;;
    01100101)  printf "%b" "\x65"  ;;
    01100110)  printf "%b" "\x66"  ;;
    01100111)  printf "%b" "\x67"  ;;
    01101000)  printf "%b" "\x68"  ;;
    01101001)  printf "%b" "\x69"  ;;
    01101010)  printf "%b" "\x6A"  ;;
    01101011)  printf "%b" "\x6B"  ;;
    01101100)  printf "%b" "\x6C"  ;;
    01101101)  printf "%b" "\x6D"  ;;
    01101110)  printf "%b" "\x6E"  ;;
    01101111)  printf "%b" "\x6F"  ;;
    01110000)  printf "%b" "\x70"  ;;
    01110001)  printf "%b" "\x71"  ;;
    01110010)  printf "%b" "\x72"  ;;
    01110011)  printf "%b" "\x73"  ;;
    01110100)  printf "%b" "\x74"  ;;
    01110101)  printf "%b" "\x75"  ;;
    01110110)  printf "%b" "\x76"  ;;
    01110111)  printf "%b" "\x77"  ;;
    01111000)  printf "%b" "\x78"  ;;
    01111001)  printf "%b" "\x79"  ;;
    01111010)  printf "%b" "\x7A"  ;;
    01111011)  printf "%b" "\x7B"  ;;
    01111100)  printf "%b" "\x7C"  ;;
    01111101)  printf "%b" "\x7D"  ;;
    01111110)  printf "%b" "\x7E"  ;;
    01111111)  printf "%b" "\x7F"  ;;
    10000000)  printf "%b" "\x80"  ;;
    10000001)  printf "%b" "\x81"  ;;
    10000010)  printf "%b" "\x82"  ;;
    10000011)  printf "%b" "\x83"  ;;
    10000100)  printf "%b" "\x84"  ;;
    10000101)  printf "%b" "\x85"  ;;
    10000110)  printf "%b" "\x86"  ;;
    10000111)  printf "%b" "\x87"  ;;
    10001000)  printf "%b" "\x88"  ;;
    10001001)  printf "%b" "\x89"  ;;
    10001010)  printf "%b" "\x8A"  ;;
    10001011)  printf "%b" "\x8B"  ;;
    10001100)  printf "%b" "\x8C"  ;;
    10001101)  printf "%b" "\x8D"  ;;
    10001110)  printf "%b" "\x8E"  ;;
    10001111)  printf "%b" "\x8F"  ;;
    10010000)  printf "%b" "\x90"  ;;
    10010001)  printf "%b" "\x91"  ;;
    10010010)  printf "%b" "\x92"  ;;
    10010011)  printf "%b" "\x93"  ;;
    10010100)  printf "%b" "\x94"  ;;
    10010101)  printf "%b" "\x95"  ;;
    10010110)  printf "%b" "\x96"  ;;
    10010111)  printf "%b" "\x97"  ;;
    10011000)  printf "%b" "\x98"  ;;
    10011001)  printf "%b" "\x99"  ;;
    10011010)  printf "%b" "\x9A"  ;;
    10011011)  printf "%b" "\x9B"  ;;
    10011100)  printf "%b" "\x9C"  ;;
    10011101)  printf "%b" "\x9D"  ;;
    10011110)  printf "%b" "\x9E"  ;;
    10011111)  printf "%b" "\x9F"  ;;
    10100000)  printf "%b" "\xA0"  ;;
    10100001)  printf "%b" "\xA1"  ;;
    10100010)  printf "%b" "\xA2"  ;;
    10100011)  printf "%b" "\xA3"  ;;
    10100100)  printf "%b" "\xA4"  ;;
    10100101)  printf "%b" "\xA5"  ;;
    10100110)  printf "%b" "\xA6"  ;;
    10100111)  printf "%b" "\xA7"  ;;
    10101000)  printf "%b" "\xA8"  ;;
    10101001)  printf "%b" "\xA9"  ;;
    10101010)  printf "%b" "\xAA"  ;;
    10101011)  printf "%b" "\xAB"  ;;
    10101100)  printf "%b" "\xAC"  ;;
    10101101)  printf "%b" "\xAD"  ;;
    10101110)  printf "%b" "\xAE"  ;;
    10101111)  printf "%b" "\xAF"  ;;
    10110000)  printf "%b" "\xB0"  ;;
    10110001)  printf "%b" "\xB1"  ;;
    10110010)  printf "%b" "\xB2"  ;;
    10110011)  printf "%b" "\xB3"  ;;
    10110100)  printf "%b" "\xB4"  ;;
    10110101)  printf "%b" "\xB5"  ;;
    10110110)  printf "%b" "\xB6"  ;;
    10110111)  printf "%b" "\xB7"  ;;
    10111000)  printf "%b" "\xB8"  ;;
    10111001)  printf "%b" "\xB9"  ;;
    10111010)  printf "%b" "\xBA"  ;;
    10111011)  printf "%b" "\xBB"  ;;
    10111100)  printf "%b" "\xBC"  ;;
    10111101)  printf "%b" "\xBD"  ;;
    10111110)  printf "%b" "\xBE"  ;;
    10111111)  printf "%b" "\xBF"  ;;
    11000000)  printf "%b" "\xC0"  ;;
    11000001)  printf "%b" "\xC1"  ;;
    11000010)  printf "%b" "\xC2"  ;;
    11000011)  printf "%b" "\xC3"  ;;
    11000100)  printf "%b" "\xC4"  ;;
    11000101)  printf "%b" "\xC5"  ;;
    11000110)  printf "%b" "\xC6"  ;;
    11000111)  printf "%b" "\xC7"  ;;
    11001000)  printf "%b" "\xC8"  ;;
    11001001)  printf "%b" "\xC9"  ;;
    11001010)  printf "%b" "\xCA"  ;;
    11001011)  printf "%b" "\xCB"  ;;
    11001100)  printf "%b" "\xCC"  ;;
    11001101)  printf "%b" "\xCD"  ;;
    11001110)  printf "%b" "\xCE"  ;;
    11001111)  printf "%b" "\xCF"  ;;
    11010000)  printf "%b" "\xD0"  ;;
    11010001)  printf "%b" "\xD1"  ;;
    11010010)  printf "%b" "\xD2"  ;;
    11010011)  printf "%b" "\xD3"  ;;
    11010100)  printf "%b" "\xD4"  ;;
    11010101)  printf "%b" "\xD5"  ;;
    11010110)  printf "%b" "\xD6"  ;;
    11010111)  printf "%b" "\xD7"  ;;
    11011000)  printf "%b" "\xD8"  ;;
    11011001)  printf "%b" "\xD9"  ;;
    11011010)  printf "%b" "\xDA"  ;;
    11011011)  printf "%b" "\xDB"  ;;
    11011100)  printf "%b" "\xDC"  ;;
    11011101)  printf "%b" "\xDD"  ;;
    11011110)  printf "%b" "\xDE"  ;;
    11011111)  printf "%b" "\xDF"  ;;
    11100000)  printf "%b" "\xE0"  ;;
    11100001)  printf "%b" "\xE1"  ;;
    11100010)  printf "%b" "\xE2"  ;;
    11100011)  printf "%b" "\xE3"  ;;
    11100100)  printf "%b" "\xE4"  ;;
    11100101)  printf "%b" "\xE5"  ;;
    11100110)  printf "%b" "\xE6"  ;;
    11100111)  printf "%b" "\xE7"  ;;
    11101000)  printf "%b" "\xE8"  ;;
    11101001)  printf "%b" "\xE9"  ;;
    11101010)  printf "%b" "\xEA"  ;;
    11101011)  printf "%b" "\xEB"  ;;
    11101100)  printf "%b" "\xEC"  ;;
    11101101)  printf "%b" "\xED"  ;;
    11101110)  printf "%b" "\xEE"  ;;
    11101111)  printf "%b" "\xEF"  ;;
    11110000)  printf "%b" "\xF0"  ;;
    11110001)  printf "%b" "\xF1"  ;;
    11110010)  printf "%b" "\xF2"  ;;
    11110011)  printf "%b" "\xF3"  ;;
    11110100)  printf "%b" "\xF4"  ;;
    11110101)  printf "%b" "\xF5"  ;;
    11110110)  printf "%b" "\xF6"  ;;
    11110111)  printf "%b" "\xF7"  ;;
    11111000)  printf "%b" "\xF8"  ;;
    11111001)  printf "%b" "\xF9"  ;;
    11111010)  printf "%b" "\xFA"  ;;
    11111011)  printf "%b" "\xFB"  ;;
    11111100)  printf "%b" "\xFC"  ;;
    11111101)  printf "%b" "\xFD"  ;;
    11111110)  printf "%b" "\xFE"  ;;
    11111111)  printf "%b" "\xFF"  ;;
    *)
      # 0 or 1
      if [ `echo ${BITS} | grep -c -e [^01]` -eq 1 ]; then
        echo "Error: Invalid bit stream: ${BITS}" >&2
        exit 1
      fi
      # zero padding on the right
      BITS=`echo "${BITS}0000000" | cut -c -8`
      # bits to binary
      printf "%b" "\x`echo "obase=16;ibase=2;${BITS}" | bc`"
      ;;
  esac
done >${outfile}

# EOF
