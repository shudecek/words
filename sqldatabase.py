import pyodbc
from stringbuilder import StringBuilder

class MSSqlData:

    conn: pyodbc.Connection
    cursor: pyodbc.Cursor

    def __init__(self):
        self.conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=standb;Trusted_Connection=yes;')
        self.cursor = self.conn.cursor()

    def get(self, len: int, atPos: dict, notIn: [], oneOf: dict) -> list:
        sb = StringBuilder()

        sqlstr = f"select top 1000 word from words where length={len}"

        # add filter for found at position
        for key,value in atPos.items():
            sb.Append(f" and substring(word,{key},1) = '{value}'")
        
        # add filter for not in
        for s in notIn:
            sb.Append(f" and CHARINDEX('{s}',word) = 0")    

        # add filter for one of positions
        for key,value in oneOf.items():            
            valStr = ''.join(str(value))
            valStr = valStr.replace("[","(").replace("]",")") # string is [1,2,3], we need (1,2,3)
            sb.Append(f" and CHARINDEX('{key}',word) in {valStr}")

        sqlstr += str(sb)

        cur = self.cursor.execute(sqlstr)
        rows = cur.fetchall()
        words = []
        for row in rows:
            words.append(row[0])
        return words