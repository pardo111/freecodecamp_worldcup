#! /bin/bash

PSQL="psql --username=postgres --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT (SUM(winner_goals)+SUM(opponent_goals)) FROM games")"


echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals) , 2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT avg(winner_goals)+avg(opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT max(winner_goals) FROM games")"


echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(winner_goals) FROM games where winner_goals>2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT   name FROM teams full join games on winner_id=team_id where round='Final' and year=2018")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT distinct  name FROM teams,games     where round='Eighth-Final' and (opponent_id=team_id or winner_id=team_id ) and year=2014 order by name")"


echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT distinct  name FROM teams,games     where round='Eighth-Final' and  winner_id=team_id order by name")"

echo -e "\nYear and team name of all the champions:"
 name1=$($PSQL "SELECT   name FROM teams full join games on winner_id=team_id where round='Final' and year=2018")
 name2=$($PSQL "SELECT   name FROM teams full join games on winner_id=team_id where round='Final' and year=2014")
echo -e "2014|$name1\n2018|$name2"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "select name from teams where name like 'Co%' ")"
