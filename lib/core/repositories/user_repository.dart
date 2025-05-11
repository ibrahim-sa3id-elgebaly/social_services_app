import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../api/api_dio/api_consumer.dart';
import '../api/api_dio/end_ponits.dart';
import '../api/errors/exceptions.dart';
import '../cache/cache_helper.dart';
import '../model/auth_model/sign_in_model.dart';
import '../model/auth_model/sign_up_model.dart';
import '../model/auth_model/user_model.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});

  Future<Either<String, SignInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      final user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token.toString());
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        isFromData: false,
        data: {
          ApiKey.firstName: firstName,
          ApiKey.lastName: lastName,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.phone: phone,
          ApiKey.gender:gender
        },
      );
      final signUPModel = SignUpModel.fromJson(response);
      return Right(signUPModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final response = await api.get(
        EndPoint.getUserDataEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, UserModel>> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String gender,
    XFile? profilePic,
  }) async {
    try {
      final formData = FormData();
      formData.fields.addAll([
        MapEntry(ApiKey.firstName, firstName),
        MapEntry(ApiKey.lastName, lastName),
        MapEntry(ApiKey.phone, phone),
        MapEntry(ApiKey.gender, gender),
      ]);
      if (profilePic != null) {
        formData.files.add(MapEntry(
          ApiKey.profilePic,
          await MultipartFile.fromFile(
            profilePic.path,
            filename: profilePic.name.split('/').last,
          ),
        ));
      }
      final response = await api.post(
        EndPoint.updateProfile,
        data: formData,
        isFromData: true,
      );
      return Right(UserModel.fromJson(response));
    } on DioException catch (e) { // Changed from ServerException to DioException
      return Left(e.response?.data[ApiKey.errorMessage] ?? e.message ?? 'Unknown error');
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await api.post(
        EndPoint.forgotPassword,
        data: {
          ApiKey.email: email,
        },
      );
      return Right(response[ApiKey.message]);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final response = await api.post(
        EndPoint.resetPassword,
        data: {
          ApiKey.email: email,
          ApiKey.otp: otp,
          ApiKey.newPassword: newPassword,
        },
      );
      return Right(response[ApiKey.message]);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
