import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/upcomingchest/bloc.dart';

class InputTag extends StatefulWidget {
  const InputTag({Key key}) : super(key: key);

  @override
  _InputTagState createState() => _InputTagState();
}

class _InputTagState extends State<InputTag> {
  final controller = TextEditingController();
  String inputString =
      '%23PPGRVJJQ'; // Remove Step: remove it after Fix 'read user tag' and replace it

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          onChanged: (value) => inputString = value,
          onSubmitted: (_) => addPlayerTag(),
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a tag',
          ),
        ),
        SizedBox(height: 12.0),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: addPlayerTag,
                child: Text('Search'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void addPlayerTag() {
    controller.clear();
    inputString = inputString.replaceFirst('#', '%23');
    context.read<UpcomingChestsBloc>().add(GetUpcomingChestsEvent(inputString));
  }
}
