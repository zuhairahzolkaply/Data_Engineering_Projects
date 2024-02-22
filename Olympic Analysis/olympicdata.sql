ALTER TABLE medals
RENAME COLUMN [Team/NOC] to NOC;

ALTER TABLE entriesgender
RENAME COLUMN [Total] to [Total Athletes];

SELECT NOC FROM medals
INTERSECT
SELECT NOC FROM athletes

CREATE VIEW olympic_data AS
SELECT
	a.[Name],
    a.[NOC],
	a.[Discipline],
    m.[Rank],
    m.[Gold],
    m.[Silver],
    m.[Bronze],
    m.[Total],
    m.[RankbyTotal],
	b.[Female],
	b.[Male],
	b.[Total Athletes]
FROM athletes a
LEFT JOIN medals m
    ON a.[NOC] = m.[NOC]
LEFT JOIN entriesgender b
    ON a.[Discipline] = b.[Discipline];

DROP VIEW olympic_data