import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/cubits/bottom_nav_bar_cubit.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BottomNavBarCubit>(context);

    return BlocBuilder<BottomNavBarCubit, int>(
      bloc: cubit,
      builder: (BuildContext context, int index) {
        return Positioned(
          left: 5,
          right: 5,
          bottom: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: Color(0xfffcbf49),
              backgroundColor: Color(0xff293241),
              items: [
                BottomNavigationBarItem(
                  tooltip: 'Encuentra los personajes a través de internet',
                  icon: Icon(Icons.cloud),
                  label: 'Online',
                ),
                BottomNavigationBarItem(
                  tooltip:
                      'Encuentra los personajes que están guardados localmente en tu celular',
                  icon: Icon(Icons.cloud_off),
                  label: 'Offline',
                ),
              ],
              currentIndex: index,
              onTap: (int value) {
                switch (value) {
                  case 0:
                    context.read<BottomNavBarCubit>().updateIndex(0);
                    break;
                  case 1:
                    context.read<BottomNavBarCubit>().updateIndex(1);
                    break;
                }
              },
            ),
          ),
        );
      },
    );
  }
}
