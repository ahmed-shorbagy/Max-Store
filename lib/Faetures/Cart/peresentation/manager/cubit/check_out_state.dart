part of 'check_out_cubit.dart';

sealed class CheckOutState extends Equatable {
  const CheckOutState();

  @override
  List<Object> get props => [];
}

final class CheckOutInitial extends CheckOutState {}

final class CheckOuLoading extends CheckOutState {}

final class CheckOutSuccess extends CheckOutState {}

final class CheckOutFaluire extends CheckOutState {
  final String errMessage;

  const CheckOutFaluire(this.errMessage);
}
