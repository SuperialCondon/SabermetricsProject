My original idea for a stat was to try and predict consistancy within a player. After
much consideration I realized that this would probably be too difficult. Instead I 
decided to look further into the old-player young-player skills and see exactly how
the numbers came out because I thought that it was an interesting speculation after 
the lecture that we discussed it. My end goal was to be able to enter in some stats
and have a number come out that would loosely represent how long a player is expected to 
play if he kept his current stats throughout his career. I used the lahman database from
1950-2017 and modified the tables to contain wOBA, SLG, BA, and ISO. I then split the players 
into 3 seperate groups. Long career players, medium career players, and short career players. 
I defined a short career as 6 years or less, a medium career to be 6-12 years, and a long 
career to be more than 12. After gathering these 3 groups I eliminated players who could 
not hold an average of 445 AB per season. This removed a large amount of players with perfect 
wOBAs, or BA or andother funky stats. I tried to find some statcast data for player speeds, but it 
was not immediatley obvious to me how to integrate that into the lahman database, and the other 
problem was that a career average speed to first base would be ignoring many factors. 
Instead, I made up a stat called speedRatio that is the percent of Hits that lead to singles.
The logic behind this was that a power hitter would have a lower speedRatio than a weak hitter
who can run very fast because a power hitter would have more home runs or distance hits. 
I then grabbed the average BA, ISO, speedRatio, and wOBA of the short
group, medium group, and long group. When it was all said and done the stats came out like 
this:

Young 
ISO: .125 BA: .260 SPEEDRATIO: .708 WOBA: .305 AVGYEARSPLAYED: 3.8

Medium
ISO: .134 BA: .271 SPEEDRATIO: .706 WOBA: .318 AVGYEARSPLAYED: 9.4

Old
ISO: .166 BA: .280 SPEEDRATIO: .673 WOBA: .339 AVGYEARSPLAYED: 15.8

So it does appear that ISO is higher among players who have had long careers, and speedRatio
is lower amoung players who have had a long career. However, no matter what I try to do 
with these numbers I cannot come up with a ratio or prediction value that gives some sort of
indicator into a career length based on career ISO and speedRatio. I am not sure if I need
to dive deeper here or if these old-player young-player skills are not entirely telling of
career length. 

From here:
I am going to try and look at the 3 groups of players when they were young and how their stat
averages changed throughout their career. For example if long-careered players have an average 
ISO of .166 and speedRatio of .673 throughout their career, what did they have when they were 
in their third season? How does that compare to short-careered players in their third season?
This is gonna take some SQL finessing. It may be useful to eliminate more outlier players as
well like players who played 24 seasons. I would also like to fiddle around with the thresholds 
of number of seasons that determine what group players belong to.

Code:
I am planning on making an iOS app to present the data when I understand more about these numbers.
I do not think the iOS part will take very long as that is what I did in my internship this summer.

I am a little disappointed in my progress at this point. I wish that there were some more obvious 
coorelations here and that I didnt spend so much time trying to figure out these strange results.

If I cannot figure anything out about the old-player/young-player skills maybe I could have a 
player similarity score to average players in all three groups.

REPO:
The other file contained here is my queries for modifying the lahman data.
