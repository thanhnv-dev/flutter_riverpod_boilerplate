enum StorageKeys {
  token("token"),
  refreshToken("refreshToken"),
  isDarkTheme("isDarkTheme");

  final String name;
  const StorageKeys(this.name);

  String get displayName {
    return name;
  }
}
