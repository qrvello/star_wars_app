import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;

  const CardWidget(this.title, {this.subtitle, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color(0xff3d5a80).withOpacity(0.2),
            Color(0xff3d5a80).withOpacity(0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Card(
        shadowColor: Colors.transparent,
        color: Colors.transparent,
        child: ListTile(
          tileColor: Colors.transparent,
          title: Text(title),
          subtitle: (subtitle != null) ? Text(subtitle) : null,
          trailing: (trailing != null)
              ? Text(
                  trailing,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
