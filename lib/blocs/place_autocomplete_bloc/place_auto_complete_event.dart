part of 'place_auto_complete_bloc.dart';

@immutable
abstract class PlaceAutoCompleteEvent extends Equatable {
const PlaceAutoCompleteEvent();

@override
// TODO: implement props
List<Object?> get props => [];

}
class LoadPlaceAutoCompleteEvent extends PlaceAutoCompleteEvent{
  final String searchInput;
  const LoadPlaceAutoCompleteEvent({this.searchInput=''});
  @override
// TODO: implement props
  List<Object?> get props => [searchInput];
}