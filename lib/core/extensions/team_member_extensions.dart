import '../../clash/domain/entities/battle.dart';

extension TeamMemberExtensions on TeamMember {
  bool get hasClan => this.clan != null;
}
