import 'package:blood_donation_mobile/pages/auth/model/forget_model.dart';
import 'package:blood_donation_mobile/pages/auth/model/login_model.dart';
import 'package:blood_donation_mobile/pages/auth/model/otp_model.dart';
import 'package:blood_donation_mobile/pages/auth/model/register_model.dart';
import 'package:blood_donation_mobile/pages/model/blood_donation_model.dart';
import 'package:blood_donation_mobile/pages/model/history_model.dart';
import 'package:blood_donation_mobile/pages/model/profile_model.dart';
import 'package:blood_donation_mobile/pages/model/request_blood_model.dart';
import 'package:blood_donation_mobile/pages/request_blood/Model/donate_model.dart';
import 'package:blood_donation_mobile/repository/api_client.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
// {"phone": "+85512221158", "password": "panha1234"}
//77225811 12345678 8821551234 123456789 7722581121234567
  final ApiClient _apiClient = ApiClient();

  ApiService({required this.dio});

  Future<LoginModel?> login(String phonenumber, String password) async {
    try {
      final url = _apiClient.getFullUrl(Endpoint.login);

      final response = await dio
          .post(url, data: {"phone": phonenumber, "password": password});

      return _handleResponse<LoginModel>(
        response,
        (data) => LoginModel.fromJson(data),
      );
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<RegisterModel?> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final url = _apiClient.getFullUrl(Endpoint.register);
      final response = await dio.post(url, data: {
        "first_name": firstName,
        "last_name": lastName,
        "phone": phoneNumber,
        "password": password,
        "confirm_password": confirmPassword,
      });
      return _handleResponse<RegisterModel>(
        response,
        (data) => RegisterModel.fromJson(data),
      );
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<OtpModel?> verifyOTP(String phonenumber, String otp) async {
    try {
      String url = _apiClient.getFullUrl(Endpoint.otp);

      Response response = await dio.post(url, data: {
        "phone": phonenumber,
        "otp": otp,
      });
      return _handleResponse<OtpModel>(
        response,
        (data) => OtpModel.fromJson(data),
      );
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<List<RequestBloodModel>> fetchRequestBlood(
      {required String token}) async {
    try {
      final url = _apiClient.getFullUrl(Endpoint.listRequest);

      final response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final data = _handleResponse<List<RequestBloodModel>>(
        response,
        (data) => List<RequestBloodModel>.from(
          (data as List).map((x) => RequestBloodModel.fromJson(x)),
        ),
      );

      // Ensure the returned data is non-null
      if (data != null) {
        return data;
      } else {
        throw Exception('Failed to fetch request blood data.');
      }
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<List<BloodDonationModel>> fetchBloodDonted(
      {required String token}) async {
    try {
      final url = _apiClient.getFullUrl(Endpoint.listDonated);

      final response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final data = _handleResponse<List<BloodDonationModel>>(
        response,
        (data) => List<BloodDonationModel>.from(
          (data as List).map((x) => BloodDonationModel.fromJson(x)),
        ),
      );
      // Ensure the returned data is non-null
      if (data != null) {
        return data;
      } else {
        throw Exception('Failed to fetch request blood data.');
      }
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<DonateModel?> donateBlood(
      {required Map<String, dynamic> data, required String token}) async {
    try {
      final url = _apiClient.getFullUrl(Endpoint.bloodDonation);

      final response = await dio.post(url,
          data: data,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return _handleResponse(response, (data) => DonateModel.fromJson(data));
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<DonateModel?> requestBlood(
      {required Map<String, dynamic> data, required String token}) async {
    try {
      final url = _apiClient.getFullUrl(Endpoint.requestBlood);

      final response = await dio.post(url,
          data: data,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return _handleResponse(response, (data) => DonateModel.fromJson(data));
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<ForgetModel?> forgetPassword(String phonenumber) async {
    try {
      final url = _apiClient.getFullUrl(Endpoint.forget);

      final response = await dio.post(
        url,
        data: {'phone': phonenumber},
      );

      return _handleResponse<ForgetModel>(
          response, (data) => ForgetModel.fromJson(data));
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<void> accecpted({required int id, required String token}) async {
    try {
      final url = _apiClient.getFullUrl("${Endpoint.accept}$id/");

      final response = await dio.put(
        url,
        data: {"status": "accepted"},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      _handleResponse<void>(
          response, (_) => null); // No return value needed for this method
      print("Request accepted successfully");
    } catch (e) {
      _handleError(e);
      rethrow; // Rethrow the error to handle it at a higher level if needed
    }
  }

  Future<ProfileModel?> fetchProfile({required String token}) async {
    try {
      final url = _apiClient.getFullUrl(Endpoint.profile);
      final response = await dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return _handleResponse<ProfileModel>(
        response,
        (data) => ProfileModel.fromJson(data),
      );
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<List<HistoryModel>> fetchHistory({required String token}) async {
    try {
      final url = _apiClient.getFullUrl(Endpoint.history);
      final response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final data = _handleResponse<List<HistoryModel>>(
        response,
        (data) => List<HistoryModel>.from(
          (data as List).map((x) => HistoryModel.fromJson(x)),
        ),
      );
      // Ensure the returned data is non-null
      if (data != null) {
        return data;
      } else {
        throw Exception('Failed to fetch request blood data.');
      }
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // Helper methods
  T? _handleResponse<T>(
    Response response,
    T Function(dynamic data) fromJson,
  ) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return fromJson(response.data);
    } else {
      throw Exception('API Error: ${response.statusCode}');
    }
  }

  void _handleError(dynamic error) {
    if (error is DioException) {
      print('Dio Error: ${error.message}');
      print('Details: ${error.response?.data}');
    } else {
      print('Unexpected Error: $error');
    }
  }
}
