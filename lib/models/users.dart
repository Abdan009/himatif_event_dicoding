part of 'models.dart';

class Users extends Equatable {
  final int id;
  static String token;
  final String name,
      email,
      phoneNumber,
      photoURL,
      majors,
      studyProgram,
      yearGeneration,
      tokenNotif,
      roles,
      gender,
      address;

  final DateTime timeCreate, timeUpdate;
  Users({
    this.id,
    @required this.email,
    @required this.name,
    @required this.majors,
    @required this.studyProgram,
    @required this.yearGeneration,
    @required this.photoURL,
    @required this.phoneNumber,
    @required this.roles,
    @required this.gender,
    @required this.address,
    @required this.tokenNotif,
    this.timeCreate,
    this.timeUpdate,
  });
  @override
  List<Object> get props => [
        id,
        name,
        email,
        phoneNumber,
        photoURL,
        majors,
        studyProgram,
        tokenNotif,
        yearGeneration,
        roles,
        timeCreate,
        timeUpdate,
        gender,
        address
      ];

  Users copyWith({
    String email,
    String name,
    String phoneNumber,
    String photoURL,
    String majors,
    String studyProgram,
    String yearGeneration,
    String gender,
    String address,
    String tokenNotif,
  }) {
    return Users(
        id: this.id,
        email: this.email,
        name: name ?? this.name,
        roles: this.roles,
        majors: majors ?? this.majors,
        studyProgram: studyProgram ?? this.studyProgram,
        yearGeneration: yearGeneration ?? this.yearGeneration,
        tokenNotif: tokenNotif ?? this.tokenNotif,
        photoURL: photoURL ?? this.photoURL,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        timeCreate: this.timeCreate,
        timeUpdate: timeUpdate ?? this.timeUpdate);
  }
}

List<Users> mockUser = [
  Users(
    id: 1,
    email: 'abdanmaruf@gmail.com',
    name: 'Dadan',
    majors: 'Teknik Informatika',
    studyProgram: 'D4 RPL',
    yearGeneration: '2018',
    photoURL:
        'https://akcdn.detik.net.id/visual/2021/05/17/artis-indo-hitz-di-luar-negerisumberinstagramcomhesselstevenwong_169.jpeg?w=480&q=90',
    phoneNumber: '08971613199',
    roles: 'mahasiswa',
    tokenNotif: 'test',
    gender: 'L',
    address: 'Majalengka',
  ),
  Users(
    id: 2,
    email: 'maruf@gmail.com',
    name: 'Abdan',
    majors: 'Teknik Informatika',
    studyProgram: 'D4 RPL',
    yearGeneration: '2018',
    photoURL:
        'https://asset-a.grid.id/crop/0x0:0x0/360x240/photo/2019/10/22/3877025586.jpg',
    phoneNumber: '08971613199',
    roles: 'mahasiswa',
    tokenNotif: 'test',
    gender: 'L',
    address: 'Majalengka',
  ),
  Users(
    id: 3,
    email: 'abdan@gmail.com',
    name: 'Abdan Dadan',
    majors: 'Teknik Informatika',
    studyProgram: 'D4 RPL',
    yearGeneration: '2018',
    photoURL:
        'https://asset-a.grid.id/crop/0x0:0x0/360x240/photo/2019/10/22/3877025586.jpg',
    phoneNumber: '08971613199',
    roles: 'mahasiswa',
    tokenNotif: 'test',
    gender: 'L',
    address: 'Majalengka',
  ),
];
