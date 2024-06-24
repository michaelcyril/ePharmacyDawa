class AppConstants {
  static const String appName = 'Demo App';
  static const double appVersion = 1.0;

  // Shared Preference Key
  static const String token = 'token';
  static const String user = 'user';

  static const String apiBaseUrl = 'http://127.0.0.1:8000/';
  static const String mediaBaseUrl = 'http://127.0.0.1:8000';
  static const String webSocketUrl = 'ws://127.0.0.1:8000/chat-room-conversation/';
  static const String verifyPhoneUrl = 'user-management/verify-phone';
  static const String verifyOtpUrl = 'user-management/verify-otp';
  static const String cmpleteProfileUrl = 'user-management/complete-profile';
  static const String registerUserUrl = 'user-management/register-pharmacist';
  static const String getUserListUrl = 'user-management/all-users';
  static const String conversationToSeenViewUrl = 'social-management/conversation-to-seen-view';
  static const String messageViewUrl = 'social-management/message-view';
  static const String conversationListViewUrl = 'social-management/conversation-view';
  static const String insertGetDiseaseUrl = 'order-management/insert-get-desease';
  static const String deleteUpdateDiseaseUrl = 'order-management/delete-update-desease';
  static const String insertGetMedicineUrl = 'order-management/insert-get-medicine';
  static const String deleteUpdateMedicineUrl = 'order-management/delete-update-medicine';
  static const String insertGetOrderUrl = 'order-management/insert-get-order';
  static const String getOrderHistoryUrl = 'order-management/get-order-history';
  static const String deleteUpdateOrderUrl = 'order-management/delete-update-order';
  static const String insertGetPrescriptionUrl = 'prescription-management/insert-get-prescription';
  static const String deleteUpdatePrescriptionUrl = 'prescription-management/delete-update-prescription';
  static const String changePrescriptionStatusUrl = 'prescription-management/change-prescription-status';
}
