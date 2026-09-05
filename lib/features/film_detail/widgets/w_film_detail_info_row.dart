import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_info_card.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WFilmDetailInfoRow extends StatelessWidget {
  const WFilmDetailInfoRow({
    super.key,
    required this.director,
    required this.writer,
    required this.status,
  });

  final String director;
  final String writer;
  final String status;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          Expanded(
            child: WFilmDetailInfoCard(label: 'Sutradara', value: director),
          ),
          Expanded(
            child: WFilmDetailInfoCard(label: 'Penulis', value: writer),
          ),
          Expanded(
            child: WFilmDetailInfoCard(
              label: 'Status',
              value: status,
              valueColor: AppColors.primaryDeep,
            ),
          ),
        ],
      ),
    );
  }
}
