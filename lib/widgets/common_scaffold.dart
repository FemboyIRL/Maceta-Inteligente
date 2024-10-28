import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maceta_inteligente/utilities/assets/assets_resources.dart';
import 'package:maceta_inteligente/widgets/contrast_brand_widget.dart';
import 'package:maceta_inteligente/widgets/simple_app_icon_widget.dart';
import 'package:maceta_inteligente/widgets/social_media_widget.dart';

class CommonScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Future<void> Function()? onRefresh;
  final void Function()? onTapFloatingButton;
  final List<Widget>? appbarActions;
  final List<Widget> sliversChildren;
  final bool showFloatingButton;
  final Widget? endDrawer;

  const CommonScaffold(
      {super.key,
      this.scaffoldKey,
      this.onRefresh,
      this.appbarActions,
      required this.sliversChildren,
      this.showFloatingButton = false,
      this.onTapFloatingButton,
      this.endDrawer});

  static final socialMedia = <SocialMediaModel>[
    SocialMediaModel(
        child: SvgPicture.asset(AssetsResources.facebookIconSvg,
            height: 20,
            width: 20,
            colorFilter:
                const ColorFilter.mode(Colors.black, BlendMode.srcIn))),
    SocialMediaModel(
        child: SvgPicture.asset(AssetsResources.instagramIconSvg,
            height: 20,
            width: 20,
            colorFilter:
                const ColorFilter.mode(Colors.black, BlendMode.srcIn))),
    SocialMediaModel(
        child: SvgPicture.asset(AssetsResources.twitterIconSvg,
            height: 20,
            width: 20,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn)))
  ];

  AppBar _appBar() {
    return AppBar(
        title: SizedBox(
            width: 130,
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Image.asset(AssetsResources.brandIcon, width: 40),
              const SizedBox(width: 5),
              const Expanded(
                  child: Text('App para la gestion de GrowSmart',
                      maxLines: 2, style: TextStyle(fontSize: 11)))
            ])),
        actions: appbarActions,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1), child: Divider(height: 0)));
  }

  Widget _socialMediaWidget() {
    return Wrap(
        spacing: 5,
        runSpacing: 5,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: socialMedia
            .map((item) => SocialMediaWidget(socialMedia: item))
            .toList());
  }

  Widget _pageContent() {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(child: SimpleAppIconWidget()),
      ...sliversChildren,
      const SliverToBoxAdapter(child: SizedBox(height: 50)),
      SliverPadding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          sliver: SliverToBoxAdapter(child: _socialMediaWidget())),
      const SliverToBoxAdapter(child: ContrastBrandWidget())
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(),
      endDrawer: endDrawer,
      body: SafeArea(
        child: Scrollbar(
          child: (onRefresh != null)
              ? RefreshIndicator(onRefresh: onRefresh!, child: _pageContent())
              : _pageContent(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: showFloatingButton
          ? FloatingActionButton(
              onPressed: () => onTapFloatingButton,
              backgroundColor: Colors.transparent,
              child: const Icon(Icons.settings,color: Colors.white,),
            )
          : const SizedBox(),
    );
  }
}
