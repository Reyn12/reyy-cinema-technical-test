import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/ticket_detail/bloc/ticket_detail_bloc.dart';
import 'package:reyy_cinema/features/ticket_detail/bloc/ticket_detail_event.dart';
import 'package:reyy_cinema/features/ticket_detail/bloc/ticket_detail_state.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_card.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_maps_button.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_order_summary.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_policy.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class TicketDetailPage extends StatelessWidget {
  const TicketDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TicketDetailBloc(),
      child: const TicketDetailView(),
    );
  }
}

class TicketDetailView extends StatelessWidget {
  const TicketDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
          children: [
            AppHeader(
              title: 'Detail Tiket',
              leading: canPop
                  ? IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    )
                  : null,
            ),
            Expanded(
              child: BlocListener<TicketDetailBloc, TicketDetailState>(
                listenWhen: (previous, current) =>
                    previous.mapsErrorMessage != current.mapsErrorMessage &&
                    current.mapsErrorMessage != null,
                listener: (context, state) {
                  CustomSnackbar.info(context, state.mapsErrorMessage!);
                  context.read<TicketDetailBloc>().add(
                    const TicketDetailMapsErrorCleared(),
                  );
                },
                child: RefreshIndicator(
                  color: AppColors.primaryPressed,
                  onRefresh: () async {
                    await Future<void>.delayed(
                      const Duration(milliseconds: 600),
                    );
                    if (!context.mounted) return;
                    CustomSnackbar.info(context, 'Refresh completed');
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: ClampingScrollPhysics(),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    child: Column(
                      spacing: 16,
                      children: [
                        WTicketDetailCard(
                          image: Assets.images.imgDumyDetailFilm,
                          cinemaBrand: 'XXI',
                          studioLabel: 'Studio 1',
                          formatLabel: 'Reguler 2D',
                          ageRating: 'D-17',
                          duration: '2j 05m',
                          title: 'Black Adam',
                          genres: 'Aksi, Fantasi, Petualangan',
                          cinemaName: 'XXI Solo Square',
                          dateLabel: '14 Okt 2026',
                          timeLabel: '19:30',
                          seatCount: 2,
                          seatsLabel: 'D5, D6',
                          bookingCode: 'BK-XXI-98421099',
                          qrImage: Assets.images.imgDummyQr,
                          onTapCopyBookingCode: () async {
                            await Clipboard.setData(
                              const ClipboardData(text: 'BK-XXI-98421099'),
                            );
                            if (!context.mounted) return;
                            CustomSnackbar.info(
                              context,
                              'Kode booking disalin',
                            );
                          },
                        ),
                        const WTicketDetailOrderSummary(
                          orderNumber: '#CR-20261014-8831',
                          customerName: 'Muhammad Renaldi M.',
                          paymentMethod: 'QRIS / GoPay',
                          transactionTime: '12 Okt 2026, 14:20 WIB',
                          ticketCount: 2,
                          totalPayment: 93000,
                        ),
                        const WTicketDetailPolicy(
                          items: [
                            TicketDetailPolicyItem(
                              title: 'Lokasi Studio 1',
                              description:
                                  'Lantai 3 Solo Square Mall, sayap barat dekat area F&B XXI.',
                              icon: Icons.meeting_room_outlined,
                            ),
                            TicketDetailPolicyItem(
                              title: 'Hadir Lebih Awal',
                              description:
                                  'Pintu studio dibuka 15 menit sebelum waktu pemutaran (19:15 WIB).',
                              icon: Icons.access_time_rounded,
                            ),
                            TicketDetailPolicyItem(
                              title: 'Larangan Merekam',
                              description:
                                  'Dilarang keras mengambil video atau gambar selama pemutaran film berlangsung.',
                              icon: Icons.no_photography_outlined,
                            ),
                          ],
                        ),
                        WTicketDetailMapsButton(
                          onTap: () => context.read<TicketDetailBloc>().add(
                            const TicketDetailOpenMapsRequested(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
