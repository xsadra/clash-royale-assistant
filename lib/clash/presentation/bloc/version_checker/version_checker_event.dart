import 'package:meta/meta.dart';

@immutable
abstract class VersionCheckerEvent {}

class GetVersionEvent extends VersionCheckerEvent {}

class ReadVersionEvent extends VersionCheckerEvent {}

class CheckIsUpdatedVersionEvent extends VersionCheckerEvent {}

class SaveCurrentVersionEvent extends VersionCheckerEvent {}

class HideVersionEvent extends VersionCheckerEvent {}
