// Copyright (c) 2015, Alexandre Ardhuin. All rights reserved. Use of this
// source code is governed by a BSD-style license that can be found in the
// LICENSE file.

library xml_rpc.src.common;

import 'package:crypto/crypto.dart' show CryptoUtils;

class Fault {
  final int code;
  final String text;

  Fault(this.code, this.text);
}

class Base64Value {
  String _base64String;
  List<int> _bytes;

  Base64Value(this._bytes);
  Base64Value.fromBase64String(this._base64String);

  String get base64String {
    if (_base64String == null) {
      _base64String = CryptoUtils.bytesToBase64(_bytes);
    }
    return _base64String;
  }

  List<int> get bytes {
    if (_bytes == null) {
      _bytes = CryptoUtils.base64StringToBytes(_base64String);
    }
    return _bytes;
  }
}