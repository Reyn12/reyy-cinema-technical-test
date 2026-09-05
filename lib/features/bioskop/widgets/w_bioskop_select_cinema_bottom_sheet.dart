import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:latlong2/latlong.dart';
import 'package:reyy_cinema/features/bioskop/models/cinema_model.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_cinema_list_item.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/custom_text_field.dart';

class WBioskopSelectCinemaBottomSheet extends StatefulWidget {
  const WBioskopSelectCinemaBottomSheet({
    super.key,
    required this.selectedCinemaName,
  });

  final String selectedCinemaName;

  static const cinemas = [
    CinemaModel(
      name: 'XXI Solo Square',
      address: 'Jl. Slamet Riyadi No.451, Solo',
      distanceLabel: '1.8 km',
      location: LatLng(-6.915030539127153, 107.5975680814174),
    ),
    CinemaModel(
      name: 'CGV Solo Paragon',
      address: 'Jl. Dr. Sutomo No.8, Solo',
      distanceLabel: '2.4 km',
      location: LatLng(-6.9205, 107.6101),
    ),
    CinemaModel(
      name: 'XXI Hartono Mall',
      address: 'Jl. Ring Road Utara, Yogyakarta',
      distanceLabel: '3.1 km',
      location: LatLng(-7.7595, 110.4089),
    ),
    CinemaModel(
      name: 'Cinema XXI The Park',
      address: 'Jl. Ir. Soekarno, Solo Baru',
      distanceLabel: '4.6 km',
      location: LatLng(-7.5598, 110.8205),
    ),
    CinemaModel(
      name: 'CGV Transmart Solo',
      address: 'Jl. Ahmad Yani No.234, Solo',
      distanceLabel: '5.2 km',
      location: LatLng(-6.9288, 110.4203),
    ),
  ];

  @override
  State<WBioskopSelectCinemaBottomSheet> createState() =>
      _WBioskopSelectCinemaBottomSheetState();
}

class _WBioskopSelectCinemaBottomSheetState
    extends State<WBioskopSelectCinemaBottomSheet> {
  final formKey = GlobalKey<FormBuilderState>();
  final searchController = TextEditingController();
  String searchQuery = '';
  late String selectedCinemaName;
  bool isSelecting = false;

  @override
  void initState() {
    super.initState();
    selectedCinemaName = widget.selectedCinemaName;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void clearSearch() {
    searchController.clear();
    formKey.currentState?.fields['search_cinema']?.didChange('');
    setState(() => searchQuery = '');
  }

  List<CinemaModel> get filteredCinemas {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) return WBioskopSelectCinemaBottomSheet.cinemas;

    return WBioskopSelectCinemaBottomSheet.cinemas.where((cinema) {
      return cinema.name.toLowerCase().contains(query) ||
          cinema.address.toLowerCase().contains(query);
    }).toList();
  }

  Future<void> onCinemaSelected(CinemaModel cinema) async {
    if (isSelecting) return;

    setState(() {
      isSelecting = true;
      selectedCinemaName = cinema.name;
    });

    await Future<void>.delayed(const Duration(milliseconds: 100));
    if (!mounted) return;
    Navigator.of(context).pop(cinema);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: bottomInset + 24,
      ),
      child: FormBuilder(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Center(
              child: Text(
                'Pilih Bioskop Favorit Kamu',
                style: AppTypography.h8Bold.copyWith(
                  color: AppColors.neutral100,
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextField.search(
              name: 'search_cinema',
              hint: 'Cari bioskop...',
              controller: searchController,
              onChanged: (value) {
                setState(() => searchQuery = value ?? '');
              },
              suffixIcon: searchQuery.isNotEmpty
                  ? IconButton(
                      onPressed: clearSearch,
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 20,
                        color: AppColors.textColor50,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.45,
              ),
              child: filteredCinemas.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Center(
                        child: Text(
                          'Bioskop tidak ditemukan',
                          style: AppTypography.bodyRegularM.copyWith(
                            color: AppColors.textColor50,
                          ),
                        ),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: filteredCinemas.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 4),
                      itemBuilder: (context, index) {
                        final cinema = filteredCinemas[index];
                        return WBioskopCinemaListItem(
                          cinema: cinema,
                          isSelected: cinema.name == selectedCinemaName,
                          onTap: () => onCinemaSelected(cinema),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
