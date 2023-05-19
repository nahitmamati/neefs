import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  NetworkInfo({required this.connectivity});
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  Connectivity connectivity;
  Future<bool> get isConnected async {
    final connectivityResult = await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("Mobil network");
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("wifi");
      // I am connected to a wifi network.
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      print("Ethernet");
      // I am connected to a ethernet network.
    } else if (connectivityResult == ConnectivityResult.vpn) {
      print("Vpn");
      // I am connected to a vpn network.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      print("Bluetooth");
      // I am connected to a bluetooth.
    } else if (connectivityResult == ConnectivityResult.other) {
      print("Other");
      // I am connected to a network which is not in the above mentioned networks.
    } else if (connectivityResult == ConnectivityResult.none) {
      // I am not connected to any network.
      print("I am not connected to any network");
      return false;
    }
    return true;
  }
}
