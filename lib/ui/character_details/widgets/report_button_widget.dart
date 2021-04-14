import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/domain/cubits/bottom_nav_bar_cubit.dart';
import 'package:star_wars_app/domain/models/character.dart';
import 'package:star_wars_app/domain/repositories/api_repository.dart';
import 'package:star_wars_app/ui/character_details/widgets/snackbars.dart';

// ignore: must_be_immutable
class ReportButtonWidget extends StatelessWidget {
  final Character character;

  bool submitingReport = false;

  ReportButtonWidget(this.character);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, state) {
        if (state == 0) {
          return Container(
            margin: EdgeInsets.only(top: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => _submit(context),
              child: Text('Reportar avistamiento'),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  void _submit(BuildContext context) async {
    if (submitingReport == false) {
      submitingReport = true;
      try {
        await context.read<ApiRepository>().submitReport(character);
        submitingReport = false;
        Snackbars()..successful();
      } catch (_) {
        submitingReport = false;
        Snackbars()..error();
      }
    }
  }
}
