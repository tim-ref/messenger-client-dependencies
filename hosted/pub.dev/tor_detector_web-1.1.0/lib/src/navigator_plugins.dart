@JS('window.navigator')
library plugins;

import 'dart:html';
import 'dart:js';

import 'package:js/js.dart';

@JS('plugins')
external PluginArray get _plugins;

extension Plugins on Navigator {
  @JS('navigator.plugins')
  List<dynamic> get plugins {
    return _plugins.toList();
  }
}
