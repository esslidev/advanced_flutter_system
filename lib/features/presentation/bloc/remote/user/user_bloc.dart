import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/user.dart';
import 'user_event.dart';
import 'user_state.dart';

class RemoteUserBloc extends Bloc<RemoteUserEvent, RemoteUserState> {
  final UserUseCases _userUseCases;

  RemoteUserBloc(this._userUseCases) : super(const RemoteUserInitial()) {
    on<GetUser>(onGetUser);
  }

  void onGetUser(GetUser event, Emitter<RemoteUserState> emit) async {
    emit(const RemoteUserLoading());
    final dataState = await _userUseCases.getUser(
      accessToken: event.accessToken,
    );
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteUserLoaded(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteUserError(dataState.error!));
    }
  }

  /*void onGetUser(GetUser event, Emitter<RemoteUserState> emit) async {
    emit(const RemoteUserLoading());
    final dataState =
        await _userUseCases.getUser(event.thirdPartyId, event.accessToken);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteUserLoaded(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteUserError(dataState.error!));
    }
  }*/

  /*void onSetUser(SetUser event, Emitter<RemoteUserState> emit) async {
    emit(const RemoteUserSaving());
    final dataState = await _userUseCases.setUser(event.user);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteUserSaved(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteUserError(dataState.error!));
    }
  }*/

  /* void onUpdateUser(UpdateUser event, Emitter<RemoteUserState> emit) async {
    emit(const RemoteUserUpdating());
    final dataState = await _userUseCases.updateUser(event.user);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteUserUpdated(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteUserError(dataState.error!));
    }
  }*/
}
