from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from sqldatabase import MSSqlData
from pydantic import BaseModel
from stringbuilder import StringBuilder


app = FastAPI()
BASE_URL: str = "http://locahost:8000"
database = MSSqlData()

def parse_found_at_pos(parm: str):
    i:int = 0
    p:dict = {}
    for c in parm:
        i = i + 1
        if c == '-':
            continue
        p[i] = c
    return p


def parse_not_found(parm: str):
    n:[] = []
    for c in parm:
        n.append(c)
    return n

def strToIntArray(s: str):
    arr = []
    sStr = s.split(',')
    for item in sStr:
        arr.append(int(item))
    return arr

"""

curl "http://localhost:8000/w/5/1=D---S&A=3&R=2,4&0=EM"

"""
@app.get("/w/{word_len}/{query_string}")
async def url_resolve(word_len: str, query_string: str):
    sb = StringBuilder()

    # add query string parms into dict
    aParm = query_string.split('&')
    parms = {}
    for parm in aParm:
        kv = parm.split('=')
        parms[kv[0]] = kv[1]

    # letter found at a position
    p:dict = {}
    if '1' in parms:
        p = parse_found_at_pos(parms['1'])
    
    #letter not found in word
    n:[] = []
    if '0' in parms:
        n = parse_not_found(parms['0'])

    #letter at one of these positions
    o:dict = {}
    for k,v in parms.items():
        if k >= 'A' and k <= 'Z':
            o[k] = strToIntArray(v)

    rows = database.get(word_len,p,n,o)
    sb.Append(f"count: {len(rows)}\n\n" )
    for row in rows:
        sb.Append(row + "\n")        
    return PlainTextResponse(str(sb))

@app.get("/")
async def index():
    return PlainTextResponse("Server running\nsample:\ncurl ""http://localhost:8000/w/5/1=D---S&A=3&R=2,4&0=EM""")

