import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/network_connection_checker/bloc.dart';

class NotConnectedMessageWidget extends StatelessWidget {
  const NotConnectedMessageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkConnectionCheckerBloc,
        NetworkConnectionCheckerState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is NoConnection) {
          return NotConnectedMessage();
        } else {
          return Container(height: 0);
        }
      },
    );
  }
}

class NotConnectedMessage extends StatelessWidget {
  const NotConnectedMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 33,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 3.0),
              child: Text(
                'Device has not connected to the internet.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
