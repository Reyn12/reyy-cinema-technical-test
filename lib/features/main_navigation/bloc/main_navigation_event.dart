sealed class MainNavigationEvent {
  const MainNavigationEvent();
}

class MainNavigationPageChanged extends MainNavigationEvent {
  const MainNavigationPageChanged(this.index);

  final int index;
}
