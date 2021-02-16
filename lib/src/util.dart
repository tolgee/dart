library util;

import 'package:js/js_util.dart' as js;

dynamic mapToJsObject(Map<dynamic, dynamic> map) {
  var mapJs = js.newObject();
  map.forEach((key, value) {
    js.setProperty(mapJs, key, value);
  });
  return mapJs;
}