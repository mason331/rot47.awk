awk '
# Created by mason331, 2020-05-15
BEGIN {
 _ord_init()
}
{
 print rot47($0)
}
# _ord_init, chr() and ord() copied from here
# https://www.gnu.org/software/gawk/manual/html_node/Ordinal-Functions.html
function _ord_init(low, high, i, t)
{
 low = sprintf("%c", 7) # BEL is ascii 7
 if (low == "\a") { # regular ascii
  low = 0
  high = 127
 } else if (sprintf("%c", 128 + 7) == "\a") {
  # ascii, mark parity
  low = 128
  high = 255
 } else { # ebcdic(!)
  low = 0
  high = 255
 }
 for (i = low; i <= high; i++) {
  t = sprintf("%c", i)
  _ord_[t] = i
 }
}
function chr(c)
{
 # force c to be numeric by adding 0
 return sprintf("%c", c + 0)
}
function ord(str, c)
{
 # only first character is of interest
 c = substr(str, 1, 1)
 return _ord_[c]
}
# rot.pas copied from here: https://rot47.net/
# Translated into awk custom function rot47() by mason331
function rot47(str)
{
 result = ""
 for (q = 1; q <= length(str); q++) {
  c = substr(str, q, 1)
  j = ord(c)
  if ((j >= 33) && (j <= 126)) {
   r = chr(33 + ((j + 14) % 94))
   result = result r
  } else {
   result = result c
  }
 }
 return result
}
'
