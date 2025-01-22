import "package:flutter/material.dart";
import "../themes.dart";

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs;
  final bool showTitle;
  final List<Widget>? secondaryTabContents;

  const TopBar(this.tabs,
      {super.key, this.showTitle = true, this.secondaryTabContents});

  @override
  Widget build(BuildContext context) {
    if (showTitle) {
      // If showTitle is true, return the AppBar with the title "Olaf"
      return AppBar(
        title: Row(
          children: [
            Text(
              "<",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(width: 16),
            Text(
              "Olaf",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        backgroundColor: gray,
        elevation: 0,
        bottom: TabBar(
          labelColor: black,
          indicatorColor: brightBlue,
          labelStyle: Theme.of(context).textTheme.titleLarge,
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
        ),
      );
    } else {
      // If showTitle is false, return the DefaultTabController with the secondaryTabContents
      return DefaultTabController(
        length: tabs.length,
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(0, 0.0),
              child: TabBar(
                isScrollable: true,
                labelColor: black,
                indicatorColor: brightBlue,
                labelStyle: Theme.of(context).textTheme.titleLarge,
                labelPadding: EdgeInsets.symmetric(horizontal: 18.0),
                tabs: tabs.map((tab) => Tab(text: tab)).toList(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: TabBarView(
                children: secondaryTabContents!.map((content) {
                  return SingleChildScrollView(
                    child: content,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(100);
  }
}
