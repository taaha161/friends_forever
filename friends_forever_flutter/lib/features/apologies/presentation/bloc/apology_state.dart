part of 'apology_bloc.dart';

@immutable
sealed class ApologyState {}

final class ApologyInitial extends ApologyState {}

final class ApologyLoading extends ApologyState {}

final class ApologiesLoaded extends ApologyState {
  final List<ApologyModel> sentApologies;
  final List<ApologyModel> recievedApologies;

  ApologiesLoaded(
      {required this.recievedApologies, required this.sentApologies});

  ApologiesLoaded copyWith({
    List<ApologyModel>? sentApologies,
    List<ApologyModel>? recievedApologies,
  }) {
    return ApologiesLoaded(
      recievedApologies: recievedApologies ?? this.recievedApologies,
      sentApologies: sentApologies ?? this.sentApologies,
    );
  }
}

final class ApologyLoaded extends ApologyState {
  final ApologyModel apology;

  ApologyLoaded(this.apology);
}

final class ApologyError extends ApologyState {
  final String message;

  ApologyError(this.message);
}

final class ApologySent extends ApologyState {}
