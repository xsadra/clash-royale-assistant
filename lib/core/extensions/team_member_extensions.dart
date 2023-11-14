import 'package:clash_royale_assistant/clash/domain/entities/card.dart';
import 'package:clash_royale_assistant/core/constants/consts.dart';

import '../../clash/domain/entities/battle.dart';

extension TeamMemberExtensions on TeamMember {
  bool get hasClan => this.clan != null;

  bool get canShareDeck => this.cards.length >= 8;

  String get shareDeckUrl {
    String baseUrl = AppTexts.body.shareDeckBaseUrl;
    List<Card> firstDeck = this.cards.sublist(0, 8);
    String cardsId = firstDeck.map((e) => e.id).join(AppTexts.ui.semicolon);
    return baseUrl + cardsId;
  }

  bool get canShareSecondDeck => this.cards.length >= 16;

  String get shareSecondDeckUrl {
    String baseUrl = AppTexts.body.shareDeckBaseUrl;
    List<Card> secondDeck = this.cards.sublist(8, 16);
    String cardsId = secondDeck.map((e) => e.id).join(AppTexts.ui.semicolon);
    return baseUrl + cardsId;
  }

  bool get canShareThirdDeck => this.cards.length == 24;

  String get shareThirdDeckUrl {
    String baseUrl = AppTexts.body.shareDeckBaseUrl;
    List<Card> thirdDeck = this.cards.sublist(16, 24);
    String cardsId = thirdDeck.map((e) => e.id).join(AppTexts.ui.semicolon);
    return baseUrl + cardsId;
  }
}
