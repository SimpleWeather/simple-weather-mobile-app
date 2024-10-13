class AppUtils {
  static String baseUrl({
    required String city,
    String uf = 'br',
    required String apiKey,
  }) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$city,$uf&appid=$apiKey';
}
