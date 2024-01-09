
import 'package:intl/intl.dart';

class MyDateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime, true).toLocal();
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('hh:mm aa').format(isoStringToLocalDate(dateTime));
  }
  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a').format(isoStringToLocalDate(dateTime));
  }

  static DateTime isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('yyyy-MM-dd').parse(dateTime);
  }


  static String localDateTime(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime.toUtc());
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  }

  static String convertTimeToTime(String time) {
    return DateFormat('MM/yyyy').format(DateFormat('yyyy-MM-dd').parse(time));
  }
  static String convertTimeToTimeString(String time) {
    return DateFormat('dd.MM.yyyy').format(DateFormat('yyyy-MM-dd').parse(time));
  }

  static String convertNewTimeToTime(String time) {
    return DateFormat('yyyy-MM-dd').format(DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(time));
  }


}
