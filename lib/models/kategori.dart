part of 'models.dart';

class CategoryEvent extends Equatable {
  final int id;
  final String name;
  final DateTime timeCreate;
  CategoryEvent({
    this.id,
    @required this.name,
    this.timeCreate,
  });

  @override
  List<Object> get props => [id, name, timeCreate];
}

List<CategoryEvent> mockCategory = [
  CategoryEvent(
    id: 1,
    name: 'Lomba',
  ),
  CategoryEvent(
    id: 2,
    name: 'Kelas',
  ),
  CategoryEvent(
    id: 3,
    name: 'Conference',
  ),
  CategoryEvent(
    id: 4,
    name: 'Beasiswa',
  ),
  CategoryEvent(
    id: 5,
    name: 'Magang',
  ),
  CategoryEvent(
    id: 6,
    name: 'Volunteering',
  ),
  CategoryEvent(
    id: 7,
    name: 'Pertunjukan',
  ),
  CategoryEvent(
    id: 8,
    name: 'Lainnya',
  ),
];
