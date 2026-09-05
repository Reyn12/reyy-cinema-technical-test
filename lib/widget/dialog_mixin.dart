import 'package:flutter/material.dart';

import '../helper/dialog_error_helper.dart';
import 'custom_snackbar.dart';
import 'loading_dialog.dart';

mixin DialogMixin {
  bool dialogShown = false;
  bool successHandled = false;
  String? lastErrorMessage;

  void loadingState(BuildContext context) {
    if (dialogShown) return;
    dialogShown = true;
    successHandled = false;
    lastErrorMessage = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LoadingDialog.show(context);
    });
  }

  void successState(
    BuildContext context, {
    void Function()? onSuccess,
  }) {
    if (dialogShown) {
      dialogShown = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        LoadingDialog.hide(context);
        onSuccess?.call();
      });
    } else if (onSuccess != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onSuccess();
      });
    }

    lastErrorMessage = null;
  }

  void errorState(
    BuildContext context, {
    required Object error,
  }) {
    if (dialogShown) {
      dialogShown = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        LoadingDialog.hide(context);
      });
    }

    final parsed = parseDialogError(error);
    final messageKey = '${parsed.title}|${parsed.message}';
    if (lastErrorMessage == messageKey) return;

    lastErrorMessage = messageKey;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CustomSnackbar.error(
        context,
        parsed.message,
        title: parsed.title,
      );
    });
  }
}
