@JS('@tolgee/core')
library tolgee_js;

import 'package:js/js.dart';

@JS('Tolgee')
class TolgeeJs {
  external TolgeeJs(dynamic config);

  external dynamic run();

  external String instant(String key, dynamic params, bool noWrap);

  external dynamic translate(String key, dynamic params, bool noWrap);

  external set lang(String lang);

  external String get lang;

  external dynamic get onLangChange;

  external dynamic get onLangLoaded;
}
