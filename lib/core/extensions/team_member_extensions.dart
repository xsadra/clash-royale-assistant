import 'package:clash_royale_assistant/core/constants/consts.dart';

import '../../clash/domain/entities/battle.dart';

extension TeamMemberExtensions on TeamMember {
  bool get hasClan => this.clan != null;

  bool get canShareDeck => this.cards.length == 8;

  String get shareDeckUrl {
    String baseUrl = AppTexts.body.shareDeckBaseUrl;
    String cardsId = this.cards.map((e) => e.id).join(AppTexts.ui.semicolon);
    return baseUrl + cardsId;
  }
}
