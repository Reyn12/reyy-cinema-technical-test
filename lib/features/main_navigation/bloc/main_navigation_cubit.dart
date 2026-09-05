import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationCubit extends Cubit<int> {
  MainNavigationCubit() : super(0);

  void changePage(int index) => emit(index);

  void goToHome() => changePage(0);

  void goToBioskop() => changePage(1);

  void goToNotifikasi() => changePage(2);

  void goToProfil() => changePage(3);
}
