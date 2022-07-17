import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options.connectTimeout = 18000;
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}
