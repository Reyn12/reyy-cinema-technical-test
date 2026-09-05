import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/faq/models/faq_model.dart';
import 'package:reyy_cinema/resources/resources.dart';

class FaqItemCard extends StatefulWidget {
  const FaqItemCard({
    super.key,
    required this.item,
    this.initiallyExpanded = false,
  });

  final FaqItemModel item;
  final bool initiallyExpanded;

  @override
  State<FaqItemCard> createState() => FaqItemCardState();
}

class FaqItemCardState extends State<FaqItemCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.neutral10,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: _toggleExpanded,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: Text(
                      widget.item.question.toString(),
                      style: AppTypography.bodySemiboldM.copyWith(
                        color: AppColors.neutral100,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.25 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 24,
                      color: AppColors.neutral80,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            clipBehavior: Clip.hardEdge,
            child: _isExpanded
                ? Column(
                    spacing: 12,
                    children: [
                      const SizedBox(height: 12),
                      const Divider(color: AppColors.neutral20, height: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.item.answer.toString(),
                          style: AppTypography.bodyRegularS.copyWith(
                            color: AppColors.neutral90,
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
