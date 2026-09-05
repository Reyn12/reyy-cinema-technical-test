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
    // Near Gama Tower
    CinemaModel(
      name: 'XXI Epicentrum Kuningan',
      address: 'Epicentrum Walk, Kuningan, Jakarta',
      distanceLabel: '0.6 km',
      location: LatLng(-6.221340, 106.836900),
    ),
    CinemaModel(
      name: 'CGV FX Sudirman',
      address: 'FX Sudirman, Jakarta',
      distanceLabel: '1.1 km',
      location: LatLng(-6.227500, 106.830200),
    ),
    CinemaModel(
      name: 'Cinépolis Kota Kasablanka',
      address: 'Kota Kasablanka, Jakarta',
      distanceLabel: '1.4 km',
      location: LatLng(-6.224800, 106.841300),
    ),
    CinemaModel(
      name: 'XXI Plaza Senayan',
      address: 'Plaza Senayan, Jakarta',
      distanceLabel: '1.8 km',
      location: LatLng(-6.218900, 106.829700),
    ),
    CinemaModel(
      name: 'CGV Rasuna Epicentrum',
      address: 'Rasuna Epicentrum, Jakarta',
      distanceLabel: '2.1 km',
      location: LatLng(-6.230100, 106.837800),
    ),
    CinemaModel(
      name: 'Cinépolis Setiabudi One',
      address: 'Setiabudi One, Jakarta',
      distanceLabel: '2.5 km',
      location: LatLng(-6.219600, 106.840500),
    ),
    CinemaModel(
      name: 'XXI Kuningan City',
      address: 'Kuningan City, Jakarta',
      distanceLabel: '2.9 km',
      location: LatLng(-6.233200, 106.831900),
    ),
    CinemaModel(
      name: 'CGV Kota Kasablanka',
      address: 'Kota Kasablanka, Jakarta',
      distanceLabel: '3.2 km',
      location: LatLng(-6.222700, 106.827400),
    ),
    CinemaModel(
      name: 'Cinépolis Mega Kuningan',
      address: 'Mega Kuningan, Jakarta',
      distanceLabel: '3.6 km',
      location: LatLng(-6.216500, 106.838100),
    ),
    CinemaModel(
      name: 'XXI Ambassador Mall',
      address: 'Ambassador Mall, Jakarta',
      distanceLabel: '4.0 km',
      location: LatLng(-6.235800, 106.834600),
    ),

    // Bandung Pride
    CinemaModel(
      name: 'XXI Grand Banjar',
      address: 'Grand Banjar, Banjar',
      distanceLabel: '0.8 km',
      location: LatLng(-6.884521, 107.615230),
    ),
    CinemaModel(
      name: 'CGV Banjar City Mall',
      address: 'Banjar City Mall, Banjar',
      distanceLabel: '1.2 km',
      location: LatLng(-6.890340, 107.621450),
    ),
    CinemaModel(
      name: 'Cinépolis Banjar Square',
      address: 'Banjar Square, Banjar',
      distanceLabel: '1.5 km',
      location: LatLng(-6.881900, 107.612800),
    ),
    CinemaModel(
      name: 'XXI Plaza Banjar',
      address: 'Plaza Banjar, Banjar',
      distanceLabel: '1.9 km',
      location: LatLng(-6.892750, 107.616900),
    ),
    CinemaModel(
      name: 'CGV Banjar Central',
      address: 'Banjar Central, Banjar',
      distanceLabel: '2.3 km',
      location: LatLng(-6.885600, 107.624100),
    ),
    CinemaModel(
      name: 'Cinépolis Rasuna Banjar',
      address: 'Rasuna Banjar, Banjar',
      distanceLabel: '2.6 km',
      location: LatLng(-6.878900, 107.619500),
    ),
    CinemaModel(
      name: 'XXI Solo Banjar Park',
      address: 'Solo Banjar Park, Banjar',
      distanceLabel: '3.0 km',
      location: LatLng(-6.895100, 107.613700),
    ),
    CinemaModel(
      name: 'CGV Banjar Kota',
      address: 'Banjar Kota, Banjar',
      distanceLabel: '3.4 km',
      location: LatLng(-6.883200, 107.627300),
    ),
    CinemaModel(
      name: 'Cinépolis Sunrise Mall',
      address: 'Sunrise Mall, Banjar',
      distanceLabel: '3.8 km',
      location: LatLng(-6.889700, 107.609800),
    ),
    CinemaModel(
      name: 'XXI Metropolitan Banjar',
      address: 'Metropolitan Banjar, Banjar',
      distanceLabel: '4.2 km',
      location: LatLng(-6.876400, 107.622600),
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
