// ignore_for_file: library_private_types_in_public_api

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'custom_snackbar_store.g.dart';

class CustomSnackBarStore = _CustomSnackBarStore with _$CustomSnackBarStore;

abstract class _CustomSnackBarStore with Store {
  @observable
  bool showingSnackbar = false;

  SnackBar showCustomSnackBar(String title, String mensage, ContentType type) {
    showingSnackbar = true;
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: mensage,
        contentType: type,
      ),
    );
  }
}
