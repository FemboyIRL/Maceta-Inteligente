import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

abstract class GlobalMethods{
   static Future<String> getWeatherIconFuture(RxString weatherIcon) async {
    return weatherIcon.value;
  }
  
   static String formatWeatherDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy, HH:mm');
    return formatter.format(date);
  }

}