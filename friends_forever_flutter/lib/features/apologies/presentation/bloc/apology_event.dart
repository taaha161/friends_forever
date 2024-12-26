part of 'apology_bloc.dart';

@immutable
sealed class ApologyEvent {}

final class GetSentApologies extends ApologyEvent {}

final class GetRecievedApologies extends ApologyEvent {}

final class SendApology extends ApologyEvent {
  final ApologyModel apology;

  SendApology(this.apology);
}

final class RemoveApology extends ApologyEvent {
  final int id;

  RemoveApology(this.id);
}

final class GetApologyById extends ApologyEvent {
  final int id;

  GetApologyById(this.id);
}

final class UpdateApology extends ApologyEvent {
  final ApologyModel apology;

  UpdateApology(this.apology);
}
