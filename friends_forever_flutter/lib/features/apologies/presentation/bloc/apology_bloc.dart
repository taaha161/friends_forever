import 'package:bloc/bloc.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/apologies/data/models/apology_model.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/delete_apology_usecase.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/get_apology_by_id.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/get_recieved_apologies_usecase.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/get_sent_apologies_usecase.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/send_apology_usecase.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/update_apology_usecase.dart';
import 'package:meta/meta.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'apology_event.dart';
part 'apology_state.dart';

class ApologyBloc extends Bloc<ApologyEvent, ApologyState> {
  GetSentApologiesUsecase getSentApologiesUsecase;
  GetRecievedApologiesUsecase getRecievedApologiesUsecase;
  SendApologyUsecase sendApologyUsecase;
  UpdateApologyUsecase updateApologyUsecase;
  DeleteApologyUsecase deleteApologyUsecase;
  GetApologyByIdUseCase getApologyByIdUsecase;

  ApologyBloc(
      {required this.deleteApologyUsecase,
      required this.getRecievedApologiesUsecase,
      required this.getSentApologiesUsecase,
      required this.sendApologyUsecase,
      required this.getApologyByIdUsecase,
      required this.updateApologyUsecase})
      : super(ApologyInitial()) {
    on<ApologyEvent>((event, emit) async {
      if (event is GetSentApologies || event is GetRecievedApologies) {
        if (event is GetRecievedApologies) {
          await _onGetRecievedApologies(event, emit);
        } else {
          await _onGetSentApologies(event as GetSentApologies, emit);
        }
      }
    }, transformer: sequential());
    on<SendApology>(_onSendApology);
    on<UpdateApology>(_onUpdateApology);
    on<RemoveApology>(_onDeleteApology);
    on<GetApologyById>(_onGetApologyById);
  }

  _onGetSentApologies(GetSentApologies event, emit) async {
    ApologiesLoaded? savedState;

    if (state is ApologiesLoaded) {
      savedState = state as ApologiesLoaded;
    }
    emit(ApologyLoading());
    final result = await getSentApologiesUsecase.call(NoParam());
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (apologies) {
        if (savedState != null) {
          emit(savedState.copyWith(sentApologies: apologies));
          emit(savedState);
        } else {
          emit(
              ApologiesLoaded(sentApologies: apologies, recievedApologies: []));
        }
      },
    );
  }

  _onGetApologyById(GetApologyById event, emit) async {
    emit(ApologyLoading());
    final result = await getApologyByIdUsecase.call(event.id);
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (apology) {
        emit(ApologyLoaded(apology));
      },
    );
  }

  _onGetRecievedApologies(GetRecievedApologies event, emit) async {
    ApologiesLoaded? savedState;

    if (state is ApologiesLoaded) {
      savedState = state as ApologiesLoaded;
    }
    emit(ApologyLoading());
    final result = await getRecievedApologiesUsecase.call(NoParam());
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (apologies) {
        if (savedState != null) {
          savedState.copyWith(sentApologies: apologies);
          emit(savedState);
        } else {
          emit(
              ApologiesLoaded(recievedApologies: apologies, sentApologies: []));
        }
      },
    );
  }

  _onSendApology(SendApology event, emit) async {
    ApologiesLoaded? savedState;

    if (state is ApologiesLoaded) {
      savedState = state as ApologiesLoaded;
    }
    emit(ApologyLoading());
    final result = await sendApologyUsecase.call(event.apology);
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (_) {
        if (savedState != null) {
          var sentApologies = savedState.sentApologies;
          sentApologies.add(event.apology);

          emit(savedState.copyWith(sentApologies: sentApologies));
        } else {
          emit(ApologySent());
        }
      },
    );
  }

  _onUpdateApology(UpdateApology event, emit) async {
    ApologiesLoaded? savedState;

    if (state is ApologiesLoaded) {
      savedState = state as ApologiesLoaded;
    }

    final result = await updateApologyUsecase.call(event.apology);
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (_) {
        if (savedState != null) {
          int index = savedState.recievedApologies
              .indexWhere((element) => element.id == event.apology.id);
          if (index != -1) {
            savedState.recievedApologies[index] = event.apology;
          }

          index = savedState.sentApologies
              .indexWhere((element) => element.id == event.apology.id);
          if (index != -1) {
            savedState.sentApologies[index] = event.apology;

            emit(savedState);
          }
        } else {
          emit(ApologyInitial());
        }
      },
    );
  }

  _onDeleteApology(RemoveApology event, emit) async {
    ApologiesLoaded? savedState;

    if (state is ApologiesLoaded) {
      savedState = state as ApologiesLoaded;
    }
    emit(ApologyLoading());
    final result = await deleteApologyUsecase.call(event.id);
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (_) {
        if (savedState != null) {
          savedState.recievedApologies
              .removeWhere((element) => element.id == event.id);

          savedState.sentApologies
              .removeWhere((element) => element.id == event.id);

          emit(savedState);
        } else {
          emit(ApologyInitial());
        }
      },
    );
  }
}
