// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library gaeDeployed_test;

import 'package:unittest/unittest.dart';
import 'package:http/http.dart' as http;
import 'package:dartpad_server/src/common.dart' as common;

final String serverUrl = "https://liftoff-dev.appspot.com";

void main() => defineTests();

void defineTests() {
  group('gae deployed tests', () {
    test('analyze end point', analyzeTest);
    test('compile end point', compileTest);
  });
}


analyzeTest() {
  final String url = '${serverUrl}/api/analyze';
  Map headers = {'Content-Type': 'text/plain; charset=UTF-8'};

  expect(
    http.post(url, headers: headers, body: common.sampleCodeWeb).then((response) {
      expect(response.statusCode, 200);
      expect(response.body.trim(), "[]");
      return true;
  }), completion(equals(true)));
}

compileTest() {
  final String url = '${serverUrl}/api/compile';
  Map headers = {'Content-Type': 'text/plain; charset=UTF-8'};

  expect(
    http.post(url, headers: headers, body: common.sampleCodeWeb).then((response) {
      expect(response.statusCode, 200);
      expect(true, response.body.length > 100);
      return true;
  }), completion(equals(true)));
}
