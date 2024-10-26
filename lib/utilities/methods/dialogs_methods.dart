import 'package:flutter/material.dart';

abstract class DialogsMethods {
  static Future<dynamic> dialogInformSomething(final BuildContext context,
      {final String? title,
      final String? content,
      final bool haveOkButton = true,
      final bool haveCancelButton = false,
      final Duration? closeOn,
      final List<FunctionWithName> moreActions = const []}) async {
    return await showDialog(
        context: context,
        builder: (dialogContext) {
          void closeDialog({final dynamic data}) {
            if (!Navigator.of(dialogContext).mounted) return;
            Navigator.of(dialogContext).maybePop(data);
          }

          if (closeOn != null) {
            Future.delayed(closeOn, closeDialog);
          }

          return AlertDialog(
              title: (title != null) ? Text(title.trim()) : null,
              content: (content != null) ? Text(content.trim()) : null,
              actions: [
                ...moreActions.map((function) => TextButton(
                    onPressed: () async {
                      dynamic result;
                      try {
                        result = await function.function();
                      } catch (error) {
                        result = Exception(error.toString());
                      }
                      if (context.mounted) Navigator.of(context).pop(result);
                    },
                    child: Text(function.name,
                        style: TextStyle(color: function.textColor)))),
                if (haveCancelButton)
                  TextButton(
                      onPressed: closeDialog,
                      child: Text("Cancelar",
                          style: const TextStyle(color: Colors.red))),
                if (haveOkButton)
                  TextButton(
                      onPressed: closeDialog, child: const Text("Informado"))
              ]);
        });
  }

  static Future<void> dialogSomeErrorOccurred(final BuildContext context,
      {final String? title, final String? content}) async {
    return await dialogInformSomething(context,
        title: title, content: content?.trim());
  }

  static Future<bool> dialogAskCloseWindow(final BuildContext context,
      {final String? question, final String? content}) async {
    if (!context.mounted || !Navigator.of(context).mounted) return false;

    final close = await dialogConfirmSomething(context,
        title: question ?? "¿Desea salir de esta pantalla?", content: content);

    if (!context.mounted || !Navigator.of(context).mounted) return false;

    return close;
  }

  static Future<void> dialogCloseWindow(final BuildContext context,
      {required final bool didPop,
      final String? question,
      final String? content}) async {
    if (didPop) return;
    if (!context.mounted || !Navigator.of(context).mounted) return;

    final close = await dialogConfirmSomething(context,
        title: question ?? "¿Desea salir de esta pantalla?", content: content);

    if (!context.mounted || !Navigator.of(context).mounted) return;

    if (close) Navigator.of(context).pop();
  }

  static Future<bool> dialogConfirmSomething(final BuildContext context,
      {final String? title,
      final String? content,
      final String? noText,
      final String? yesText}) async {
    return await showDialog<bool>(
            context: context,
            builder: (dialogContext) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: (title != null) ? Text(title.trim()) : null,
                    content: (content != null) ? Text(content.trim()) : null,
                    actions: [
                      TextButton(
                          onPressed: () {
                            if (!dialogContext.mounted) return;
                            Navigator.of(dialogContext).pop(false);
                          },
                          child: Text(noText ?? "No")),
                      TextButton(
                          onPressed: () {
                            if (!dialogContext.mounted) return;
                            Navigator.of(dialogContext).pop(true);
                          },
                          child: Text(yesText ?? "Si",
                              style: const TextStyle(color: Colors.red)))
                    ])) ==
        true;
  }
}

class FunctionWithName {
  final String name;
  final Function function;
  final Color? textColor;

  FunctionWithName(
      {required this.name, required this.function, this.textColor});
}
