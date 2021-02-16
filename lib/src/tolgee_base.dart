import 'dart:async';
import 'dart:html';

import 'package:js/js_util.dart' as js;
import 'package:tolgee/src/tolgee_js.dart';
import 'package:tolgee/src/util.dart';

class Tolgee {
  TolgeeJs _tolgeeJs;

  Tolgee(dynamic config) {
    var uiModule = js.getProperty(window, '@tolgee/ui');

    if (config['UI'] == null && uiModule != null) {
      var uiConstructor = js.getProperty(uiModule, 'UI');
      config['ui'] = uiConstructor;
    }

    var configJs = js.newObject();
    config.forEach((key, value) {
      js.setProperty(configJs, key, value);
    });

    _tolgeeJs = TolgeeJs(configJs);
  }

  String instant(String key,
      [Map<String, dynamic> params, bool noWrap = false]) {
    params ??= {};
    return _tolgeeJs.instant(key, params, noWrap);
  }

  Future<String> translate(String key,
      [Map<String, dynamic> params, bool noWrap = false]) {
    params ??= {};
    return promiseToFuture(
        _tolgeeJs.translate(key, mapToJsObject(params), noWrap));
  }

  dynamic onLangChange(Function callback) {
    js.callMethod(_tolgeeJs.onLangChange, 'subscribe', [callback]);
  }

  dynamic onLangLoaded(Function callback) {
    return js.callMethod(_tolgeeJs.onLangLoaded, 'subscribe', [callback]);
  }

  set lang(String lang) {
    _tolgeeJs.lang = lang;
  }

  String get lang {
    return _tolgeeJs.lang;
  }

  dynamic getJsInstance() {
    return _tolgeeJs;
  }

  Future<void> run() {
    return promiseToFuture(_tolgeeJs.run());
  }
}
