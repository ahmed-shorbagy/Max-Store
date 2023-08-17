part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryModel> categoriesList;

  const CategorySuccess(this.categoriesList);
}

final class CategoryFaluire extends CategoryState {
  final String errMessage;

  const CategoryFaluire(this.errMessage);
}
