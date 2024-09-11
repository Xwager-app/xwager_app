enum Hashtags {
  esports,
  football,
  hockey,
  golf,
  ufc,
  boxing,
  cricket,
  snooker,
  bowls,
  tennis,
  drafts,
  rugby,
  racing,
  handball,
  baseball,
  volleyball,
  fantasyLeague,
  preseason
}

class Hashtag {
  Hashtag({required this.hashtag, required this.title});

  final Hashtags hashtag;
  final String title;
}
