import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routes/router.gr.dart';
import '../../data/datasources/validate_tag_remote_data_source.dart';
import '../../domain/entities/current_player_tag.dart';
import '../bloc/currentplayertag/bloc.dart';
import '../bloc/validatetag/bloc.dart';

class InputTag extends StatefulWidget {
  const InputTag({Key key}) : super(key: key);

  @override
  _InputTagState createState() => _InputTagState();
}

class _InputTagState extends State<InputTag> {
  final controller = TextEditingController();
  String inputString = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _titleText(),
          SizedBox(height: 24.0),
          _inputTextField(),
          SizedBox(height: 12.0),
          _searchButton(),
          SizedBox(height: 12.0),
          _helpText(),
        ],
      ),
    );
  }

  Column _helpText() {
    return Column(
      children: [
        SetPlayerHelpText(
            rowNumber: '1', rowText: 'Launch Clash Royale and tap your name'),
        SizedBox(height: 12.0),
        SetPlayerHelpText(
            rowNumber: '2', rowText: 'Find your player Tag below your name'),
        SizedBox(height: 12.0),
        SetPlayerHelpText(
            rowNumber: '3', rowText: 'Tap on your Tag and Copy it'),
        SizedBox(height: 12.0),
        SetPlayerHelpText(
            rowNumber: '4', rowText: 'Paste your Tag in the field above'),
        SizedBox(height: 12.0),
      ],
    );
  }

  Text _titleText() {
    return Text(
      'To Start',
      textAlign: TextAlign.center,
      style: TextStyle(
        letterSpacing: 2,
        wordSpacing: 3,
        color: Colors.black87,
        fontWeight: FontWeight.w900,
        fontSize: 26.0,
      ),
    );
  }

  Widget _inputTextField() {
    bool showError = false;
    return BlocBuilder<ValidateTagBloc, ValidateTagState>(
      builder: (BuildContext context, state) {
        log(state.runtimeType.toString(),
            name: ' InputTag > _inputTextField()');
        if (state is IsValid) {
          context.read<CurrentPlayerTagBloc>().add(SaveCurrentPlayerTagEvent(
              playerTag: CurrentPlayerTag(playerTag: inputString)));
          log('Navigate to HomePage', name: 'InputTag > _inputTextField()');
          ExtendedNavigator.of(context).replace(Routes.PlayerPageRoute);
        } else if (state is NotValid) {
          showError = true;
        }
        return TextField(
          onChanged: (value) => inputString = value,
          onSubmitted: (_) => _validateTag(),
          controller: controller,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.characters,
          inputFormatters: [UpperCaseTextFormatter()],
          textInputAction: TextInputAction.search,
          maxLength: 10,
          maxLines: 1,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00893F)),
          decoration: InputDecoration(
              errorText: showError ? 'Wrong tag, try again!' : null,
              fillColor: Colors.blueGrey,
              labelText: 'Enter your Player Tag',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              prefixIcon: Icon(Icons.tag, color: Colors.green),
              border: OutlineInputBorder(),
              hintText: 'XXXXXXXXX',
              hintStyle: TextStyle(color: Colors.teal)),
        );
      },
      //listenWhen: (previous, current) => current != previous,
    );
  }

  Row _searchButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: _validateTag,
            child: Text('Search'),
          ),
        ),
      ],
    );
  }

  void _validateTag() {
    controller.clear();
    inputString = '%23' + inputString.replaceAll('#', '');

    log(inputString, name: 'InputTag > _validateTag()');

    context
        .read<ValidateTagBloc>()
        .add(CheckValidateTagEvent(tag: inputString, type: RoyaleTags.player));
    log('add CheckValidateTagEvent event to ValidateTagBloc',
        name: 'InputTag > _validateTag()');
  }
}

class SetPlayerHelpText extends StatelessWidget {
  final String rowNumber;
  final String rowText;

  const SetPlayerHelpText({
    Key key,
    @required this.rowNumber,
    @required this.rowText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Icon(
              Icons.label,
              color: Colors.black54,
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 7),
              child: Text(
                rowNumber,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            rowText,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
