import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/PresentationWizardScreen/state.dart';
import 'package:maceta_inteligente/utilities/methods/colors_methods.dart';
import 'package:maceta_inteligente/widgets/presentation_wizard_item_widget.dart';


class PresentationWizardScreen extends StatelessWidget {
  const PresentationWizardScreen({super.key});

  Widget _pageViewWidget(final PresentationWizardState state) {
    return AspectRatio(
        aspectRatio: 1,
        child: PageView.builder(
            controller: state.pageViewController,
            onPageChanged: state.onPageChanged,
            itemCount: state.pages.length,
            itemBuilder: (context, index) {
              final pageContent = state.pages[index];
              return PresentationWizardItemWidget(pageContent: pageContent);
            }));
  }

  Widget _navigationWidget(
      final BuildContext context, final PresentationWizardState state) {
    final backgroundColor = Theme.of(context).colorScheme.surface;
    final contentColor =
        ColorsMethods.getItemsColorByBackground(backgroundColor);
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder<int>(
              valueListenable: state.pageIndexNotifier,
              builder: (context, value, child) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                            height: 50,
                            child: PageViewIndicator(
                                length: state.pages.length,
                                currentIndex: value,
                                currentColor: Colors.black,
                                otherColor: Colors.grey,
                                currentSize: 16,
                                otherSize: 13)),
                        Center(
                            child: ElevatedButton(
                                onPressed: () => state.onTapNext(context),
                                child: Text((state.imInLastPage())
                                    ? "Finalizar"
                                    : "Siguiente")))
                      ])),
          const SizedBox(height: 10),
          Center(
              child: Card(
                  color: backgroundColor,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text("Entrar",
                          style: TextStyle(
                              color: contentColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)))))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PresentationWizardState>(
        init: PresentationWizardState(),
        builder: (state) => Scaffold(
                body: SafeArea(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        _pageViewWidget(state),
                        Expanded(child: _navigationWidget(context, state))
                      ])),
                ]))));
  }
}