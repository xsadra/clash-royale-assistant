import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/consts.dart';
import '../../domain/entities/version.dart';
import '../bloc/version_checker/bloc.dart';

class UpdateNotificationWidget extends StatelessWidget {
  const UpdateNotificationWidget({
    Key key,
    @required this.versionInfo,
  }) : super(key: key);

  final Version versionInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.notification.updateNotificationBoxDecoration,
      margin: AppStyles.notification.updateNotificationMargin,
      padding: AppStyles.notification.updateNotificationPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          _buildVersion(),
          AppStyles.sizedBox.height6,
          _buildMessage(),
          _buildFeatures(),
          Center(
            child: UpdateNotificationButton(updateUrl: versionInfo.updateUrl),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppStyles.sizedBox.width50,
          Text(
            AppTexts.ui.updateIsAvailable,
            style: AppStyles.notification.updateNotificationTitleTextStyle,
          ),
          Padding(
            padding: AppStyles.padding.all7,
            child: InkWell(
              child: Icon(
                Icons.close,
                color: Colors.red,
              ),
              onTap: () =>
                  context.read<VersionCheckerBloc>().add(HideVersionEvent()),
            ),
          ),
        ],
      );

  Widget _buildVersion() => Row(
        children: [
          Text(
            AppTexts.ui.newVersionCol,
            style: AppStyles
                .notification.updateNotificationNewVersionTitleTextStyle,
          ),
          AppStyles.sizedBox.width2,
          Text(
            versionInfo.current,
            style: AppStyles
                .notification.updateNotificationNewVersionTitleTextStyle,
          ),
        ],
      );

  Widget _buildFeatures() => Padding(
        padding: AppStyles.padding.all8,
        child: Column(
          children: [
            for (var feature in versionInfo.features)
              Row(
                children: [
                  Icon(Icons.arrow_right),
                  Text(
                    feature,
                    style: AppStyles
                        .notification.updateNotificationFeatureTextStyle,
                  ),
                ],
              ),
          ],
        ),
      );

  Widget _buildMessage() => Text(
        versionInfo.message,
        style: AppStyles.notification.updateNotificationMessageTextStyle,
      );
}

class UpdateNotificationButton extends StatelessWidget {
  const UpdateNotificationButton({
    Key key,
    @required this.updateUrl,
  }) : super(key: key);

  final String updateUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.notification.updateNotificationButtonBoxDecoration,
      padding: AppStyles.padding.symmetricH4,
      child: TextButton(
        onPressed: () {
          context.read<VersionCheckerBloc>().add(HideVersionEvent());
          launch(updateUrl);
        },
        child: Text(
          AppTexts.ui.updateApp,
          style: AppStyles.notification.updateNotificationButtonTextStyle,
        ),
      ),
    );
  }
}
