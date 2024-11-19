import 'package:shared_preferences/shared_preferences.dart';

abstract class WizardPresentationData {
  static Future<bool> hasSeenWizard() async {
    final prefs = await SharedPreferences.getInstance();
    return false;
  }

  static Future<void> setUserHasSeenTheWizard(final bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("USER_HAS_SEEN_WIZARD", value);
  }
}