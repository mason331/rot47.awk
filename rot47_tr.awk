awk '
# The idea of using tr came from Janis Papanagnou on this thread: 
# https://groups.google.com/forum/?hl=en&fromgroups#!topic/comp.unix.shell/9SqiPkPxIMA
function rot47(arg)
{
  cmd = "tr '\!-~' 'P-~\!-O'"
  print arg |& cmd ; close (cmd, "to")
  cmd |& getline res ; close (cmd, "from")
  return res
}
BEGIN { RS="\n" ; FS=OFS="|" }
{
 print rot47($0)
}
'
