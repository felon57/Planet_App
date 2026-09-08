// extensions.dart — Small helper extensions used across the UI
// - FarsiNumberExtension: adds a convenience getter farsiNumber to String
//   which converts ASCII digits to Persian digits for display.
// Keep extensions focused and side-effect free so they are safe to call in UI code.

extension FarsiNumberExtension on String {
  /// Returns a copy of this string with all English digits replaced by Farsi digits.
  String get farsiNumber {
    const english = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9'
    ];
    const farsi = [
      '۰',
      '۱',
      '۲',
      '۳',
      '۴',
      '۵',
      '۶',
      '۷',
      '۸',
      '۹'
    ];
    String text = this;
    for (int i = 0; i < english.length; i++) {
      text = text.replaceAll(english[i], farsi[i]);
    }
    return text;
  }
}
