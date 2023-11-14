import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/constants/consts.dart';
import '../../domain/entities/version.dart';
import '../bloc/version_checker/bloc.dart';

class UpdateNotificationWidget extends StatelessWidget {
  const UpdateNotificationWidget({
    Key? key,
    required this.versionInfo,
  }) : super(key: key);

  final Version versionInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: AppStyles.notification.updateNotificationBoxDecorationTop,
          margin: AppStyles.notification.updateNotificationMarginTop,
          padding: AppStyles.notification.updateNotificationPaddingTop,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildVersion(),
              AppStyles.sizedBox.height6,
              _buildMessage(),
              _buildFeatures(),
            ],
          ),
        ),
        Container(
          decoration:
              AppStyles.notification.updateNotificationBoxDecorationBottom,
          margin: AppStyles.notification.updateNotificationMarginBottom,
          padding: AppStyles.notification.updateNotificationPaddingBottom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: UpdateNotificationButton(
                  updateUrl: AppTexts.body.googlePlayLink,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppStyles.sizedBox.width50,
          Spacer(),
          SizedBox(
            width: 180.0,
            child: TextLiquidFill(
              text: AppTexts.ui.updateIsAvailable,
              waveColor: Colors.green,
              boxBackgroundColor: Colors.white,
              textStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 50.0,
            ),
          ),
          Spacer(),
          Padding(
            padding: AppStyles.padding.all7,
            child: InkWell(
              child: Icon(
                Icons.close,
                color: Colors.black54,
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
            versionInfo.current!,
            style: AppStyles
                .notification.updateNotificationNewVersionTitleTextStyle,
          ),
        ],
      );

  Widget _buildFeatures() => Padding(
        padding: AppStyles.padding.all8,
        child: Column(
          children: [
            for (var feature in versionInfo.features!)
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
        versionInfo.message!,
        style: AppStyles.notification.updateNotificationMessageTextStyle,
      );
}

class UpdateNotificationButton extends StatelessWidget {
  const UpdateNotificationButton({
    Key? key,
    required this.updateUrl,
  }) : super(key: key);

  final String updateUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          context.read<VersionCheckerBloc>().add(HideVersionEvent());
          launchUrlString(updateUrl);
        },
        child: Text(
          AppTexts.ui.updateApp,
          style: GoogleFonts.poppins(
            color: Color(0xffffffff),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.3,
          ),
        ),
      ),
    );
  }
}
