import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../api/api_dio/api_consumer.dart';
import '../api/api_dio/end_ponits.dart';
import '../api/errors/exceptions.dart';
import '../api/functions/upload_image_to_api.dart';
import '../cache/cache_helper.dart';
import '../model/model_api/sign_in_model.dart';
import '../model/model_api/sign_up_model.dart';
import '../model/model_api/user_model.dart';

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
      final decodedToken = JwtDecoder.decode(user.token);
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
}
