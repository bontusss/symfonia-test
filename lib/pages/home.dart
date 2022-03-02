import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:symfonia_test/controllers/coin.dart';
import 'package:symfonia_test/utils/colors.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CoinController coinController = Get.put(CoinController());
    final coin = coinController.coinList;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title: const Text(
            'History',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 5.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.filter_list_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Sort/filter',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        Obx(() {
          if (coinController.isLoading.value) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                ((context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          width: 10,
                          height: 10,
                          child: CachedNetworkImage(
                            imageUrl: coin[index].image,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coin[index]
                                        .marketCapChangePercentage24H
                                        .toStringAsFixed(2)[0] ==
                                    '-'
                                ? 'Sent'
                                : 'Recieved',
                            style: TextStyle(color: grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                coin[index].currentPrice.toString() + ' ',
                                style: TextStyle(
                                    color: black, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                coin[index].name,
                                style: TextStyle(
                                    color: black, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                '12.54, ',
                                style: TextStyle(color: grey, fontSize: 12),
                              ),
                              Text(
                                'AUG 15, 2019',
                                style: TextStyle(color: grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Text(
                        coin[index]
                                    .marketCapChangePercentage24H
                                    .toStringAsFixed(2)[0] ==
                                '-'
                            ? coin[index]
                                .marketCapChangePercentage24H
                                .toStringAsFixed(2)
                            : "+" +
                                coin[index]
                                    .marketCapChangePercentage24H
                                    .toStringAsFixed(2),
                        // '545',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: coin[index]
                                        .marketCapChangePercentage24H
                                        .toStringAsFixed(2)[0] ==
                                    '-'
                                ? Colors.red
                                : Colors.green[700]),
                      ),
                    ),
                  );
                }),
                childCount: coinController.coinList.length,
              ),
            );
          }
        })
      ],
    ));
  }
}
