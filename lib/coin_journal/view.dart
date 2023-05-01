import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'Models.dart';
import 'WebView.dart';
import 'logic.dart';

class CoinJournalPage extends StatelessWidget {
  CoinJournalPage({Key? key}) : super(key: key);

  final logic = Get.put(CoinJournalLogic());
  final state = Get.find<CoinJournalLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Coin_JMods>>(
        future: logic.getinformation(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.length > 0) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            '${snapshot.data![index].title} .',
                            style: GoogleFonts.actor(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            children: [
                              Text(
                                '${snapshot.data![index].date}  : from crypto bugle.com ',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AnyLinkPreview(
                            link: "${snapshot.data![index].url}",
                            displayDirection: UIDirection.uiDirectionVertical,
                            showMultimedia: true,
                            bodyMaxLines: 5,
                            bodyTextOverflow: TextOverflow.ellipsis,
                            titleStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            bodyStyle:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                            errorBody: 'Show my custom error body',
                            errorTitle: 'Show my custom error title',
                            errorWidget: Container(
                              color: Colors.grey[300],
                              child: const Text('Oops!'),
                            ),
                            errorImage: "https://google.com/",
                            cache: const Duration(days: 7),
                            backgroundColor: Colors.grey[300],
                            borderRadius: 12,
                            removeElevation: true,
                            boxShadow: const [
                              BoxShadow(blurRadius: 3, color: Colors.grey)
                            ],
                            onTap: () {
                              Get.to(CoinjwebView(coin_jMods: snapshot.data![index],));
                            }, // This disables tap event
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                "Briefings ",
                                style: GoogleFonts.actor(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 230),
                              const CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.red,
                              ),
                              const SizedBox(width: 6),
                              const CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.yellow,
                              ),
                              const SizedBox(width: 6),
                              const CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.green,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            child: Text(
                              '${snapshot.data![index]!.description}',
                              style: GoogleFonts.dosis(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 100,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              itemCount: 10,
            );
          } else {
            return const Center(
              child: Text(
                "Nope",
                style: TextStyle(fontSize: 45),
              ),
            );
          }
        },
      ),
    );
  }
}
