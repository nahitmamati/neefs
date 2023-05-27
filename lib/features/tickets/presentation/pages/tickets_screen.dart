import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:neefs/features/tickets/data/models/ticket_model.dart';
import 'package:neefs/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:neefs/features/tickets/presentation/widgets/add_ticket_widget.dart';
import 'package:neefs/features/tickets/presentation/widgets/ticket_widget.dart';

class TicketsScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();

  TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketsCubit, TicketsState>(
      listener: (context, state) {
        if (state is TicketsInitial) {
          EasyLoading.show();
        } else if (state is TicketsLoading) {
          print("Yükleniyor reis bekle");
        } else if (state is TicketsLoaded) {
          print(context.read<TicketsCubit>().tickets.length);
          EasyLoading.dismiss();
        } else if (state is TicketsFailed) {
          print("Fail oldu bizim TicketState");
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Stack(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                width: double.infinity,
                height: 200,
              ),
              Container(),
              Positioned(
                top: 110,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView.separated(
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: context.read<TicketsCubit>().tickets.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  itemBuilder: (context, index) {
                    return TicketWidget(
                      data: context.read<TicketsCubit>().tickets[index],
                    );
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
                    Text(
                      "All Tickets",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 30,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.swap_vert,
                            size: 30,
                            color: Theme.of(context).colorScheme.onPrimary,
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
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const AddTicketWidget();
                },
                isScrollControlled: true,
              );
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        );
      },
    );
  }
}
