// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// To meet GAE needs this file must be called 'server.dart'.

import 'dart:io';

import 'package:services/services_server.dart' as server;
import 'package:logging/logging.dart';

void main(List<String> args) {
  Logger.root.level = Level.ALL;
  var file = new File('dartservices.log');
  var sink = file.openWrite(mode: FileMode.APPEND);
  Logger.root.onRecord.listen((LogRecord rec) {
    sink.write('${rec.time}: (${rec.level.name}) ${rec.message}\n');
  });

  sink.write(' --- DART SERVICES STARTED AT ${new DateTime.now().toIso8601String()} ---\n');
  server.main(args);
}
