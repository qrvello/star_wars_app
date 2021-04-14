import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/cubits/bottom_nav_bar_cubit.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Drawer(
        elevation: 8,
        child: BlocBuilder<BottomNavBarCubit, int>(
          builder: (context, int value) {
            return Container(
              color: Color(0xff293241),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListTile(
                    selected: (value == 1) ? true : false,
                    trailing: Icon(Icons.cloud_off_rounded),
                    title: Text('Modo Offline'),
                    onTap: () {
                      context.read<BottomNavBarCubit>().updateIndex(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    selected: (value == 1) ? false : true,
                    trailing: Icon(Icons.cloud_rounded),
                    title: Text('Modo Online'),
                    onTap: () {
                      context.read<BottomNavBarCubit>().updateIndex(0);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
