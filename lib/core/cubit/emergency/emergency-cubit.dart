import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_serveces_app/core/cubit/emergency/emergency_state.dart';
import '../../repositories/user_repository.dart';

class EmergencyCubit extends Cubit<EmergencyState> {
  EmergencyCubit(this.userRepository) : super(EmergencyInitial());

  final UserRepository userRepository;

  GlobalKey<FormState> postEmergencyFormKey = GlobalKey();
  TextEditingController postEmergencyName = TextEditingController();
  TextEditingController postEmergencyGovernorate = TextEditingController();
  TextEditingController postEmergencyPhoneNumber = TextEditingController();
  TextEditingController postEmergencyDescription = TextEditingController();
  TextEditingController postEmergencyUrgent = TextEditingController();
//--------------------------------------------------------------------

  GlobalKey<FormState> registrationFormKey = GlobalKey();
  TextEditingController registrationName = TextEditingController();
  TextEditingController registrationAge = TextEditingController();
  TextEditingController registrationGender = TextEditingController();
  TextEditingController registrationPhoneNumber = TextEditingController();
//-------------------------------------------------------------------------


  postEmergency() async {
    emit(PostProblemLoading());
    final response = await userRepository.postEmergency(
      name: postEmergencyName.text,
      governorate: postEmergencyGovernorate.text,
      phone: postEmergencyPhoneNumber.text,
      description: postEmergencyDescription.text,
      urgent: true,
    );
    response.fold(
          (errMessage) => emit(PostProblemFailure(errMessage: errMessage)),
          (emergencyModel) => emit(PostProblemSuccess()),
    );
  }

  registrationForm(String id) async {
    emit(RegistrationLoading());
    final response = await userRepository.registrations(
      name: registrationName.text,
      age: registrationAge.text,
      gender: registrationGender.text,
      phone: registrationPhoneNumber.text,
      id: id,
    );
    response.fold(
          (errMessage) => emit(RegistrationFailure(errMessage: errMessage)),
          (emergencyModel) => emit(RegistrationSuccess()),
    );
  }




}