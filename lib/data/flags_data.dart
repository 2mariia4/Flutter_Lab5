class FlagItem {
  final String country;
  final String assetPath;

  const FlagItem({required this.country, required this.assetPath});
}

const List<FlagItem> flags = [
  FlagItem(country: 'Япония', assetPath: 'assets/images/flag_japan.png'),
  FlagItem(country: 'Бразилия', assetPath: 'assets/images/flag_brazil.png'),
  FlagItem(country: 'Канада', assetPath: 'assets/images/flag_canada.png'),
];