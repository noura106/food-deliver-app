part of 'basket_bloc.dart';

@immutable
abstract class BasketState  extends Equatable{
  const BasketState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BasketLoading extends BasketState {}
class BasketLoaded extends BasketState {
  final Basket basket;
  const BasketLoaded({this.basket=const Basket()});
  @override
  // TODO: implement props
  List<Object?> get props => [basket];
}
