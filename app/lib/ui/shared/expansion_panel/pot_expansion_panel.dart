import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class POTExpansionPanel extends StatefulWidget {
  final double headerHeight;
  final double bodyHeight;
  final Widget headerChild;
  final Widget bodyChild;
  const POTExpansionPanel(
      {Key? key,
      required this.headerHeight,
      required this.bodyHeight,
      required this.headerChild,
      required this.bodyChild})
      : super(key: key);

  @override
  State<POTExpansionPanel> createState() => _POTExpansionPanelState();
}

class _POTExpansionPanelState extends State<POTExpansionPanel> {
  double _currentBodyHeight = 0.0;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: POTGradients.defaultGradient,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: widget.headerHeight,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: [
                  Expanded(child: widget.headerChild),
                  GestureDetector(
                    onTap: () => setState(() => _isExpanded = !_isExpanded),
                    child: Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: POTColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            const Divider(
              color: POTColors.white,
              thickness: 1.0,
            ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _isExpanded ? widget.bodyHeight : _currentBodyHeight,
            child: _isExpanded ? widget.bodyChild: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
