class SettingSource {
  bool _useNavBar = true;
  Future<bool> loadUseNavBar() async {
    return _useNavBar;
  }

  Future<void> saveUseNavBar(bool useNavBar) async {
    _useNavBar = useNavBar;
  }
}
