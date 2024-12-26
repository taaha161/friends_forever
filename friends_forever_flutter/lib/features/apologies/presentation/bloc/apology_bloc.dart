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
    on<GetSentApologies>(_onGetSentApologies);
    on<GetRecievedApologies>(_onGetRecievedApologies);
    on<SendApology>(_onSendApology);
    on<UpdateApology>(_onUpdateApology);
    on<RemoveApology>(_onDeleteApology);
    on<GetApologyById>(_onGetApologyById);
  }

  _onGetSentApologies(GetSentApologies event, emit) async {
    emit(ApologyLoading());
    final result = await getSentApologiesUsecase(NoParam());
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (apologies) {
        emit(SentApologiesLoaded(apologies));
      },
    );
  }

  _onGetApologyById(GetApologyById event, emit) async {
    emit(ApologyLoading());
    final result = await getApologyByIdUsecase(event.id);
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (apology) {
        emit(ApologyLoaded(apology));
      },
    );
  }

  _onGetRecievedApologies(GetRecievedApologies event, emit) async {
    emit(ApologyLoading());
    final result = await getRecievedApologiesUsecase(NoParam());
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (apologies) {
        emit(RecievedApologiesLoaded(apologies));
      },
    );
  }

  _onSendApology(SendApology event, emit) async {
    SentApologiesLoaded? savedState;

    if (state is SentApologiesLoaded) {
      savedState = state as SentApologiesLoaded;
    }
    emit(ApologyLoading());
    final result = await sendApologyUsecase(event.apology);
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (_) {
        if (savedState != null) {
          savedState.apologies.add(event.apology);
          emit(savedState);
        } else {
          emit(ApologySent());
        }
      },
    );
  }

  _onUpdateApology(UpdateApology event, emit) async {
    SentApologiesLoaded? savedState;

    if (state is SentApologiesLoaded || state is RecievedApologiesLoaded) {
      savedState = state as SentApologiesLoaded;
    }
    final result = await updateApologyUsecase(event.apology);
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (_) {
        if (savedState != null) {
          final index = savedState.apologies
              .indexWhere((element) => element.id == event.apology.id);
          savedState.apologies[index] = event.apology;
          emit(savedState);
        } else {
          emit(ApologyInitial());
        }
      },
    );
  }

  _onDeleteApology(RemoveApology event, emit) async {
    SentApologiesLoaded? savedState;

    if (state is SentApologiesLoaded) {
      savedState = state as SentApologiesLoaded;
    }
    emit(ApologyLoading());
    final result = await deleteApologyUsecase(event.id);
    result.fold(
      (failure) => emit(ApologyError(failure.message)),
      (_) {
        if (savedState != null) {
          savedState.apologies.removeWhere((element) => element.id == event.id);
          emit(savedState);
        } else {
          emit(ApologyInitial());
        }
      },
    );
  }
}
