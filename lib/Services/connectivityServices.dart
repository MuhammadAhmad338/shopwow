import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectServices {
 Future<void> checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.none) {
    // There is no internet connection.
    // You can display a message or take appropriate action.
    print('No internet connection');
  } else {
    // There is an internet connection.
    // You can proceed with your app's functionality.
    print('Internet connection available');
  }
} 
}