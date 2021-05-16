import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/bloc/profile/bloc.dart';

class RefreshProfile extends StatelessWidget {
  const RefreshProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context
            .read<ProfileBloc>()
            .add(GetProfileEvent('%23PPGRVJJQ')), // Remove Step:
        child: Icon(Icons.refresh),
      ),
    );
  }
}
