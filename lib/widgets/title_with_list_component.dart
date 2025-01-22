import 'package:flutter/material.dart';
import '../themes.dart';

class SelectableItem {
  String text;
  bool isSelected;

  SelectableItem({
    required this.text,
    this.isSelected = false,
  });
}

class SelectableList extends StatefulWidget {
  final String title;
  final List<SelectableItem> items;
  final bool boxShadowEnabled;

  const SelectableList({
    super.key,
    required this.title,
    required this.items,
    required this.boxShadowEnabled,
  });

  @override
  SelectableListState createState() => SelectableListState();
}

class SelectableListState extends State<SelectableList> {
  late List<SelectableItem> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
         boxShadow: widget.boxShadowEnabled
            ? defaultBoxShadow : []),
      padding: paddingInRecordingAlert,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: appTheme.textTheme.titleMedium?.copyWith(color: darkGray),
          ),
          const SizedBox(height: 8),
          Column(
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              return Row(
                children: [
                  Icon(
                    item.isSelected
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    size: 16,
                    color: brightBlue,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.text,
                      style:
                          appTheme.textTheme.bodyMedium?.copyWith(color: black),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
