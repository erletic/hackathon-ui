import '../models/search_profile.dart';
import '../models/player.dart';
import '../models/player_performance.dart';

class MockData {
  static List<SearchProfile> getSearchProfiles() {
    return [
      SearchProfile(
        position: 'CF',
        positionGroup: 'Center Forward',
        minAge: 20,
        maxAge: 30,
        performanceFilters: PerformanceFilters(
          minDistance: 10000.0,
          maxDistance: 12000.0,
          minSprintCount: 5,
          maxSprintCount: 15,
        ),
      ),
      SearchProfile(
        position: 'CM',
        positionGroup: 'Central Midfield',
        minAge: 22,
        maxAge: 28,
        performanceFilters: PerformanceFilters(
          minDistance: 11000.0,
          maxDistance: 13000.0,
          minHsrDistance: 700.0,
          maxHsrDistance: 1000.0,
        ),
      ),
      SearchProfile(
        position: 'CB',
        positionGroup: 'Center Back',
        minAge: 24,
        maxAge: 32,
        performanceFilters: PerformanceFilters(
          minDistance: 9000.0,
          maxDistance: 11000.0,
        ),
      ),
    ];
  }

  static List<Player> getPlayers() {
    return [
      Player(
        name: 'Aaron Ramsey',
        shortName: 'A. Ramsey',
        playerId: 95,
        birthdate: '1990-12-26',
        teamName: 'Cardiff City',
      ),
      Player(
        name: 'Harry Kane',
        shortName: 'H. Kane',
        playerId: 101,
        birthdate: '1993-07-28',
        teamName: 'Tottenham Hotspur',
      ),
      Player(
        name: 'Marcus Rashford',
        shortName: 'M. Rashford',
        playerId: 102,
        birthdate: '1997-10-31',
        teamName: 'Manchester United',
      ),
      Player(
        name: 'Phil Foden',
        shortName: 'P. Foden',
        playerId: 103,
        birthdate: '2000-05-28',
        teamName: 'Manchester City',
      ),
      Player(
        name: 'Bukayo Saka',
        shortName: 'B. Saka',
        playerId: 104,
        birthdate: '2001-09-05',
        teamName: 'Arsenal',
      ),
      Player(
        name: 'Declan Rice',
        shortName: 'D. Rice',
        playerId: 105,
        birthdate: '1999-01-14',
        teamName: 'Arsenal',
      ),
      Player(
        name: 'Jude Bellingham',
        shortName: 'J. Bellingham',
        playerId: 106,
        birthdate: '2003-06-29',
        teamName: 'Borussia Dortmund',
      ),
      Player(
        name: 'Cole Palmer',
        shortName: 'C. Palmer',
        playerId: 107,
        birthdate: '2002-05-06',
        teamName: 'Manchester City',
      ),
      Player(
        name: 'Ollie Watkins',
        shortName: 'O. Watkins',
        playerId: 108,
        birthdate: '1995-12-30',
        teamName: 'Aston Villa',
      ),
      Player(
        name: 'Ivan Toney',
        shortName: 'I. Toney',
        playerId: 109,
        birthdate: '1996-03-16',
        teamName: 'Brentford',
      ),
      Player(
        name: 'Alexander Isak',
        shortName: 'A. Isak',
        playerId: 110,
        birthdate: '1999-09-21',
        teamName: 'Newcastle United',
      ),
      Player(
        name: 'Mohamed Salah',
        shortName: 'M. Salah',
        playerId: 111,
        birthdate: '1992-06-15',
        teamName: 'Liverpool',
      ),
    ];
  }

  static List<PlayerPerformance> getPlayerPerformances() {
    return [
      PlayerPerformance(
        player: 'Aaron Ramsey',
        shortName: 'A. Ramsey',
        playerId: 95,
        birthdate: '1990-12-26',
        team: 'Cardiff City',
        teamId: 61,
        match: 'Leeds United v Cardiff City',
        matchId: 1008942,
        date: '2023-08-06',
        competition: 'ENG - Championship',
        competitionId: 31,
        season: '2023/2024',
        seasonId: 28,
        competitionEditionId: 544,
        position: 'CF',
        positionGroup: 'Center Forward',
        minutes: 83.12,
        physicalCheckPassed: true,
        distance: 10744.0,
        mPerMin: 129.26,
        runningDistance: 2067.0,
        hsrDistance: 728.0,
        hsrCount: 71,
        sprintDistance: 97.0,
        sprintCount: 7,
        hiDistance: 825.0,
        hiCount: 78,
        psv99: 26.3,
        mediumAccelerationCount: 123,
        highAccelerationCount: 8,
        mediumDecelerationCount: 97,
        highDecelerationCount: 22,
        explosiveAccelerationToHsrCount: 7,
        timeToHsr: 0.77,
        timeToHsrPostCod: 0.77,
        explosiveAccelerationToSprintCount: 1,
        timeToSprint: 1.69,
        timeToSprintPostCod: 1.69,
        changeOfDirectionCount: 65,
        timeTo505Around90: 2.23,
        timeTo505Around180: 2.54,
      ),
    ];
  }
}
