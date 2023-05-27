import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neefs/features/tickets/data/models/ticket_model.dart';
import 'package:neefs/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:neefs/features/user/presentation/cubit/user_cubit.dart';
import 'package:neefs/injection_container.dart';

List<TicketModel> datas = [
  TicketModel(
    id: 100,
    title: "Annen",
    status: "pending",
    topic: "Annen",
    createdAt: "03/08/2002",
    updatedAt: "04/08/2003",
  ),
  TicketModel(
    id: 100,
    title: "Annen",
    status: "pending",
    topic: "Annen",
    createdAt: "03/08/2002",
    updatedAt: "04/08/2003",
  ),
  TicketModel(
    id: 100,
    title: "Annen",
    status: "pending",
    topic: "Annen",
    createdAt: "03/08/2002",
    updatedAt: "04/08/2003",
  ),
  TicketModel(
    id: 100,
    title: "Annen",
    status: "pending",
    topic: "Annen",
    createdAt: "03/08/2002",
    updatedAt: "04/08/2003",
  ),
];

class TicketScreen extends StatelessWidget {
  final TicketModel data;
  const TicketScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () => GoRouter.of(context).pop(),
          ),
          title: Row(
            children: [
              Text(
                "#${data.id ?? '<Empty>'}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.status == "pending" ? "OPEN" : "CLOSED",
                    style: const TextStyle(
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
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
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
                flex: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title ?? '<Empty>',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        maxLines: 2,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: (BlocProvider.of<UserCubit>(context).state
                                      as UserLoginSuccessfull)
                                  .user
                                  .name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: " reported an issue",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        maxLines: 2,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Issued at: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: (BlocProvider.of<UserCubit>(context).state
                                      as UserLoginSuccessfull)
                                  .user
                                  .createdAt!
                                  .substring(0, 10),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
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
                flex: 70,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/reis.jpg"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Keyvan Arasteh",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    DateTime.now().toString().substring(0, 10),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: TextFormField(
                          maxLines: 10,
                          controller: getIt<TextEditingController>(
                              instanceName: 'ticketRespondController'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Doldur lan!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Message",
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context).colorScheme.background)),
                            onPressed: () async {
                              var controller = getIt<TextEditingController>(
                                  instanceName: 'ticketRespondController');

                              if (controller.text.isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Ticket is reponded successfuly"),
                                  ),
                                );

                                await context
                                    .read<TicketsCubit>()
                                    .respondTicket(
                                      token:
                                          (BlocProvider.of<UserCubit>(context)
                                                      .state
                                                  as UserLoginSuccessfull)
                                              .user
                                              .token!,
                                      id: data.id!.toString(),
                                      message: controller.text,
                                    );

                                controller.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Please fill the input field"),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              "Respond",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
