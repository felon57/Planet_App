// In-memory user profile data shared across profile-related screens.

class UserProfile {
  static String name = 'ساناز امینی';
  static String email = 'sanaz@gmail.com';
  static String phone = '09123456789';
  static String bio = 'علاقه‌مند به گیاهان آپارتمانی و باغبانی';

  static void update({
    required String name,
    required String email,
    required String phone,
    required String bio,
  }) {
    UserProfile.name = name;
    UserProfile.email = email;
    UserProfile.phone = phone;
    UserProfile.bio = bio;
  }
}
