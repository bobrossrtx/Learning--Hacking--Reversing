import codecs
import struct

_bin = bin(123) # dec -> bin
_hex = hex(123) # dec -> hex
print(f"{_bin} | {_hex} | {int(str(_bin), 2)} - {hex(int(_bin, 2))}")

# encoding
print(
  "hex -", codecs.encode(b"\x41\xffABCD", "hex"),
  "|", "ASCII - \x41\xffABCD",
  "|", "utf8 -", "\x41\xffABCD".encode('utf8')
)

print(
  "unpacked - |",
  struct.unpack("I", b"ABCD")[0], 
  "|", hex(struct.unpack("I", b"ABCD")[0]), 
  "|", ">" + hex(struct.unpack(">I", b"ABCD")[0])
)

print(
  "packed - |",
  struct.pack("I", 0x41500000)
)

_bin = bin(85)
print(
  "flipped - 01010101 -> 10101010 (85) |\r\n",
  f"01010101 Unflipped  = 0b01010101, {hex(int(_bin, 2))} - {int(_bin, 2)}\r\n",
  f"01010101 Flipped    = {bin(int(_bin, 2))}, {hex(0 - int(_bin, 2))} - {0 - int(_bin, 2)}"
)
