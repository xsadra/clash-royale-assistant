import 'package:flutter/material.dart';

import '../../domain/entities/profile.dart';

class UserClanName extends StatelessWidget {
  const UserClanName({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(profile.clan.name),
        SizedBox(width: 4),
        Text(
          profile.clan.tag,
          style: TextStyle(fontSize: 10, color: Colors.blueGrey),
        ),
        SizedBox(width: 4),
        Text(profile.role),
      ],
    );
  }
}
