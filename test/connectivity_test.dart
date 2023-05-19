import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neefs/core/network/network_info.dart';

void main() {
  test("isConnected?", () async {
    final networkInfo = NetworkInfo(connectivity: Connectivity());
    print(await networkInfo.isConnected);
  });
}
