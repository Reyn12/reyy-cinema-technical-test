import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/bioskop/bloc/bioskop_bloc.dart';
import 'package:reyy_cinema/features/bioskop/bloc/bioskop_event.dart';
import 'package:reyy_cinema/features/bioskop/bloc/bioskop_state.dart';
import 'package:reyy_cinema/features/bioskop/models/cinema_model.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_cinema_info_card.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_map.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_select_cinema_bottom_sheet.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_selected_cinema.dart';
import 'package:reyy_cinema/widget/bottom_sheet_helper.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class WBioskopCinemaSection extends StatelessWidget {
  const WBioskopCinemaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BioskopBloc, BioskopState>(
      listenWhen: (prev, curr) =>
          prev.cinemaPickerTicket != curr.cinemaPickerTicket,
      listener: (context, state) async {
        final result = await BottomSheetHelper.showBar<CinemaModel>(
          context,
          builder: (_) => WBioskopSelectCinemaBottomSheet(
            selectedCinemaName: state.cinema.name,
          ),
        );

        if (result == null || !context.mounted) return;
        context.read<BioskopBloc>().add(BioskopCinemaSelected(result));
      },
      child: BlocBuilder<BioskopBloc, BioskopState>(
        buildWhen: (prev, curr) => prev.selectedCinema != curr.selectedCinema,
        builder: (context, state) {
          final cinema = state.cinema;

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              spacing: 16,
              children: [
                WBioskopSelectedCinema(
                  cinemaName: cinema.name,
                  onTapOpenBottomSheetCinema: () {
                    context.read<BioskopBloc>().add(
                      const BioskopSelectCinemaRequested(),
                    );
                  },
                ),
                SizedBox(
                  height: 360,
                  child: WBioskopMap(
                    key: ValueKey(cinema.name),
                    cinemaName: cinema.name,
                    destination: cinema.location,
                  ),
                ),
                WBioskopCinemaInfoCard(
                  cinemaName: cinema.name,
                  statusLabel: 'Buka',
                  openHours: '10.00 - 22.30',
                  distanceLabel: cinema.distanceLabel,
                  durationLabel: '12 menit berkendara',
                  onTapBookmark: () {
                    CustomSnackbar.info(
                      context,
                      'Fitur Bookmark Bioskop belum tersedia',
                    );
                  },
                  onTapStartNavigation: () {
                    CustomSnackbar.info(
                      context,
                      'Fitur Mulai Navigasi belum tersedia',
                    );
                  },
                  onTapSeeSchedule: () {
                    CustomSnackbar.info(
                      context,
                      'Fitur Lihat Jadwal belum tersedia',
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
