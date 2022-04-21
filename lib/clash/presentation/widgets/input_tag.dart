import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../../../core/routes/router.gr.dart';
import '../../data/datasources/validate_tag_remote_data_source.dart';
import '../../domain/entities/current_player_tag.dart';
import '../bloc/currentplayertag/bloc.dart' hide Loading;
import '../bloc/network_connection_checker/bloc.dart';
import '../bloc/validatetag/bloc.dart';

class InputTag extends StatefulWidget {
  const InputTag({Key key}) : super(key: key);

  @override
  _InputTagState createState() => _InputTagState();
}

class _InputTagState extends State<InputTag> {
  final controller = TextEditingController();
  String inputString = '';
  bool isFormEnabled = true;

  @override
  Widget build(BuildContext context) {
    context.read<NetworkConnectionCheckerBloc>().add(ConnectionCheckerEvent());
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _titleText(),
          AppStyles.sizedBox.height24,
          _inputTextField(),
          AppStyles.sizedBox.height12,
          _searchButton(),
          AppStyles.sizedBox.height16,
          _helpText(),
          AppStyles.sizedBox.height16,
          _demoButton(),
        ],
      ),
    );
  }

  Widget _helpText() {
    return Column(
      children: [
        Text(
          AppTexts.body.findTagHelpTextHeader,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 21.0,
          ),
        ),
        AppStyles.sizedBox.height10,
        SetPlayerHelpText(
            rowNumber: AppTexts.body.num1, rowText: AppTexts.body.findTagHelp1),
        AppStyles.sizedBox.height12,
        SetPlayerHelpText(
            rowNumber: AppTexts.body.num2, rowText: AppTexts.body.findTagHelp2),
        AppStyles.sizedBox.height12,
        SetPlayerHelpText(
            rowNumber: AppTexts.body.num3, rowText: AppTexts.body.findTagHelp3),
        AppStyles.sizedBox.height12,
        SetPlayerHelpText(
            rowNumber: AppTexts.body.num4, rowText: AppTexts.body.findTagHelp4),
        AppStyles.sizedBox.height12,
      ],
    );
  }

  Widget _titleText() {
    return Text(
      AppTexts.ui.toStart,
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
        if (state is Loading) {
          isFormEnabled = false;
        } else if (state is IsValid) {
          isFormEnabled = true;
          context.read<CurrentPlayerTagBloc>().add(SaveCurrentPlayerTagEvent(
              playerTag: CurrentPlayerTag(playerTag: inputString)));
          log('Navigate to HomePage', name: 'InputTag > _inputTextField()');
          ExtendedNavigator.of(context).replace(Routes.PlayerPageRoute);
        } else if (state is NotValid) {
          isFormEnabled = true;
          showError = true;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: TextField(
                onChanged: (value) {
                  log('Input value is: ' + value,
                      name: 'InputTag > _inputTextField');
                  inputString = value;
                },
                enabled: isFormEnabled,
                onSubmitted: (_) => _validateTag(),
                controller: controller,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
                // inputFormatters: [UpperCaseTextFormatter()],
                textInputAction: TextInputAction.search,
                maxLength: 10,
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF00893F)),
                decoration: InputDecoration(
                  errorText:
                      showError ? AppTexts.error.findTagTextFieldError : null,
                  fillColor: Colors.blueGrey,
                  labelText: AppTexts.body.findTagTextFieldLabel,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                  prefixIcon: Icon(Icons.tag, color: Colors.green),
                  border: OutlineInputBorder(),
                  hintText: AppTexts.body.findTagTextFieldHint,
                  hintStyle: TextStyle(color: Colors.teal),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () => isFormEnabled ? controller.clear() : null,
                icon: Icon(Icons.delete),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _searchButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: isFormEnabled ? _validateTag : null,
            child: Text(AppTexts.ui.search),
          ),
        ),
      ],
    );
  }

  Widget _demoButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white38),
              foregroundColor: MaterialStateProperty.all(Colors.blueGrey),
              textStyle: MaterialStateProperty.all(
                TextStyle(fontWeight: FontWeight.w700),
              )),
          onPressed: isFormEnabled ? _loadDemo : null,
          child: Text(AppTexts.ui.demo),
        ),
      ],
    );
  }

  void _validateTag() {
    controller.clear();
    inputString = AppTexts.ui.spaceUrl +
        inputString.replaceAll(AppTexts.ui.hashTag, AppTexts.ui.empty);

    log(inputString, name: 'InputTag > _validateTag()');

    context.read<ValidateTagBloc>().add(
        CheckValidateTagEvent(tag: inputString, type: RoyaleTagsType.player));
    log(
        'add CheckValidateTagEvent event to ValidateTagBloc: [' +
            inputString +
            '] - [' +
            RoyaleTagsType.player +
            ']',
        name: 'InputTag > _validateTag()');
  }

  void _loadDemo() {
    controller.clear();
    inputString = AppTexts.ui.demoTag;

    log('load Demo');

    context.read<ValidateTagBloc>().add(
        CheckValidateTagEvent(tag: inputString, type: RoyaleTagsType.player));
    log(
        'add CheckValidateTagEvent event to ValidateTagBloc: [' +
            inputString +
            '] - [' +
            RoyaleTagsType.player +
            ']',
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
        AppStyles.sizedBox.width10,
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

@Deprecated('it cause repeated letters on input')
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    log('oldValue: ' + oldValue.text,
        name: 'InputTag > SetPlayerHelpText > UpperCaseTextFormatter');
    log('oldValue Selection: ' + oldValue.selection.toString(),
        name: 'InputTag > SetPlayerHelpText > UpperCaseTextFormatter');
    log('newValue: ' + newValue.text,
        name: 'InputTag > SetPlayerHelpText > UpperCaseTextFormatter');
    log('newValue Selection: ' + newValue.selection.toString(),
        name: 'InputTag > SetPlayerHelpText > UpperCaseTextFormatter');
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
