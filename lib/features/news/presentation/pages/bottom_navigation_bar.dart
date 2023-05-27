import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neefs/features/news/presentation/pages/home_page.dart';
import 'package:neefs/features/profile/presentation/pages/profile_page.dart';
import 'package:neefs/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:neefs/features/tickets/presentation/pages/tickets_screen.dart';
import 'package:neefs/features/user/presentation/cubit/user_cubit.dart';

final pages = [HomePage(), TicketsScreen(), ProfilePage()];
int index = 0;

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num_outlined),
              activeIcon: Icon(Icons.confirmation_num),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: "",
            ),
          ],
          onTap: (value) async {
            setState(() {
              index = value;
            });
            if (index == 1) {
              await context.read<TicketsCubit>().loadTickets(
                    token: (BlocProvider.of<UserCubit>(context).state
                            as UserLoginSuccessfull)
                        .user
                        .token!,
                  );
            }
          },
        ),
        body: pages[index],
      ),
    );
  }
}
