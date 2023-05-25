import 'package:flutter/material.dart';
import 'package:test/ticket_data.dart';
import 'package:test/ticket_widget.dart';

List<TicketData> datas = [
  TicketData(
      header: "Vintage table lamp - Out of stocks?",
      description:
          "Ya sen ne anlatıyon be abla, gözünü seveyim be abi. Ya sen ne anlatıyon be abla, gözünü seveyim be abi. Ya sen ne anlatıyon be abla, gözünü seveyim be abi.",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: false,
      priority: Priority.low),
  TicketData(
      header: "Vintage table lamp - Out of stock?",
      description: "Is vintage table lamp out of stock?",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: true,
      priority: Priority.normal),
  TicketData(
      header: "Vintage table lamp - Out of stock?",
      description: "Is vintage table lamp out of stock?",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: true,
      priority: Priority.high),
  TicketData(
      header: "Vintage table lamp - Out of stock?",
      description: "Is vintage table lamp out of stock?",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: true,
      priority: Priority.high),
  TicketData(
      header: "Vintage table lamp - Out of stock?",
      description: "Is vintage table lamp out of stock?",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: true,
      priority: Priority.high),
  TicketData(
      header: "Vintage table lamp - Out of stock?",
      description: "Is vintage table lamp out of stock?",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: true,
      priority: Priority.high),
  TicketData(
      header: "Vintage table lamp - Out of stock?",
      description: "Is vintage table lamp out of stock?",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: true,
      priority: Priority.high),
  TicketData(
      header: "Vintage table lamp - Out of stock?",
      description: "Is vintage table lamp out of stock?",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: true,
      priority: Priority.high),
  TicketData(
      header: "Vintage table lamp - Out of stock?",
      description: "Is vintage table lamp out of stock?",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: true,
      priority: Priority.high),
  TicketData(
      header: "Vintage table lamp - Out of stock?",
      description: "Is vintage table lamp out of stock?",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: true,
      priority: Priority.high),
  TicketData(
      header: "Vintage table lamp - Out of stock?",
      description: "Is vintage table lamp out of stock?",
      assignee: "Ertuğrul Faruk Pişkin",
      reporter: "Yunus Çavuşoğlu",
      date: "06/03/2023",
      number: 123,
      status: true,
      priority: Priority.high),
];
List<TicketData> original = datas;

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  bool searchActive = false;
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 248, 252),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: const Color.fromARGB(255, 34, 129, 254),
          ),
          Container(),
          if (searchActive)
            Positioned(
              top: 120,
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  onChanged: (value) {
                    var result = original.map((e) {
                      if (e.description.contains(value)) return e;
                    }).toList();
                    result.removeWhere((element) => element == null);
                    datas = List.from(result);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            top: !searchActive ? 110 : 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: ListView.separated(
              controller: controller,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: datas.length,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              itemBuilder: (context, index) {
                return Ticket(data: datas[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
            ),
          ),
          Positioned(
            top: 70,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "All Tickets",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          controller.animateTo(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          );
                          searchActive = !searchActive;
                          datas = original;
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.swap_vert,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[100],
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 34, 129, 254),
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 34, 129, 254),
        ),
      ),
    );
  }
}
