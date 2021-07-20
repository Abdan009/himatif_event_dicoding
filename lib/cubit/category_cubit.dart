import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:himatif_event_info/models/models.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> addCategory(CategoryEvent category) async {
    emit(
      CategoryLoaded((state as CategoryLoaded).listCategory + [category]),
    );
  }

  Future<void> getListCategory() async {
    emit(
      CategoryLoaded([CategoryEvent(name: 'Semua')] + mockCategory),
    );
  }

  Future<void> updateCategory(CategoryEvent category) async {
    List<CategoryEvent> listCategory =
        (state as CategoryLoaded).listCategory.map((value) {
      if (category.id == value?.id) {
        return category;
      } else {
        return value;
      }
    }).toList();
    emit(CategoryLoaded(listCategory));
  }

  Future<void> deleteCategory(int id) async {
    List<CategoryEvent> listCategory = (state as CategoryLoaded)
        .listCategory
        .where((element) => element.id != id)
        .toList();
    emit(CategoryLoaded(listCategory));
  }

  void selectedCategory(String category) {
    emit(CategoryLoaded((state as CategoryLoaded).listCategory,
        category: category));
  }
}
