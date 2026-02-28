

import 'package:intl/intl.dart';
import 'package:offline_first/core/logger/app_logger.dart';

/// Shortcut for DateFormatUtil [DFU]
typedef DFU = DateFormatUtil;

abstract class _DateTimeFormats {
  static final dayName = DateFormat('EEE');
  static final dayNameFull = DateFormat('EEEE');
  static final ddMMyyyy = DateFormat('dd-MM-yyyy');
  static final ddMMMyyyy = DateFormat('dd-MMM-yyyy');
  static final friendlyFormat = DateFormat('dd/MMM/yyyy');
  static final toYYYYmmDDHHmmss = DateFormat('yyyy-MM-dd HH:mm:ss');
  static final ddMMyyyyHHmmss = DateFormat('dd-MM-yyyy HH:mm:ss');
  static final hhmmss = DateFormat('HH:mm:ss');
  static final currentTimeFormat = DateFormat('dd-MMM-yyyy hh:mm a');
  // static final _ddMMyyyyHHmmss = DateFormat('dd-MM-yyyy HH:mm:ss');
}
abstract class DateFormatUtil {
  static DateTime now() => DateTime.now();
  static String currentTimeFormat(DateTime dateTime) =>
      _DateTimeFormats.currentTimeFormat.format(dateTime);

  static String getDayName(DateTime dateTime) => _DateTimeFormats.dayName.format(dateTime);

  static DateTime toDateTime(String date, [String format = 'dd/MM/yyyy']) =>
      DateFormat(format).parse(date);


  static String getDayNameFully(DateTime dateTime) => _DateTimeFormats.dayNameFull.format(dateTime);
  static String ddMMyyyy(DateTime dateTime) {

    return _DateTimeFormats.ddMMyyyy.format(dateTime);
  }
  static String ddMMMyyyy(DateTime dateTime) => _DateTimeFormats.ddMMMyyyy.format(dateTime);
  static String friendlyFormat(DateTime dateTime) => _DateTimeFormats.friendlyFormat.format(dateTime);
  static String hhmmss(DateTime dateTime) => _DateTimeFormats.hhmmss.format(dateTime);
  static String ddMMyyyyHHmmss(DateTime dateTime) => _DateTimeFormats.ddMMyyyyHHmmss.format(dateTime);
   static String ddMMyyyyFromStr(String date) {
    try {
      final dateTime = DateTime.parse(date);
      return _DateTimeFormats.ddMMyyyy.format(dateTime);
    } catch (e) {
      return '';
    }
  }
 static String ddMMyyyyHHmmssFromStr(String date) {
  try {
    final dateTime = DateTime.parse(date);
    return _DateTimeFormats.ddMMyyyyHHmmss.format(dateTime); 
  } catch (e) {
    return '';
  }
}
static String formatArrivalDate(dynamic arrivalDateAndTime) {
  if (arrivalDateAndTime is DateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(arrivalDateAndTime);
  }

  if (arrivalDateAndTime is String) {
    // check if already yyyy-MM-dd HH:mm:ss
    final alreadyFormatted = RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$')
        .hasMatch(arrivalDateAndTime);

    if (alreadyFormatted) {
      return arrivalDateAndTime; // don’t reformat
    }

    // parse from dd-MM-yyyy HH:mm:ss
    final parsed =
        DateFormat('dd-MM-yyyy HH:mm:ss').parse(arrivalDateAndTime, true);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(parsed);
  }

  return ''; // fallback
}

   static String timeFromStr(String dateStr) {
    try {
      final dateTime = DateTime.parse(dateStr);
      return DateFormat.jm().format(dateTime); // e.g., 10:00 AM
    } catch (e) {
      return '';
    }
  }

 String? formatTime(String? backendTime) {
  if (backendTime == null || backendTime.isEmpty) return null;

  // Parse backend string "HH:MM:SS"
  final parts = backendTime.split(':');
  if (parts.length < 2) return backendTime;

  return '${parts[0]}:${parts[1]}'; // HH:MM only
}


  static String fromFrappeToddMMyyyy(String? dateTime) {
    if(dateTime == null) return '';
    try {
      final dObj= DateTime.parse(dateTime);
      return _DateTimeFormats.ddMMMyyyy.format(dObj);
    } catch (e) {
      return '';
    }
  }
  
  static DateTime toDateTIme(String date, [String format = 'yyyy-MM-dd']) => DateFormat(format).parse(date);
  
  static String? toYYYYmmDDHHmmss(String? date, String? time) {
    if(date ==null || time == null) return null;
    try {  
      final datetime = _DateTimeFormats.ddMMyyyyHHmmss.parse('$date $time');
      return _DateTimeFormats.toYYYYmmDDHHmmss.format(datetime);
    } on Exception catch (e, st) {
      $logger.error('[toYYYYmmDDHHmmss]', e, st);
    }
    return null;
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
