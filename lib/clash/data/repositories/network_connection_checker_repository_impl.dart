import '../../../core/platform/network_info.dart';
import '../../domain/repository/network_connection_checker_repository.dart';

class NetworkConnectionCheckerRepositoryImpl
    implements NetworkConnectionCheckerRepository {
  final NetworkInfo networkInfo;

  NetworkConnectionCheckerRepositoryImpl({this.networkInfo});

  @override
  Future<bool> hasConnection() async {
    return await networkInfo.isConnected;
  }
}
