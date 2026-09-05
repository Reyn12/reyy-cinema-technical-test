import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_background_header.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_greetings.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_header.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_latest_bill_card.dart';
import 'package:reyy_cinema/routes/app_paths.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          children: [
            WHomeHeader(
              isNotificationActive: true,
              onTapDetailNotification: () {
                context.push(AppPaths.notification);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                WHomeBackgroundHeader(),
                                WHomeGreetings(nameParent: 'Parent Reyy'),
                              ],
                            ),
                            const SizedBox(height: 70),
                          ],
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          // TODO(bloc): ganti hardcode ini dengan data asli
                          child: WHomeLatestBillCard(
                            title: 'Tiket Bioskop - Reyy Cinema',
                            amount: 150000,
                            onTapPayNow: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Center(child: Text('Homepage Content')),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
