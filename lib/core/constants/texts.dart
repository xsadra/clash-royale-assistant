class AppText {
  static ConstAppTests consts = const ConstAppTests();
  static ApiAppTexts api = const ApiAppTexts();
  static ErrorAppTexts error = const ErrorAppTexts();
  static UIMessagesAppTexts uiMessages = const UIMessagesAppTexts();
  static BodyAppTexts body = const BodyAppTexts();
  static UIAppTexts ui = const UIAppTexts();

  AppText._();
}

class AppRouteTexts {
  AppRouteTexts();
  static const SPLASH_PAGE_ROUTE = 'SplashPageRoute';
  static const INPUT_TAG_PAGE_ROUTE = 'InputTagPageRoute';
  static const INPUT_TAG_PAGE_FULL_SCREEN_ROUTE = 'InputTagPageFullScreenRoute';
  static const PLAYER_PAGE_ROUTE = 'PlayerPageRoute';
}

class ConstAppTests {
  const ConstAppTests();

  String get cachedUpcomingChests => 'CACHED_UPCOMING_CHESTS';
  String get cachedPlayer => 'CACHED_PLAYER';
  String get currentPlayerTag => 'CURRENT_PLAYER_TAG';
  String get allCards => 'ALL_CARDS';
  String get cachedBattles => 'CACHED_BATTLES';
}

class ApiAppTexts {
  const ApiAppTexts();

  String get apiBaseUrl => 'https://api.clashroyale.com/';
  String get apiBaseUrlProxy => 'https://proxy.royaleapi.dev/';
  String get apiPlayerUrl => 'v1/players/';
  String get apiBasePlayerUrl => apiBaseUrl + apiPlayerUrl;
  String get apiBasePlayerUrlProxy => apiBaseUrlProxy + apiPlayerUrl;
  String get apiClanUrl => 'v1/clans/';
  String get apiBaseClanUrl => apiBaseUrl + apiClanUrl;
  String get apiBaseClanUrlProxy => apiBaseUrlProxy + apiClanUrl;
  String get apiTournamentUrl => 'v1/tournaments/';
  String get apiBaseTournamentUrl => apiBaseUrl + apiTournamentUrl;
  String get apiBaseTournamentUrlProxy => apiBaseUrlProxy + apiTournamentUrl;
  String get upcomingChests => '/upcomingchests';
  String get battles => '/battlelog';
}

class ErrorAppTexts {
  const ErrorAppTexts();

  String get serverFailureMessage => 'Server Failure';
  String get cacheFailureMessage => 'Cache Failure';
  String get notFoundFailureMessage => 'Set your player Tag: #xxxxxxx';
  String get playerTagNotSavedMessage => 'Could not save player Tag!';
  String get unexpectedError => 'Unexpected error';
  String get unexpectedEvent => 'Unexpected event';
  String get findTagTextFieldError => 'Wrong tag, try again!';
}

class UIMessagesAppTexts {
  const UIMessagesAppTexts();

  String get unhandledState => 'Unhandled State';

  String get noData => 'No data';
}

class BodyAppTexts {
  const BodyAppTexts();

  String get appTitle => 'Clash Royale Assistant';
  String get num1 => '1';
  String get num2 => '2';
  String get num3 => '3';
  String get num4 => '4';
  String get findTagHelp1 => 'Launch Clash Royale and tap your name';
  String get findTagHelp2 => 'Find your player Tag below your name';
  String get findTagHelp3 => 'Tap on your Tag and Copy it';
  String get findTagHelp4 => 'Paste your Tag in the field above';
  String get findTagTextFieldLabel => 'Enter your Player Tag';
  String get findTagTextFieldHint => 'ABCD123';
  String get findTagHelpTextHeader => 'How to find your Tag';
}

class UIAppTexts {
  const UIAppTexts();
  String get player => 'Player';
  String get toStart => 'To Start';
  String get upcoming => 'Upcoming';
  String get cards => 'Cards';
  String get achieved => 'Achieved';
  String get achievedCol => 'Achieved: ';
  String get battles => 'Battles';
  String get search => 'Search';
  String get plus => '+';
  String get hashTag => '#';
  String get empty => '';
  String get spaceUrl => '%23';
  String get next => 'Next';
  String get lvlSpc => 'lvl ';
  String get levelSpc => 'Level ';
  String get achievementsCol => 'Achievements:';
  String get targetCol => 'Target: ';
  String get starsCol => 'Stars: ';
  String get notYet => 'Not yet!';
  String get allCardsCol => 'AllCards: ';
  String get trophies => 'Trophies';
  String get trophiesCol => 'Trophies: ';
  String get bestTrophiesCol => 'Best Trophies: ';
  String get battleStats => 'Battle Stats';
  String get winsCol => 'Wins: ';
  String get lossesCol => 'Losses: ';
  String get threeCrownWinsCol => 'Three Crown Wins: ';
  String get battleCountCol => 'Battle Count: ';
  String get donation => 'Donation';
  String get donationsCol => 'Donations: ';
  String get donationsBalanceCol => 'Donations balance: ';
  String get donationsReceivedCol => 'Donations Received: ';
  String get totalDonationsCol => 'Total Donations: ';
  String get leagueSeason => 'League Season';
  String get arenaCol => 'Arena: ';
  String get challengeAndTournament => 'Challenge and Tournament';
  String get warDayWinsCol => 'War Day Wins: ';
  String get clanCardsCollectedCol => 'Clan Cards Collected: ';
  String get challengeCardsWonCol => 'Challenge Cards Won: ';
  String get challengeMaxWinsCol => 'Challenge Max Wins: ';
  String get tournamentCardsWonCol => 'Tournament Cards Won: ';
  String get tournamentBattleCountCol => 'Tournament Battle Count: ';
  String get warOld => 'War (Old)';
  String get currentSeason => 'Current Season';
  String get previousSeason => 'Previous Season';
  String get dateCol => 'Date: ';
  String get bestSeason => 'Best Season';
  String get currentDeck => 'Current Deck';
  String get arrowFavoriteCardCol => ' > Favorite Card: ';

// static const BATTLE_STATS =  ;
}
