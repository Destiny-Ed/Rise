const appName = "Rise";

String avatar(dynamic value) => 'https://robohash.org/$value';

String streakIcons(int level) {
  switch (level) {
    case 0:
      return "assets/streak_zero.png";
    case (> 0 && <= 50):
      return "assets/streak_black.png";
    case (> 51):
      return "assets/streak_black_full.png";
    default:
      return "assets/streak_fire.png";
  }
}
