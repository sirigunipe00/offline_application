import 'package:offline_first/core/di/injector.dart';

final _reqisteredUrl = $sl.get<Urls>(instanceName: 'baseUrl');

class Urls {
  factory Urls.uat() =>
      const Urls('http://65.21.243.18:8000/api');
  factory Urls.shaktiHormannUAT() =>
   const Urls('https://shaktihormannuat.easycloud.co.in/api');
   factory Urls.live() =>  const Urls('https://shaktihormannlive.easycloud.co.in/api');

  const Urls(this.url);


  static String filepath(String path) {
    return '${baseUrl.replaceAll('api', '')}/${path.replaceAll('/private', '').replaceAll("///", '/')}';
  }


  final String url;

  static bool get isTest => Uri.parse(
    _reqisteredUrl.url,
  ).authority.split('.').first.toLowerCase().contains('uat');
  static final baseUrl = _reqisteredUrl.url;
  static final jsonWs = '$baseUrl/resource';
  static final cusWs = '$baseUrl/method';

  static final login = '$cusWs/login';
  static final getList = '$cusWs/frappe.client.get_list';
  static final getUsers = '$cusWs/shaktihormann.api.getUsers';

  static final appVersion = '$cusWs/easy_common.api.get_app_version';

  static final companyName = '$jsonWs/Company';
  static final dashBoard = '$cusWs/shaktihormann.api.gate_dashboard';
  static final createGateEntry = '$cusWs/shaktihormann.api.createGateEntry';
  static final submitGateEntry = '$cusWs/shaktihormann.api.submit_gate_entry';
  static final createGateExit = '$cusWs/shaktihormann.api.create_gate_exit';
  static final submitGateExit = '$cusWs/shaktihormann.api.submit_gate_exit';
  static final createLogisticPlanning =
      '$cusWs/shaktihormann.api.create_logistic_planning';
  static final updateLogisticPlanning =
      '$cusWs/shaktihormann.api.update_logistic_planning';
  static final updateTransport='$cusWs/shaktihormann.api.update_logistic_transporter';
  static final createVehicleReporting='$cusWs/shaktihormann.api.create_vehicle_reporting';
  static final updateVehicleReporting = '$cusWs/shaktihormann.api.update_vehicle_reporting';
  static final createLoadingConfirmation ='$cusWs/shaktihormann.api.create_items_loaded';
    static final updateLoading = '$cusWs/shaktihormann.api.update_items_loaded';
  static final submitLoadingConfirmation = '$cusWs/shaktihormann.api.submit_vehicle_loading';
  static final getLodedItems = '$cusWs/shaktihormann.api.get_loaded_items';
  static final createproofOfDelivery = '$cusWs/shaktihormann.api.createProofOfDelivery';
  static final submitproofOfDelivery = '$cusWs/shaktihormann.api.submitProofOfDelivery';
  static final creategateManagement = '$cusWs/shaktihormann.api.create_gate_management';
  static final submitGateManagement = '$cusWs/shaktihormann.api.submit_and_update_gate_management';


  static final oneSignal = '$cusWs/onesignal.api.save_user_device';


}
