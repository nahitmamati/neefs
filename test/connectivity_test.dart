import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neefs/core/network/network_info.dart';

void main() {
  test("isConnected?", () {
    final networkInfo = NetworkInfo(connectivity: Connectivity());
    print(networkInfo.isConnected());
  });
}
