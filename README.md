My original idea for a stat was to try and predict consistancy within a player. After
much consideration I realized that this would probably be too difficult. Instead I 
decided to look further into the old-player young-player skills and see exactly how
the numbers came out because I thought that it was an interesting speculation after 
the lecture that we discussed it. My end goal was to be able to enter in some stats
and have a number come out that would loosely represent how long a player is expected to 
play if he kept his current stats throughout his career. I used the lahman database from
1950-2017 and modified the tables to contain wOBA, SLG, BA, and ISO. I then split the players into 3 seperate groups. Long career players, medium career players, and short career players. 
I defined a short career as 6 years or less, a medium career to be 6-12 years, and a long 
career to be more than 12. After gathering these 3 groups I eliminated players who could 
not hold an average of 445 AB per season. This removed a large amount of players with perfect 
wOBAs, or BA or andother funky stats. I tried to find some statcast data for player speeds, but it 
was not immediatley obvious to me how to integrate that into the lahman database, and the other 
problem was that a career average speed to first base would be ignoring many factors. 
Instead, I made up a stat called speedRatio that is the percent of Hits that lead to singles.
The logic behind this was that a power hitter would have a lower speedRatio than a weak hitter
who can run very fast. I then grabbed the average BA, ISO, speedRatio, SLG, and wOBA of the young
who can run very fast because a power hitter would have more home runs or distance hits. 
I then grabbed the average BA, ISO, speedRatio, and wOBA of the short group, medium group, and long group. When it was all said and done the stats came out like 
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

I created many sql tables and loaded them into Jupityr Notebooks as R dataframes. Most of 
the tables were named like BestWOBA. This table, for example, was all of the Season stats
during the season that had the highest WOBA for a player. So each row is one players stats
for their best WOBA season, and which season that was for them. When the table says 
bestWOBAInLongCareer, it is the same idea but only contains data for players who played in
over 12 seasons. I did this to see if there was a seperation in peak seasons for players
who had long careers vs all players on average, and there was! I also provided many
graphs and plots that show these exact numbers next to eachother. The table called
playerLongevity is basically the master table for this project and contains CAREER stats
for each player and how many seasons that player had in his career.

The final part of the notebook is a interactive cell that takes in the 5 stats I mentioned
above and finds previous players who matched ALL of those stats within 10%. It then prints
out how many seasons those players had in their career. Ideally this could be used to predict
the longevity of a career based on current career stats. Obviously, there are a lot of outliers
in this, but for someone like Mike Trout everyone who has stats close to his played a good amount
of time in the majors compared to someone like Trevor Story. 

Conclusion:
I wish that the data was more telling, but I think that the notion of old player skills vs young
player skills is mostly anecdotal evidence when it comes to predict a players career length. 
It could be that there are just so many outliers and execptions to the rules that the data
might be thrown off, but I could not find anything super definitive here. 
One interesting discovery though, was that players with long careers peak later in their career
that average when it comes to these stats. It was also strange to find out that on average players
will peak between their 3rd-5th year when we consider all players, that seems very early to me. 
I would like to dive deeper into this research because I feel like there has to be some sort of 
telling evidence about how long a player can play in the MLB. It may also be that there are so 
many outside factors that the stats will never come out cleanly.   

REPO:
The other file contained here is my queries for modifying the lahman data.
