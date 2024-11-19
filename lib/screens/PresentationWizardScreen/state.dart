import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:maceta_inteligente/screens/LoginScreen/screen.dart';
import 'package:maceta_inteligente/utilities/assets/assets_resources.dart';
import 'package:maceta_inteligente/utilities/data_stored/wizard_presentation_data.dart';

class PresentationWizardState extends GetxController {
  final pageViewController = PageController();
  final pageIndexNotifier = ValueNotifier<int>(0);
  final pages = <PresentationWizardPageViewModel>[
    PresentationWizardPageViewModel(
      title: "Bienvenido a GrowSmart",
      contentText:
          "Con GrowSmart, el futuro del cuidado de tus plantas está en tus manos. Nuestra maceta inteligente automatiza el riego y mantenimiento de tus plantas, asegurando que siempre reciban el cuidado que necesitan.",
      child: SvgPicture.asset(AssetsResources.growSmartLogo, color: Colors.white,),
      backgroundChild:
          Image.asset(AssetsResources.homeWithPlants, fit: BoxFit.cover),
    ),
    PresentationWizardPageViewModel(
      title: "¿Por qué es difícil cuidar las plantas?",
      contentText:
          "Muchas personas no tienen tiempo para cuidar de sus plantas o no saben cómo hacerlo correctamente. Las plantas sufren por falta de riego o mantenimiento, pero ahora con GrowSmart, este problema se acaba.",
      child: SvgPicture.asset(AssetsResources.stressedPerson,color: Colors.white,),
      backgroundChild: Image.asset(AssetsResources.dryPlant, fit: BoxFit.cover),
    ),
    PresentationWizardPageViewModel(
      title: "La maceta inteligente que lo cambia todo",
      contentText:
          "Con nuestra tecnología de riego automatizado y sensores inteligentes, tu maceta siempre sabrá cuándo y cuánta agua necesita tu planta, ¡y tú solo tendrás que disfrutar de su crecimiento!",
      child: SvgPicture.asset(AssetsResources.smartPotTechnology, color: Colors.white,),
      backgroundChild:
          Image.asset(AssetsResources.healthyPlants, fit: BoxFit.cover),
    ),
    PresentationWizardPageViewModel(
      title: "Beneficios de GrowSmart",
      contentText:
          "Disfruta de plantas saludables sin esfuerzo. Con GrowSmart, ahorras tiempo, mantienes tus plantas vivas y contribuyes al medio ambiente.",
      child: SvgPicture.asset(AssetsResources.benefitsIcons,color: Colors.white,),
      backgroundChild:
          Image.asset(AssetsResources.flourishingPlant, fit: BoxFit.cover),
    ),
    PresentationWizardPageViewModel(
      title: "¡Es hora de que tus plantas crezcan con tecnología!",
      contentText:
          "Conecta tu maceta inteligente y comienza a disfrutar de tu jardín inteligente hoy mismo. Con GrowSmart, cuidar tus plantas nunca fue tan fácil.",
      child: SvgPicture.asset(color: Colors.white, AssetsResources.appOnPhone,),
      backgroundChild:
          Image.asset(AssetsResources.smartPhoneApp, fit: BoxFit.cover),
    ),
    PresentationWizardPageViewModel(
      title: "¡Comienza a cultivar inteligentemente con GrowSmart!",
      contentText:
          "No dejes que tus plantas se mueran por falta de tiempo. ¡Únete a la revolución de las plantas inteligentes con GrowSmart!",
      child: SvgPicture.asset(AssetsResources.gardenWithSmartPots, color: Colors.white,),
      backgroundChild:
          Image.asset(AssetsResources.greenGarden, fit: BoxFit.cover),
    )
  ];

  bool imInLastPage() => pageIndexNotifier.value >= (pages.length - 1);

  void onPageChanged(final int newIndex) => pageIndexNotifier.value = newIndex;

  void onTapNext(final BuildContext context) async {
    if (imInLastPage()) {
      await WizardPresentationData.setUserHasSeenTheWizard(true);
      if (!context.mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    } else {
      await pageViewController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
    }
  }

  @override
  void onClose() {
    pageViewController.dispose();
    super.onClose();
  }
}

class PresentationWizardPageViewModel {
  final String? title;
  final String contentText;
  final Widget child;
  final Widget? backgroundChild;

  PresentationWizardPageViewModel(
      {required this.title,
      required this.contentText,
      required this.child,
      required this.backgroundChild});
}
