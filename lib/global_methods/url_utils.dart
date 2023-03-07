
import 'package:git_api/models/strings.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlUtils {
  static Future<void> launchLink(String link) async {
    final uri = Uri.parse(link);
    if (!await launchUrl(uri)) {
      throw Exception('${AppStrings.exception} $uri');
    }
  }
}
