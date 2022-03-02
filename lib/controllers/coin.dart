import 'package:get/get.dart';
import 'package:symfonia_test/services/http_service.dart';

class CoinController extends GetxController {
  Rx<bool> isLoading = true.obs;
  RxList<dynamic> coinList = [].obs;

  @override
  void onInit() {
    fetchCoins();
    super.onInit();
  }

  void fetchCoins() async {
    try {
      isLoading(true);
      var coins = await HttpService.fetchCoins();
      if (coins.isNotEmpty) {
        coinList.value = coins;
      }
    } finally {
      isLoading(false);
    }
  }
}
