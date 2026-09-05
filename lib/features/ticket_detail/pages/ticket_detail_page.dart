import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_section_retry.dart';
import 'package:reyy_cinema/features/ticket_detail/bloc/ticket_detail_bloc.dart';
import 'package:reyy_cinema/features/ticket_detail/bloc/ticket_detail_event.dart';
import 'package:reyy_cinema/features/ticket_detail/bloc/ticket_detail_state.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_card.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_card_shimmer.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_maps_button.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_order_summary.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_order_summary_shimmer.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_policy.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_policy_shimmer.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/app_header.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

class TicketDetailPage extends StatelessWidget {
  const TicketDetailPage({super.key, required this.ticketId});

  final String ticketId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TicketDetailBloc(ticketId: ticketId),
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
                    final bloc = context.read<TicketDetailBloc>();
                    bloc.add(const TicketDetailLoadRequested());
                    await bloc.stream.firstWhere((state) => !state.isLoading);
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: ClampingScrollPhysics(),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    child: BlocBuilder<TicketDetailBloc, TicketDetailState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Column(
                            spacing: 16,
                            children: [
                              WTicketDetailCardShimmer(),
                              WTicketDetailOrderSummaryShimmer(),
                              WTicketDetailPolicyShimmer(),
                            ],
                          );
                        }

                        if (state.hasError || state.ticket == null) {
                          return WHomeSectionRetry(
                            message: 'Gagal memuat detail tiket',
                            onRetry: () => context.read<TicketDetailBloc>().add(
                              const TicketDetailLoadRequested(),
                            ),
                          );
                        }

                        final ticket = state.ticket!;
                        return Column(
                          spacing: 16,
                          children: [
                            WTicketDetailCard(
                              image: ticket.image,
                              cinemaBrand: ticket.cinemaBrand,
                              studioLabel: ticket.studioLabel,
                              formatLabel: ticket.formatLabel,
                              ageRating: ticket.ageRating,
                              duration: ticket.duration,
                              title: ticket.title,
                              genres: ticket.genres,
                              cinemaName: ticket.cinemaName,
                              dateLabel: ticket.dateLabel,
                              timeLabel: ticket.timeLabel,
                              seatCount: ticket.seatCount,
                              seatsLabel: ticket.seatsLabel,
                              bookingCode: ticket.bookingCode,
                              qrImage: ticket.qrImage,
                              onTapCopyBookingCode: () async {
                                await Clipboard.setData(
                                  ClipboardData(text: ticket.bookingCode),
                                );
                                if (!context.mounted) return;
                                CustomSnackbar.info(
                                  context,
                                  'Kode booking disalin',
                                );
                              },
                            ),
                            WTicketDetailOrderSummary(
                              orderNumber: ticket.orderNumber,
                              customerName: ticket.customerName,
                              paymentMethod: ticket.paymentMethod,
                              transactionTime: ticket.transactionTime,
                              ticketCount: ticket.ticketCount,
                              totalPayment: ticket.totalPayment,
                              statusLabel: ticket.statusLabel,
                            ),
                            WTicketDetailPolicy(items: ticket.policies),
                            WTicketDetailMapsButton(
                              onTap: () => context.read<TicketDetailBloc>().add(
                                const TicketDetailOpenMapsRequested(),
                              ),
                            ),
                          ],
                        );
                      },
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
