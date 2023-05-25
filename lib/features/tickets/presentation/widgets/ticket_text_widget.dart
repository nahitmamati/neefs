import 'package:flutter/material.dart';
import 'package:test/ticket_text_data.dart';

class TicketText extends StatelessWidget {
  final TicketTextData data;
  const TicketText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(data.image),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 34, 129, 254),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data.date,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            color: const Color.fromARGB(255, 246, 248, 252),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(child: Text(data.text)),
            ),
          ),
        ],
      ),
    );
  }
}
