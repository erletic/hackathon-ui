# Scoutracht

We want to build a web app for visualizing scouting and player data for a professional soccer club.

The user shall be able to specify SearchProfiles and List them in a grid view with two rows on the left and a player detail view on the right.

# Models

## Player

- Short Name
- Player ID
- Birthdate
- Team (str)
- Team Id

## Match
- Match (str)
- Match Id
- Date

## Snapshot (a players performance in a distinct match)

Physical Check Passed
Distance
M/min
Running Distance
HSR Distance
HSR Count
Sprint
Distance
Sprint Count	HI Distance	HI Count	PSV-99	Medium Acceleration Count	High Acceleration Count	Medium Deceleration Count	High Deceleration Count	Explosive Acceleration to HSR Count	Time to HSR	Time to HSR post-COD	Explosive Acceleration to Sprint Count	Time to Sprint	Time to Sprint post-COD	Change of Direction Count	Time to 505 around 90	Time to 505 around 180
Running Distance	HSR Distance	HSR Count	Sprint Distance	Sprint Count	HI Distance	HI Count	PSV-99	Medium Acceleration Count	High Acceleration Count	Medium Deceleration Count	High Deceleration Count	Explosive Acceleration to HSR Count	Time to HSR	Time to HSR post-COD	Explosive Acceleration to Sprint Count	Time to Sprint	Time to Sprint post-COD	Change of Direction Count	Time to 505 around 90	Time to 505 around 180

# Views

## ConfigurationView

FIFA-like tactics and formation definitions in seperate tabs.

Tactics tab must include sections for Offense and Defence play style.

## SearchProfileCreate

The user shall be able to define search profiles for certain players by selecting f.e. position, min/max age, physical strengths, league/competition