// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// API docs from [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web).
// Attributions and copyright licensing by Mozilla Contributors is licensed
// under [CC-BY-SA 2.5](https://creativecommons.org/licenses/by-sa/2.5/.

// Generated from Web IDL definitions.

@JS()
library;

import 'dart:js_interop';

import 'css_typed_om.dart';
import 'cssom.dart';
import 'dom.dart';
import 'html.dart';

/// The **`MathMLElement`** interface represents any
/// [MathML](https://developer.mozilla.org/en-US/docs/Web/MathML) element.
extension type MathMLElement._(JSObject _) implements Element, JSObject {
  /// Creates a [MathMLElement] using the tag 'math'.
  MathMLElement.math()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'math',
        );

  /// Creates a [MathMLElement] using the tag 'mtext'.
  MathMLElement.mtext()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mtext',
        );

  /// Creates a [MathMLElement] using the tag 'mi'.
  MathMLElement.mi()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mi',
        );

  /// Creates a [MathMLElement] using the tag 'mn'.
  MathMLElement.mn()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mn',
        );

  /// Creates a [MathMLElement] using the tag 'mo'.
  MathMLElement.mo()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mo',
        );

  /// Creates a [MathMLElement] using the tag 'mspace'.
  MathMLElement.mspace()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mspace',
        );

  /// Creates a [MathMLElement] using the tag 'ms'.
  MathMLElement.ms()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'ms',
        );

  /// Creates a [MathMLElement] using the tag 'mrow'.
  MathMLElement.mrow()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mrow',
        );

  /// Creates a [MathMLElement] using the tag 'mfrac'.
  MathMLElement.mfrac()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mfrac',
        );

  /// Creates a [MathMLElement] using the tag 'msqrt'.
  MathMLElement.msqrt()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'msqrt',
        );

  /// Creates a [MathMLElement] using the tag 'mroot'.
  MathMLElement.mroot()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mroot',
        );

  /// Creates a [MathMLElement] using the tag 'mstyle'.
  MathMLElement.mstyle()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mstyle',
        );

  /// Creates a [MathMLElement] using the tag 'merror'.
  MathMLElement.merror()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'merror',
        );

  /// Creates a [MathMLElement] using the tag 'mpadded'.
  MathMLElement.mpadded()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mpadded',
        );

  /// Creates a [MathMLElement] using the tag 'mphantom'.
  MathMLElement.mphantom()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mphantom',
        );

  /// Creates a [MathMLElement] using the tag 'msub'.
  MathMLElement.msub()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'msub',
        );

  /// Creates a [MathMLElement] using the tag 'msup'.
  MathMLElement.msup()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'msup',
        );

  /// Creates a [MathMLElement] using the tag 'msubsup'.
  MathMLElement.msubsup()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'msubsup',
        );

  /// Creates a [MathMLElement] using the tag 'munder'.
  MathMLElement.munder()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'munder',
        );

  /// Creates a [MathMLElement] using the tag 'mover'.
  MathMLElement.mover()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mover',
        );

  /// Creates a [MathMLElement] using the tag 'munderover'.
  MathMLElement.munderover()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'munderover',
        );

  /// Creates a [MathMLElement] using the tag 'mmultiscripts'.
  MathMLElement.mmultiscripts()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mmultiscripts',
        );

  /// Creates a [MathMLElement] using the tag 'mprescripts'.
  MathMLElement.mprescripts()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mprescripts',
        );

  /// Creates a [MathMLElement] using the tag 'mtable'.
  MathMLElement.mtable()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mtable',
        );

  /// Creates a [MathMLElement] using the tag 'mtr'.
  MathMLElement.mtr()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mtr',
        );

  /// Creates a [MathMLElement] using the tag 'mtd'.
  MathMLElement.mtd()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'mtd',
        );

  /// Creates a [MathMLElement] using the tag 'maction'.
  MathMLElement.maction()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'maction',
        );

  /// Creates a [MathMLElement] using the tag 'semantics'.
  MathMLElement.semantics()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'semantics',
        );

  /// Creates a [MathMLElement] using the tag 'annotation'.
  MathMLElement.annotation()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'annotation',
        );

  /// Creates a [MathMLElement] using the tag 'annotation-xml'.
  MathMLElement.annotation_xml()
      : _ = document.createElementNS(
          'http://www.w3.org/1998/Math/MathML',
          'annotation-xml',
        );

  external void focus([FocusOptions options]);
  external void blur();
  external StylePropertyMap get attributeStyleMap;
  external CSSStyleDeclaration get style;
  external set onanimationstart(EventHandler value);
  external EventHandler get onanimationstart;
  external set onanimationiteration(EventHandler value);
  external EventHandler get onanimationiteration;
  external set onanimationend(EventHandler value);
  external EventHandler get onanimationend;
  external set onanimationcancel(EventHandler value);
  external EventHandler get onanimationcancel;
  external set ontransitionrun(EventHandler value);
  external EventHandler get ontransitionrun;
  external set ontransitionstart(EventHandler value);
  external EventHandler get ontransitionstart;
  external set ontransitionend(EventHandler value);
  external EventHandler get ontransitionend;
  external set ontransitioncancel(EventHandler value);
  external EventHandler get ontransitioncancel;
  external set onabort(EventHandler value);
  external EventHandler get onabort;
  external set onauxclick(EventHandler value);
  external EventHandler get onauxclick;
  external set onbeforeinput(EventHandler value);
  external EventHandler get onbeforeinput;
  external set onbeforematch(EventHandler value);
  external EventHandler get onbeforematch;
  external set onbeforetoggle(EventHandler value);
  external EventHandler get onbeforetoggle;
  external set onblur(EventHandler value);
  external EventHandler get onblur;
  external set oncancel(EventHandler value);
  external EventHandler get oncancel;
  external set oncanplay(EventHandler value);
  external EventHandler get oncanplay;
  external set oncanplaythrough(EventHandler value);
  external EventHandler get oncanplaythrough;
  external set onchange(EventHandler value);
  external EventHandler get onchange;
  external set onclick(EventHandler value);
  external EventHandler get onclick;
  external set onclose(EventHandler value);
  external EventHandler get onclose;
  external set oncontextlost(EventHandler value);
  external EventHandler get oncontextlost;
  external set oncontextmenu(EventHandler value);
  external EventHandler get oncontextmenu;
  external set oncontextrestored(EventHandler value);
  external EventHandler get oncontextrestored;
  external set oncopy(EventHandler value);
  external EventHandler get oncopy;
  external set oncuechange(EventHandler value);
  external EventHandler get oncuechange;
  external set oncut(EventHandler value);
  external EventHandler get oncut;
  external set ondblclick(EventHandler value);
  external EventHandler get ondblclick;
  external set ondrag(EventHandler value);
  external EventHandler get ondrag;
  external set ondragend(EventHandler value);
  external EventHandler get ondragend;
  external set ondragenter(EventHandler value);
  external EventHandler get ondragenter;
  external set ondragleave(EventHandler value);
  external EventHandler get ondragleave;
  external set ondragover(EventHandler value);
  external EventHandler get ondragover;
  external set ondragstart(EventHandler value);
  external EventHandler get ondragstart;
  external set ondrop(EventHandler value);
  external EventHandler get ondrop;
  external set ondurationchange(EventHandler value);
  external EventHandler get ondurationchange;
  external set onemptied(EventHandler value);
  external EventHandler get onemptied;
  external set onended(EventHandler value);
  external EventHandler get onended;
  external set onerror(OnErrorEventHandler value);
  external OnErrorEventHandler get onerror;
  external set onfocus(EventHandler value);
  external EventHandler get onfocus;
  external set onformdata(EventHandler value);
  external EventHandler get onformdata;
  external set oninput(EventHandler value);
  external EventHandler get oninput;
  external set oninvalid(EventHandler value);
  external EventHandler get oninvalid;
  external set onkeydown(EventHandler value);
  external EventHandler get onkeydown;
  external set onkeypress(EventHandler value);
  external EventHandler get onkeypress;
  external set onkeyup(EventHandler value);
  external EventHandler get onkeyup;
  external set onload(EventHandler value);
  external EventHandler get onload;
  external set onloadeddata(EventHandler value);
  external EventHandler get onloadeddata;
  external set onloadedmetadata(EventHandler value);
  external EventHandler get onloadedmetadata;
  external set onloadstart(EventHandler value);
  external EventHandler get onloadstart;
  external set onmousedown(EventHandler value);
  external EventHandler get onmousedown;
  external set onmouseenter(EventHandler value);
  external EventHandler get onmouseenter;
  external set onmouseleave(EventHandler value);
  external EventHandler get onmouseleave;
  external set onmousemove(EventHandler value);
  external EventHandler get onmousemove;
  external set onmouseout(EventHandler value);
  external EventHandler get onmouseout;
  external set onmouseover(EventHandler value);
  external EventHandler get onmouseover;
  external set onmouseup(EventHandler value);
  external EventHandler get onmouseup;
  external set onpaste(EventHandler value);
  external EventHandler get onpaste;
  external set onpause(EventHandler value);
  external EventHandler get onpause;
  external set onplay(EventHandler value);
  external EventHandler get onplay;
  external set onplaying(EventHandler value);
  external EventHandler get onplaying;
  external set onprogress(EventHandler value);
  external EventHandler get onprogress;
  external set onratechange(EventHandler value);
  external EventHandler get onratechange;
  external set onreset(EventHandler value);
  external EventHandler get onreset;
  external set onresize(EventHandler value);
  external EventHandler get onresize;
  external set onscroll(EventHandler value);
  external EventHandler get onscroll;
  external set onscrollend(EventHandler value);
  external EventHandler get onscrollend;
  external set onsecuritypolicyviolation(EventHandler value);
  external EventHandler get onsecuritypolicyviolation;
  external set onseeked(EventHandler value);
  external EventHandler get onseeked;
  external set onseeking(EventHandler value);
  external EventHandler get onseeking;
  external set onselect(EventHandler value);
  external EventHandler get onselect;
  external set onslotchange(EventHandler value);
  external EventHandler get onslotchange;
  external set onstalled(EventHandler value);
  external EventHandler get onstalled;
  external set onsubmit(EventHandler value);
  external EventHandler get onsubmit;
  external set onsuspend(EventHandler value);
  external EventHandler get onsuspend;
  external set ontimeupdate(EventHandler value);
  external EventHandler get ontimeupdate;
  external set ontoggle(EventHandler value);
  external EventHandler get ontoggle;
  external set onvolumechange(EventHandler value);
  external EventHandler get onvolumechange;
  external set onwaiting(EventHandler value);
  external EventHandler get onwaiting;
  external set onwebkitanimationend(EventHandler value);
  external EventHandler get onwebkitanimationend;
  external set onwebkitanimationiteration(EventHandler value);
  external EventHandler get onwebkitanimationiteration;
  external set onwebkitanimationstart(EventHandler value);
  external EventHandler get onwebkitanimationstart;
  external set onwebkittransitionend(EventHandler value);
  external EventHandler get onwebkittransitionend;
  external set onwheel(EventHandler value);
  external EventHandler get onwheel;
  external set onpointerover(EventHandler value);
  external EventHandler get onpointerover;
  external set onpointerenter(EventHandler value);
  external EventHandler get onpointerenter;
  external set onpointerdown(EventHandler value);
  external EventHandler get onpointerdown;
  external set onpointermove(EventHandler value);
  external EventHandler get onpointermove;
  external set onpointerrawupdate(EventHandler value);
  external EventHandler get onpointerrawupdate;
  external set onpointerup(EventHandler value);
  external EventHandler get onpointerup;
  external set onpointercancel(EventHandler value);
  external EventHandler get onpointercancel;
  external set onpointerout(EventHandler value);
  external EventHandler get onpointerout;
  external set onpointerleave(EventHandler value);
  external EventHandler get onpointerleave;
  external set ongotpointercapture(EventHandler value);
  external EventHandler get ongotpointercapture;
  external set onlostpointercapture(EventHandler value);
  external EventHandler get onlostpointercapture;
  external set onselectstart(EventHandler value);
  external EventHandler get onselectstart;
  external set onselectionchange(EventHandler value);
  external EventHandler get onselectionchange;
  external set ontouchstart(EventHandler value);
  external EventHandler get ontouchstart;
  external set ontouchend(EventHandler value);
  external EventHandler get ontouchend;
  external set ontouchmove(EventHandler value);
  external EventHandler get ontouchmove;
  external set ontouchcancel(EventHandler value);
  external EventHandler get ontouchcancel;
  external DOMStringMap get dataset;
  external set nonce(String value);
  external String get nonce;
  external set autofocus(bool value);
  external bool get autofocus;
  external set tabIndex(int value);
  external int get tabIndex;
}
