/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:http/http.dart';

import 'src/httpp_client.dart';
import 'src/httpp_manager.dart';
import 'src/httpp_response.dart';

export 'src/httpp_body.dart';
export 'src/httpp_client.dart';
export 'src/httpp_headers.dart';
export 'src/httpp_request.dart';
export 'src/httpp_response.dart';
export 'src/httpp_utils.dart';
export 'src/httpp_verb.dart';

class Httpp {
  final Client Function()? _useClient;
  final HttppManager _manager;

  Httpp({Client Function()? useClient, int? requestLimit})
      : this._useClient = useClient,
        this._manager = HttppManager(requestLimit: requestLimit);

  HttppClient client({
    void Function()? onFinish,
    Duration Function(HttppResponse)? tooManyReqDelay,
    Future<String> Function(HttppResponse)? refreshAuth,
  }) =>
      HttppClient(
          manager: _manager,
          onFinish: onFinish,
          useClient: _useClient,
          tooManyReqDelay: tooManyReqDelay,
          refreshAuth: refreshAuth);
}
