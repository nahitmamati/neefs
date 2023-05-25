import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/ticket_data.dart';
import 'package:test/ticket_text_data.dart';
import 'package:test/ticket_text_widget.dart';

List<TicketTextData> datas = [
  TicketTextData(
    name: "Yunus Çavuşoğlu",
    text:
        "Selam,\n\nGeçen sizin çocuklar bizim ufaklığı dövmüş\nben de çok sinir oldum sizinkini dövmek istiyorum.\nLütfen önüme çıkmayın demek istemiştim\n\n\nEyvallah,\nYunus.",
    date: "06/06/2023",
    image: "images/us.jpg",
  ),
  TicketTextData(
    name: "Ertuğrul Faruk Pişkin",
    text:
        "Merhaba,\n\nYa sen ne anlatıyon be abla, gözünü seveyim be abi.\nHayatınız para olmuş boolum.\n\n\nEyvallah,\nErtuğrul.",
    date: "06/06/2023",
    image: "images/me.jpeg",
  ),
  TicketTextData(
    name: "Yunus Çavuşoğlu",
    text:
        "Selam,\n\nGeçen sizin çocuklar bizim ufaklığı dövmüş\nben de çok sinir oldum sizinkini dövmek istiyorum.\nLütfen önüme çıkmayın demek istemiştim\n\n\nEyvallah,\nYunus.",
    date: "06/06/2023",
    image: "images/us.jpg",
  ),
  TicketTextData(
    name: "Ertuğrul Faruk Pişkin",
    text:
        "Merhaba,\n\nYa sen ne anlatıyon be abla, gözünü seveyim be abi.\nHayatınız para olmuş boolum.\n\n\nEyvallah,\nErtuğrul.",
    date: "06/06/2023",
    image: "images/me.jpeg",
  ),
];

class TicketScreen extends StatelessWidget {
  final TicketData data;
  const TicketScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 129, 254),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 34, 129, 254),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Row(
          children: [
            Text(
              "#${data.number}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data.status ? "OPEN" : "CLOSED",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 34, 129, 254),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.flag,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: data.reporter,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: " reported an issue",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 80,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (context, index) {
                    return TicketText(data: datas[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: datas.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
