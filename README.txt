install:
copy files to folder
in VS Code, run as fastapi service

sample usage:
curl "http://localhost:8000/w/5/1=D---S&A=3&R=2,4&0=EM"

where args:
1 is a positional list of letters found in the word
0 are letters not found in the word
A-Z = letters in word, but at unknown position, like A=1,2,4 means an A is in position 1,2 or 4