class ApiClient {
  final String baseUrl = 'http://13.214.207.172:8000/';
  String getFullUrl(String endpoint) {
    return baseUrl.endsWith('/')
        ? '$baseUrl${endpoint.startsWith('/') ? endpoint.substring(1) : endpoint}'
        : '$baseUrl${endpoint.startsWith('/') ? endpoint : '/$endpoint'}';
  }
}

class Endpoint {
  static const String login = 'api/v1/login/';
  static const String register = 'api/v1/register/';
  static const String otp = 'api/v1/verify-otp/';
  static const String listRequest = 'api/v1/list-request-blood/';
  static const String listDonated = 'api/v1/list-donation-blood/';
  static const String requestBlood = 'api/v1/request-blood/';
  static const String bloodDonation = '/api/v1/blood-donation/';
  static const String forget = 'api/v1/forgot-password/';
  static const String profile = 'api/v1/user/profile/';
  static const String accept = 'api/v1/status/accepted/';
  static const String history = 'api/v1/blood-history/';
}
