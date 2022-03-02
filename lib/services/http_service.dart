import 'package:http/http.dart' as http;
import 'package:symfonia_test/model/coin.dart';

class HttpService {
  static Future<List<Coin>> fetchCoins() async {
    final url = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      return coinFromJson(data);
    } else {
      var data = response.body;
      return coinFromJson(data);
    }
  }
}
