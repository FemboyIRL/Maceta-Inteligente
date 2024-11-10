import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:maceta_inteligente/dialogs/change_configurations_dialog/state.dart';
import 'package:maceta_inteligente/utilities/methods/dialogs_methods.dart';

class ChangePotConfigsDialog extends StatelessWidget {
  const ChangePotConfigsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePotConfigsDialogState>(
        init: ChangePotConfigsDialogState(),
        builder: (state) => WillPopScope(
            child: AlertDialog(
              
            ),
            onWillPop: () async =>
                await DialogsMethods.dialogAskCloseWindow(context)));
  }
}
