--use standb

create table word5
(
word char(5) not null
)

create table word6
(
word char(6) not null
)

select top 10 * from [dbo].[Collins Scrabble Words (2019)]
go

drop table words


go

create table words(
	word varchar(15),
	[length] int
)


go
CREATE  NONCLUSTERED INDEX ix_len
   ON dbo.words([length])

go

insert words(word, length)
select column1, len(column1) from [dbo].[Collins Scrabble Words (2019)] 
where len(column1) <= 15

go

select top 10 word 
from words
where [length]=5
and substring(word,1,1) = 'A'



insert word5
select [column1] from [dbo].[Collins Scrabble Words (2019)]
where len([column1]) = 5


insert word6
select [column1] from [dbo].[Collins Scrabble Words (2019)]
where len([column1]) = 6

create view vwWord5
as
select 
	word,
	substring(word,1,1) [p1],
	substring(word,2,1) [p2],
	substring(word,3,1) [p3],
	substring(word,4,1) [p4],
	substring(word,5,1) [p5],
	CHARINDEX('A',word) [A],
	CHARINDEX('B',word) [B],
	CHARINDEX('C',word) [C],
	CHARINDEX('D',word) [D],
	CHARINDEX('E',word) [E],
	CHARINDEX('F',word) [F],
	CHARINDEX('G',word) [G],
	CHARINDEX('H',word) [H],
	CHARINDEX('I',word) [I],
	CHARINDEX('J',word) [J],
	CHARINDEX('K',word) [K],
	CHARINDEX('L',word) [L],
	CHARINDEX('M',word) [M],
	CHARINDEX('N',word) [N],
	CHARINDEX('O',word) [O],
	CHARINDEX('P',word) [P],
	CHARINDEX('Q',word) [Q],
	CHARINDEX('R',word) [R],
	CHARINDEX('S',word) [S],
	CHARINDEX('T',word) [T],
	CHARINDEX('U',word) [U],
	CHARINDEX('V',word) [V],
	CHARINDEX('W',word) [W],
	CHARINDEX('X',word) [X],
	CHARINDEX('Y',word) [Y],
	CHARINDEX('Z',word) [Z]


from word5
go

create view vwWord6
as
select 
	word,
	substring(word,1,1) [p1],
	substring(word,2,1) [p2],
	substring(word,3,1) [p3],
	substring(word,4,1) [p4],
	substring(word,5,1) [p5],
	substring(word,6,1) [p6],
	CHARINDEX('A',word) [A],
	CHARINDEX('B',word) [B],
	CHARINDEX('C',word) [C],
	CHARINDEX('D',word) [D],
	CHARINDEX('E',word) [E],
	CHARINDEX('F',word) [F],
	CHARINDEX('G',word) [G],
	CHARINDEX('H',word) [H],
	CHARINDEX('I',word) [I],
	CHARINDEX('J',word) [J],
	CHARINDEX('K',word) [K],
	CHARINDEX('L',word) [L],
	CHARINDEX('M',word) [M],
	CHARINDEX('N',word) [N],
	CHARINDEX('O',word) [O],
	CHARINDEX('P',word) [P],
	CHARINDEX('Q',word) [Q],
	CHARINDEX('R',word) [R],
	CHARINDEX('S',word) [S],
	CHARINDEX('T',word) [T],
	CHARINDEX('U',word) [U],
	CHARINDEX('V',word) [V],
	CHARINDEX('W',word) [W],
	CHARINDEX('X',word) [X],
	CHARINDEX('Y',word) [Y],
	CHARINDEX('Z',word) [Z]

from word6
go


-- 5 letter
select word
from vwWord5
where 1=1
and p2 = 'O'
 and p5 = 'E'
--and S in (5)
and G in (1,3)

--and Y in (5)
and 0= S+T+A+M+F+R



/*
?p1=D&p5=S&A=3&R=2,4&0=TEM



*/



select *
from vwWord5
where
S in (1,2)











-- 6 letter
select word
from vwWord6
where
S in (3,4)
and E in (1,5,6)
and A in (2,5)

and T = 0
and M = 0
and K = 0