import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_item_model.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_legend.dart';
import 'package:reyy_cinema/features/seat_select/widgets/w_seat_select_seat_item.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WSeatSelectMap extends StatelessWidget {
  const WSeatSelectMap({
    super.key,
    required this.rows,
    required this.selectedSeatIds,
    required this.onSeatSelected,
  });

  final List<SeatRowModel> rows;
  final Set<String> selectedSeatIds;
  final ValueChanged<String> onSeatSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        spacing: 16,
        children: [
          Column(
            spacing: 8,
            children: [
              ImageLoad(
                src: Assets.images.imgScreenCinema.path,
                isAsset: true,
                width: double.infinity,
                height: 28,
                fit: BoxFit.contain,
              ),
              Text(
                'LAYAR BIOSKOP / SCREEN',
                style: AppTypography.bodySemiboldXs.copyWith(
                  color: AppColors.textColor50,
                  letterSpacing: 0.6,
                ),
              ),
            ],
          ),
          Column(
            spacing: 8,
            children: [
              for (final row in rows)
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                      child: Text(
                        row.row,
                        textAlign: TextAlign.center,
                        style: AppTypography.bodySemiboldS.copyWith(
                          color: AppColors.textColor50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 6,
                            children: [
                              for (final seat in row.seats.take(4))
                                WSeatSelectSeatItem(
                                  seat: seat,
                                  isSelected: selectedSeatIds.contains(seat.id),
                                  onTap: () => onSeatSelected(seat.id),
                                ),
                            ],
                          ),
                          Row(
                            spacing: 6,
                            children: [
                              for (final seat in row.seats.skip(4))
                                WSeatSelectSeatItem(
                                  seat: seat,
                                  isSelected: selectedSeatIds.contains(seat.id),
                                  onTap: () => onSeatSelected(seat.id),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    SizedBox(
                      width: 16,
                      child: Text(
                        row.row,
                        textAlign: TextAlign.center,
                        style: AppTypography.bodySemiboldS.copyWith(
                          color: AppColors.textColor50,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          const WSeatSelectLegend(),
        ],
      ),
    );
  }
}
