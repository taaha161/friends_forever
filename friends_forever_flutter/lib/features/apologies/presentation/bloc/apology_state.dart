part of 'apology_bloc.dart';

@immutable
sealed class ApologyState {}

final class ApologyInitial extends ApologyState {}

final class ApologyLoading extends ApologyState {}

final class SentApologiesLoaded extends ApologyState {
  final List<ApologyModel> apologies;

  SentApologiesLoaded(this.apologies);

  SentApologiesLoaded copyWith({
    List<ApologyModel>? apologies,
  }) {
    return SentApologiesLoaded(
      apologies ?? this.apologies,
    );
  }
}

final class ApologyLoaded extends ApologyState {
  final ApologyModel apology;

  ApologyLoaded(this.apology);

  ApologyLoaded copyWith({
    ApologyModel? apology,
  }) {
    return ApologyLoaded(
      apology ?? this.apology,
    );
  }
}

final class RecievedApologiesLoaded extends ApologyState {
  final List<ApologyModel> apologies;

  RecievedApologiesLoaded(this.apologies);

  RecievedApologiesLoaded copyWith({
    List<ApologyModel>? apologies,
  }) {
    return RecievedApologiesLoaded(
      apologies ?? this.apologies,
    );
  }
}

final class ApologyError extends ApologyState {
  final String message;

  ApologyError(this.message);
}

final class ApologySent extends ApologyState {}
