sealed class IntConstants {
  static const int sessionTimeout = 8;
  static const int flushBarDuration = 3;
  static const int stringLength2 = 2;
  static const int stringLength5 = 5;
  static const int stringLength8 = 8;
  static const int stringLength20 = 20;
  static const int stringLength256 = 256;
  static const int stringLength372 = 372;
  static const int stringLength400 = 400;
  static const int stringLength1000 = 1000;
  static const int reviewAppOfferPeriod = 5;
  static const int reviewAppOfferMinValue = 1;
  static List<int> reviewAppOfferValues = List<int>.generate(
    reviewAppOfferPeriod,
    (int index) => index + 1,
  );
}
