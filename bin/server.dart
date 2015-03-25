// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// To meet GAE needs this file must be called 'server.dart'.

import 'package:services/services_server.dart' as server;
import 'package:logging/logging.dart';

void main(List<String> args) {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  server.main(args);
}
