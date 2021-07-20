part of 'models.dart';

enum StatusEvent { publish, panding, cenceled }

class EventInfo extends Equatable {
  final int id, idUser;
  final String name,
      cost,
      posterEvent,
      description,
      category,
      location,
      benefits,
      requirements,
      organizer,
      contactOrganizer;
  final StatusEvent status;
  final Users user;
  final DateTime timeCreate, timeUpdate, timeStart, timeReglimit;
  EventInfo({
    this.id,
    this.user,
    @required this.idUser,
    @required this.name,
    @required this.cost,
    this.posterEvent,
    @required this.description,
    @required this.category,
    @required this.location,
    @required this.benefits,
    @required this.requirements,
    @required this.timeStart,
    @required this.timeReglimit,
    @required this.status,
    @required this.organizer,
    @required this.contactOrganizer,
    this.timeCreate,
    this.timeUpdate,
  });
  @override
  List<Object> get props => [
        id,
        idUser,
        name,
        cost,
        description,
        posterEvent,
        category,
        location,
        benefits,
        requirements,
        user,
        organizer,
        contactOrganizer,
        timeCreate,
        timeUpdate,
        timeStart,
        timeReglimit
      ];

  EventInfo copyWith({
    int id,
    String name,
    String cost,
    String posterEvent,
    String cotegory,
    String location,
    String benefits,
    String requirements,
    StatusEvent status,
    String description,
    String organizer,
    String contactOrganizer,
    Users user,
    DateTime timeUpdate,
    DateTime timeStart,
    DateTime timeReglimit,
  }) {
    return EventInfo(
      id: id ?? this.id,
      idUser: this.idUser,
      user: user ?? this.user,
      name: name ?? this.name,
      cost: cost ?? this.cost,
      posterEvent: posterEvent ?? this.posterEvent,
      description: description ?? this.description,
      category: category ?? this.category,
      location: location ?? this.location,
      benefits: benefits ?? this.benefits,
      requirements: requirements ?? this.requirements,
      timeStart: timeStart ?? this.timeStart,
      timeReglimit: timeReglimit ?? this.timeReglimit,
      status: status ?? this.status,
      timeCreate: this.timeCreate,
      timeUpdate: timeUpdate ?? this.timeUpdate,
      contactOrganizer: contactOrganizer ?? this.contactOrganizer,
      organizer: organizer ?? this.organizer,
    );
  }

  String statusToString() {
    switch (this.status) {
      case StatusEvent.panding:
        {
          return "Panding";
        }
        break;
      case StatusEvent.publish:
        {
          return "Publish";
        }
        break;
      case StatusEvent.cenceled:
        {
          return "Cenceled";
        }
        break;
      default:
        {
          return "Error";
        }
    }
  }
}

