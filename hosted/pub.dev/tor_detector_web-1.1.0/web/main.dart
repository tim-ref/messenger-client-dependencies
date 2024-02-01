import 'dart:html';

import 'package:tor_detector_web/tor_detector_web.dart';

main() async {
  final isTor = await TorBrowserDetector.isTorBrowser;
  final isFirefox = TorBrowserDetector.isFirefox;
  final pluginsEmpty = TorBrowserDetector.pluginsEmpty;
  final windowEqualsScreen = TorBrowserDetector.windowEqualsScreen;
  final timeZoneIsUTC = TorBrowserDetector.timeZoneIsUTC;

  window.document.getElementById('app')!.innerText =
      'isTor: $isTor, isFirefox: $isFirefox, pluginsEmpty: $pluginsEmpty, windowEqualsScreen: $windowEqualsScreen, timeZoneIsUTC: $timeZoneIsUTC';
}
