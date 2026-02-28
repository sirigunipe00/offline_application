import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:offline_first/core/core.dart';

class StringUtils {
  static bool equals(String? str1, String? str2) {
    if (str1 == null || str2 == null) return false;
    return str1 == str2;
  }

  static bool equalsIgnoreCase(String? str1, String? str2) {
    if (str1 == null || str2 == null) return false;
    return str1.trim().toLowerCase() == str2.trim().toLowerCase();
  }

  static String concat(String? s1, [String? s2, String? s3]) {
    return [s1, s2, s3].where((e) => !e.isNull).join('');
  }

  static bool validateEmail(String value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(pattern).hasMatch(value);
  }

  static bool validateGSTIn(String value) {
    const pattern =
        r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
    return RegExp(pattern).hasMatch(value);
  }

  static bool validateIFSCode(String value) {
    const pattern = r'^[A-Za-z]{4}0[A-Z0-9a-z]{7}$';
    return !RegExp(pattern).hasMatch(value);
  }

  static bool validateUPI(String upi) {
    final regex = RegExp(r'^[\w.\-_]{2,256}@[a-zA-Z]{2,64}$');
    return regex.hasMatch(upi);
  }

  static bool isValidIndianMobile(String number) {
    // Regex pattern: ^[6-9] - starts with 6-9, \d{9} - followed by 9 digits
    return RegExp(r'^[6-9]\d{9}$').hasMatch(number);
  }

  static bool isIPv4(String baseUrl) {
    final ipv4Pattern = RegExp(r'^(\d{1,3}\.){3}\d{1,3}(:\d+)?$');
    return ipv4Pattern.hasMatch(baseUrl);
  }

  static int docStatusInt(String? status) {
    switch (status?.toLowerCase()) {
      case 'draft':
        return 0;
      case 'submitted':
        return 1;
      case 'all':
        return 2;
      default:
        return 0;
    }
  }

  static String docStatuslogistic(String? status) {
    switch (status?.toLowerCase()) {
      case 'transporter confirmed':
        return 'transporter confirmed';
      case 'transporter rejected':
        return 'transporter rejected';
      case 'pending from transporter':
        return 'pending from transporter';
      case 'draft':
        return 'draft';
      case 'submitted':
      return '1';
      case 'all':
        return '4';
      default:
        return '';
    }
  }
  static String docStatusVehicle(String? status){
    switch (status?.toLowerCase()){
      case 'reported':
      return 'reported';
      case 'cancelled':
      return 'cancelled';
      case 'rejected':
      return 'rejected';
      case 'draft':
      return '';
      case 'all':
      return '4';
      case 'submitted':
      return '1';
      default:
      return '';
    }
  }

  static bool isValidFSSAINumber(String fssaiNumber) {
    final fssaiRegExp = RegExp(r'^\d{14}$');
    return fssaiRegExp.hasMatch(fssaiNumber);
  }

  static String readPlacemark(Placemark? placeMark) {
    final name = placeMark?.name;
    final subLocality = placeMark?.subLocality;
    final locality = placeMark?.locality;
    final administrativeArea = placeMark?.administrativeArea;
    final postalCode = placeMark?.postalCode;
    final country = placeMark?.country;
    return [
      name,
      subLocality,
      locality,
      administrativeArea,
      postalCode,
      country,
    ].nonNulls.join(', ');
  }

  static String docStatus(int status) {
    if (status == 0) {
      return 'Draft';
    } else if (status == 1) {
      return 'Submitted';
    } else {
      return 'Draft';
    }
  }
}

extension StringExentions on String? {
  bool get containsValidValue =>
      this != null && (this!.trim().isNotEmpty) && this!.trim() != 'null';

  bool get doesNotHaveValue => !containsValidValue; 
bool get doesHaveValue => containsValidValue;  


  String get valueOrEmpty => this ?? '';
  String get valueOrNil => this ?? '-Nil-';

  Either<Failure, T> asFailure<T>() => left(Failure(error: this!));

  bool equals(String? str) => StringUtils.equals(this, str);

  bool equalsIgnoreCase(String? str) => StringUtils.equals(this, str);

  bool get isValidNum => containsValidValue && num.tryParse(this!) != null;

  String concat([String? s2, String? s3]) => StringUtils.concat(this, s2, s3);

  bool get isSVG => containsValidValue && this!.split('.').last == 'svg';

  bool containsIgnoreCase(String? other) {
    if (this == null || other == null) {
      return false;
    }
    return this!.toLowerCase().contains(other.toLowerCase());
  }
}