List<EventInfo> mockEvent = [
  EventInfo(
    id: 1,
    idUser: 1,
    name: 'Seminar Nasional',
    cost: 'Gratiss',
    posterEvent:
        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/business-seminar-conference-event-flyer-design-template-87e2e95fed8cb80b4f858225dd3f8c11_screen.jpg?ts=1566608712',
    description: 'Seminar Inovasi SDM dan Iptek Nuklir',
    category: 'Seminar',
    location: 'Daring',
    benefits: 'E-Sertifikast\nIlmu yang bermanfaat\nrelasi',
    requirements: 'Mahasiswa',
    timeStart: DateTime.utc(
      2021,
      7,
      17,
      8,
    ),
    timeReglimit: DateTime.utc(
      2021,
      7,
      16,
      0,
    ),
    status: StatusEvent.publish,
    organizer: 'HIMATIF',
    contactOrganizer: '089713199',
  ),
  EventInfo(
    id: 2,
    idUser: 1,
    name: 'Lomba Poster Malibu',
    cost: 'Gratiss',
    posterEvent:
        'https://i2.wp.com/eventapaaja.com/wp-content/uploads/2017/08/IMG_6548.jpg?fit=834%2C1280&ssl=1',
    description: 'Seminar Inovasi SDM dan Iptek Nuklir',
    category: 'Lomba',
    location: 'Daring',
    benefits: 'E-Sertifikast\nIlmu yang bermanfaat\nrelasi',
    requirements: 'Mahasiswa',
    timeStart: DateTime.utc(
      2021,
      7,
      20,
      8,
    ),
    timeReglimit: DateTime.utc(
      2021,
      7,
      19,
      0,
    ),
    status: StatusEvent.publish,
    organizer: 'HIMATIF',
    contactOrganizer: '089713199',
  ),
  EventInfo(
    id: 3,
    idUser: 1,
    name: 'Seminar Nasional 3',
    cost: 'Gratiss',
    posterEvent:
        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/seminar-event-flyer-design-template-f060da7abdede6a4aa845a8848dcfbc9_screen.jpg?ts=1566606813',
    description: 'Seminar Inovasi SDM dan Iptek Nuklir',
    category: 'Seminar',
    location: 'Daring',
    benefits: 'E-Sertifikast\nIlmu yang bermanfaat\nrelasi',
    requirements: 'Mahasiswa',
    timeStart: DateTime.utc(
      2021,
      7,
      26,
      8,
    ),
    timeReglimit: DateTime.utc(
      2021,
      7,
      24,
      0,
    ),
    status: StatusEvent.publish,
    organizer: 'HIMATIF',
    contactOrganizer: '089713199',
  ),
  EventInfo(
    id: 4,
    idUser: 1,
    name: 'Seminar Nasional 3',
    cost: 'Gratiss',
    posterEvent:
        'https://jadwalevent.web.id/wp-content/uploads/2020/02/The-2nd-Hospital-Procurement-Forum-Expo-2020.jpg',
    description: 'Seminar Inovasi SDM dan Iptek Nuklir',
    category: 'Seminar',
    location: 'Daring',
    benefits: 'E-Sertifikast\nIlmu yang bermanfaat\nrelasi',
    requirements: 'Mahasiswa',
    timeStart: DateTime.utc(
      2021,
      7,
      10,
      8,
    ),
    timeReglimit: DateTime.utc(
      2021,
      7,
      9,
      0,
    ),
    status: StatusEvent.panding,
    organizer: 'HIMATIF',
    contactOrganizer: '089713199',
  ),
  EventInfo(
    id: 5,
    idUser: 1,
    name: 'Seminar Nasional 4',
    cost: 'Gratiss',
    posterEvent:
        'https://www.digits.id/wp-content/uploads/2019/03/darmajaya-event-724x1024.jpeg',
    description: 'Seminar Inovasi SDM dan Iptek Nuklir',
    category: 'Seminar',
    location: 'Daring',
    benefits: 'E-Sertifikast\nIlmu yang bermanfaat\nrelasi',
    requirements: 'Mahasiswa',
    timeStart: DateTime.utc(
      2021,
      7,
      29,
      8,
    ),
    timeReglimit: DateTime.utc(
      2021,
      7,
      28,
      0,
    ),
    status: StatusEvent.panding,
    organizer: 'HIMATIF',
    contactOrganizer: '089713199',
  ),
  EventInfo(
    id: 6,
    idUser: 1,
    name: 'Seminar Nasional 5',
    cost: 'Gratiss',
    posterEvent:
        'https://eventsurabaya.net/wp-content/uploads/2021/03/MP-ES-Musawarah-Kerja-Nasional-IMAKAHI-ke-XXIII-Feat-Seminar-Nasional-Minat-Proffesi-Weka-Pet-Animal-PC-IMAKAHI-UWKS-2-Copy.jpg',
    description: 'Seminar Inovasi SDM dan Iptek Nuklir',
    category: 'Seminar',
    location: 'Daring',
    benefits: 'E-Sertifikast\nIlmu yang bermanfaat\nrelasi',
    requirements: 'Mahasiswa',
    timeStart: DateTime.utc(
      2021,
      7,
      2,
      8,
    ),
    timeReglimit: DateTime.utc(
      2021,
      7,
      1,
      0,
    ),
    status: StatusEvent.cenceled,
    organizer: 'HIMATIF',
    contactOrganizer: '089713199',
  ),
];
