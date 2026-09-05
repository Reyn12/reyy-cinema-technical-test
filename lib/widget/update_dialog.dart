import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class UpdateDialog extends StatefulWidget {
  final String? message;
  final String? currentVersion;
  final String? latestVersion;
  final List<String> whatsNew;

  const UpdateDialog({
    super.key,
    this.message,
    this.currentVersion,
    this.latestVersion,
    this.whatsNew = const [],
  });

  /// Return `true` kalau user skip.
  static Future<bool> show(
    BuildContext context, {
    String? message,
    String? currentVersion,
    String? latestVersion,
    List<String> whatsNew = const [],
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => UpdateDialog(
        message: message,
        currentVersion: currentVersion,
        latestVersion: latestVersion,
        whatsNew: whatsNew,
      ),
    );
    return result ?? false;
  }

  @override
  State<UpdateDialog> createState() => UpdateDialogState();
}

class UpdateDialogState extends State<UpdateDialog> {
  static const String defaultMessage =
      'Versi aplikasi yang kamu gunakan sudah tidak didukung. Silakan update ke versi terbaru.';
  static const double whatsNewMaxHeight = 170;

  final ScrollController whatsNewScrollController = ScrollController();

  @override
  void dispose() {
    whatsNewScrollController.dispose();
    super.dispose();
  }

  void onSkip() {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.primarySurfaceAlt,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.system_update_alt_rounded,
                  size: 36,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Update Tersedia',
                style: AppTypography.h8Bold.copyWith(
                  fontSize: 22,
                  color: AppColors.neutral100,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                widget.message ?? defaultMessage,
                style: AppTypography.bodyRegularS.copyWith(
                  color: AppColors.textColor70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              if (widget.currentVersion != null ||
                  widget.latestVersion != null ||
                  widget.whatsNew.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.latestVersion != null)
                        buildInfoRow(
                          icon: Icons.smartphone_outlined,
                          label: 'Versi Terbaru',
                          value: widget.latestVersion!,
                          valueColor: AppColors.primary,
                        ),
                      if (widget.currentVersion != null) ...[
                        const SizedBox(height: 12),
                        buildInfoRow(
                          icon: Icons.sell_outlined,
                          label: 'Versi Sekarang',
                          value: widget.currentVersion!,
                        ),
                      ],
                      if (widget.whatsNew.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.format_list_bulleted,
                              size: 18,
                              color: AppColors.textColor50,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yang Baru',
                                    style: AppTypography.bodyRegularS.copyWith(
                                      color: AppColors.textColor70,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxHeight: whatsNewMaxHeight,
                                    ),
                                    child: Scrollbar(
                                      controller: whatsNewScrollController,
                                      thumbVisibility: true,
                                      trackVisibility: true,
                                      child: SingleChildScrollView(
                                        controller: whatsNewScrollController,
                                        padding: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: widget.whatsNew
                                              .map(
                                                (item) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        bottom: 4,
                                                      ),
                                                  child: Text(
                                                    '•  $item',
                                                    style: AppTypography
                                                        .bodySemiboldS
                                                        .copyWith(
                                                          color: AppColors
                                                              .neutral100,
                                                        ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: onSkip,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Skip Update',
                    style: AppTypography.bodySemiboldM.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textColor50),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: AppTypography.bodyRegularS.copyWith(
              color: AppColors.textColor70,
            ),
          ),
        ),
        Text(
          value,
          style: AppTypography.bodySemiboldS.copyWith(
            color: valueColor ?? AppColors.neutral100,
          ),
        ),
      ],
    );
  }
}
