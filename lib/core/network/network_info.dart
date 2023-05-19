import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  NetworkInfo({required this.connectivity});
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  Connectivity connectivity;
  bool isConnected() {
    final result = connectivity.checkConnectivity();
    if (result != ConnectivityResult.ethernet ||
        result != ConnectivityResult.mobile ||
        result != ConnectivityResult.wifi) {
      return false;
    }
    return true;
  }
}
