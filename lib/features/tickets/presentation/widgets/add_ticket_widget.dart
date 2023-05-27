import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neefs/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:neefs/features/user/presentation/cubit/user_cubit.dart';
import 'package:neefs/injection_container.dart';

class AddTicketWidget extends StatelessWidget {
  const AddTicketWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: getIt<TextEditingController>(
                        instanceName: 'ticketTopicController'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Doldur lan!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Topic",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    controller: getIt<TextEditingController>(
                        instanceName: 'ticketTitleController'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Doldur lan!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            TextFormField(
              maxLines: 8,
              controller: getIt<TextEditingController>(
                  instanceName: 'ticketMessageController'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Doldur lan!';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(
              onPressed: () async {
                var topicCnt = getIt<TextEditingController>(
                    instanceName: 'ticketTopicController');
                var titleCnt = getIt<TextEditingController>(
                    instanceName: 'ticketTitleController');
                var messageCnt = getIt<TextEditingController>(
                    instanceName: 'ticketMessageController');

                if (topicCnt.text.isNotEmpty &&
                    titleCnt.text.isNotEmpty &&
                    messageCnt.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("New ticket added successfuly"),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );

                  GoRouter.of(context).pop();
                  await context.read<TicketsCubit>().addTicket(
                        token: (BlocProvider.of<UserCubit>(context).state
                                as UserLoginSuccessfull)
                            .user
                            .token!,
                        title: titleCnt.text,
                        message: messageCnt.text,
                        topic: topicCnt.text,
                        refresh: true,
                      );

                  topicCnt.clear();
                  titleCnt.clear();
                  messageCnt.clear();
                }
              },
              child: const Text("Add Ticket"),
            ),
          ],
        ),
      ),
    );
  }
}
