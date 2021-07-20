part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<CategoryEvent> listCategory;
  final String category;
  CategoryLoaded(this.listCategory, {this.category = 'Semua'});
  @override
  List<Object> get props => [listCategory, category];
}
