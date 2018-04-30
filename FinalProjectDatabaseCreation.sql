use lahman;
/*
drop table if exists careerBatting;
CREATE TABLE careerBatting as (
select b.playerID, sum(b.G) as G, sum(b.AB) as AB, sum(b.R) as R, sum(b.H) as H, sum(b.IBB) as IBB, (sum(b.h) - (sum(b.2B)+ sum(b.3B)+ sum(b.HR))) 
as 1B, sum(b.2B) as 2B, sum(b.3B) as 3B, sum(b.HR) as HR, sum(b.SF) as SF,
				sum(b.RBI) as RBI, sum(b.SB) as SB, sum(b.CS) as CS, sum(b.BB) as BB, sum(b.SO) as SO, sum(b.HBP) as HBP
            from batting as b
			where b.yearID > 1950
            group by b.playerID
);


DROP TABLE IF EXISTS careerBattingSaberMetrics;
CREATE TABLE careerBattingSaberMetrics AS (
select ((.690 * (BB - IBB) + .722 * HBP + .888 * 1B + 1.1271 * 2B + 1.616 * 3B + 2.101 * HR) / nullif((AB + (BB - IBB) + SF + HBP), 0))AS WOBA,
((1B + (2 * 2B) + (3 * 3B) + (4 * HR))/nullif(AB,0)) as SLG, (H / nullif(AB,0)) as BA, 
((1B + (2 * 2B) + (3 * 3B) + (4 * HR))/nullif(AB,0)) - (H / nullif(AB,0)) as ISO, (1B/nullif(H,0)) as speedRatio, playerID
	from careerBatting
    );
*/
/*
drop table if exists playerLongevity;
CREATE TABLE playerLongevity as (
select p.playerID, p.nameLast, p.nameFirst, s.ISO, s.BA, s.speedRatio, s.WOBA, s.SLG, (p.finalGame - p.debut) as yearsPlayed, p.finalGame, 
p.debut, b.G, b.AB, b.R, b.H, b.1B, b.2B, b.3B, b.HR, b.RBI, b.BB, b.SO, b.HBP
	from people as p
	join careerBatting as b
		on b.playerID = p.playerID
	join careerBattingSaberMetrics as s
		on s.playerID = p.playerID
	where p.debut >= 1950 and (p.finalGame - p.debut) > 2 and p.finalGame < 2017 and b.AB / (p.finalGame - p.debut)  > 445
    order by p.debut
    )
;
*/

DROP TABLE IF EXISTS youngPlayerLongevity;
CREATE TABLE youngPlayerLongevity as (
select * from playerLongevity where yearsPlayed < 6 order by AB DESC
);

DROP TABLE IF EXISTS mediumPlayerLongevity;
CREATE TABLE mediumPlayerLongevity as (
select * from playerLongevity where yearsPlayed >= 6 and yearsPlayed < 12 order by AB DESC
);

DROP TABLE IF EXISTS longPlayerLongevity;
CREATE TABLE longPlayerLongevity as (
select * from playerLongevity where yearsPlayed >= 12 order by AB DESC
);


SELECT  AVG(ISO), AVG(BA), AVG(speedRatio), AVG(WOBA), AVG(yearsPlayed)
	from youngPlayerLongevity;

SELECT AVG(ISO), AVG(BA), AVG(speedRatio), AVG(WOBA), AVG(yearsPlayed)
	from mediumPlayerLongevity;

SELECT AVG(ISO), AVG(BA), AVG(speedRatio), AVG(WOBA), AVG(yearsPlayed)
	from longPlayerLongevity;

SELECT AVG(ISO) * 6.25 + AVG(BA) * 3.57 + AVG(speedRatio) * 1.49 + AVG(WOBA) * 2.9
	from youngPlayerLongevity;

/*SELECT ((AVG(ISO)) / (AVG(speedRatio)))
	from longPlayerLongevity;
SELECT ((AVG(ISO)) / (AVG(speedRatio)))
	from mediumPlayerLongevity;
SELECT ((AVG(ISO)) / (AVG(speedRatio)))
	from youngPlayerLongevity;
    
*/
SELECT * from playerLongevity where ISO <= .125 and speedRatio >= .70;




