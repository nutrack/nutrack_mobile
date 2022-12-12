import 'package:flutter/material.dart';
import 'package:nutrack_mobile/data/drawer_items_unauth.dart';
// import 'package:nutrack_mobile/main.dart';
import 'package:nutrack_mobile/model/model_drawer.dart';
import 'package:nutrack_mobile/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'package:nutrack_mobile/provider/net_service.dart';
import 'package:testimonies/screens/about_us.dart';
import 'package:testimonies/screens/testimonies.dart';

class NutrackUnAuthDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NutrackUnAuthDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    final provider = Provider.of<NetworkService>(context);
    final isCollapsed = provider.isCollapsed;

    return SizedBox(
      //Replaced it with SizedBox, previously Container
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        child: Container(
          color: Colors.white70,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24).add(safeArea),
                width: double.infinity,
                color: Colors.orange,
                child: buildHeader(isCollapsed),
              ),
              const SizedBox(height: 24),
              buildList(items: itemsFirst, isCollapsed: isCollapsed),
              const Spacer(),
              buildCollapseIcon(context, isCollapsed),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList({
    required bool isCollapsed,
    required List<NutrackDrawerItem> items,
    int indexOffset = 0,
  }) =>
      ListView.separated(
        padding: isCollapsed ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectItem(context, indexOffset + index),
          );
        },
      );

  void selectItem(BuildContext context, int index) {
    navigateTo(page) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));

    Navigator.of(context).pop();

    switch (index) {
      case 0:
        navigateTo(const MyHomePage());
        break;
      case 1:
        navigateTo(const MyHomePage());
        break;
      case 2:
        navigateTo(const MyHomePage());
        break;
      case 3:
        navigateTo(const AboutUsPage());
        break;
      case 4:
        navigateTo(const TestimonyPage());
        break;
    }
  }

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    final leading = Icon(icon, color: color);

    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Text(text,
                  style: const TextStyle(color: color, fontSize: 16)),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    const double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : const EdgeInsets.only(right: 16);
    final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: SizedBox(
            //Replaced it with SizedBox, previously Container
            width: width,
            height: size,
            child: Icon(icon, color: Colors.black),
          ),
          onTap: () {
            final provider =
                Provider.of<NetworkService>(context, listen: false);

            provider.toggleIsCollapsed();
          },
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) => isCollapsed
      ? Image.asset('assets/images/ic_launcher.png', height: 30)
      : Row(
          children: [
            const SizedBox(width: 24),
            Image.asset('assets/images/ic_launcher.png', height: 30),
            const SizedBox(width: 16),
            const Text(
              'Nutrack',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ],
        );
}
