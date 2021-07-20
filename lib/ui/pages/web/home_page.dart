part of '../pages.dart';

class HomePageWeb extends StatefulWidget {
  @override
  _HomePageWebState createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  @override
  Widget build(BuildContext context) {
    double widthLayout = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          color: accentColor4.withOpacity(0.2),
        ),
        Container(
          child: Row(
            children: [
              buildBarLeft(widthLayout),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),
                      Container(
                        margin: EdgeInsets.only(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Event',
                              style: blackTextFont.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Informasi daftar event',
                              style: blackTextFont.copyWith(),
                            ),
                            SizedBox(height: 20),
                            buildKategoriEvent(context),
                          ],
                        ),
                      ),
                      BlocBuilder<EventCubit, EventState>(
                        builder: (_, eventState) {
                          if (eventState is EventLoaded) {
                            return Expanded(
                              child: ListView(
                                children: [
                                  Wrap(
                                    children: List.generate(
                                      eventState.listEvent.length,
                                      (index) => Card(
                                        child: Container(
                                          width: (widthLayout * 0.7 -
                                                  (3 * defaultMargin)) /
                                              5,
                                          height: 300,
                                          margin: EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 190,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          eventState
                                                              .listEvent[index]
                                                              .posterEvent),
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                              Text(
                                                eventState
                                                    .listEvent[index].name,
                                                style: blackTextFont.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Batas Daftar',
                                                style: greyTextFont.copyWith(
                                                    fontSize: 12),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                eventState
                                                    .listEvent[index]
                                                    .timeReglimit
                                                    .dateAndTimeNumber,
                                                style: orangeTextFont.copyWith(
                                                    fontSize: 15),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Pelaksanaan',
                                                style: greyTextFont.copyWith(
                                                    fontSize: 12),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                eventState
                                                    .listEvent[index]
                                                    .timeStart
                                                    .dateAndTimeNumber,
                                                style: orangeTextFont.copyWith(
                                                    fontSize: 15),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Center(
                              child: SizedBox(width: 30, child: loading(4)),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container buildBarLeft(double widthLayout) {
    return Container(
      width: widthLayout * 0.2,
      height: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: defaultMargin, vertical: defaultMargin),
      margin: EdgeInsets.symmetric(
          horizontal: defaultMargin, vertical: defaultMargin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (_, userState) => ListView(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              (userState as UsersLoaded).user.photoURL),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      (userState as UsersLoaded).user.name,
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Admin HIMATIF',
                    style: greyTextFont,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  buildItemMenuWeb(
                    title: 'Event',
                    icon: Icons.date_range,
                    color: mainColor,
                  ),
                  buildItemMenuWeb(
                    title: 'Kategori Event',
                    icon: Icons.category,
                  ),
                  buildItemMenuWeb(
                    title: 'Pengguna',
                    icon: Icons.people,
                  ),
                  buildItemMenuWeb(
                    title: 'Pengaturan',
                    icon: Icons.settings,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell buildItemMenuWeb({
    Function onTap,
    @required String title,
    @required IconData icon,
    Color color,
  }) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: color ?? accentColor2,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: greyTextFont.copyWith(
                      fontWeight: FontWeight.bold, color: color),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildKategoriEvent(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (_, categoryState) {
        if (categoryState is CategoryLoaded) {
          List<CategoryEvent> listCategory = categoryState.listCategory;
          return Container(
            height: 27,
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: ListView.builder(
              itemCount: listCategory.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  context
                      .read<CategoryCubit>()
                      .selectedCategory(listCategory[index].name);
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: (index == 0) ? defaultMargin : 10,
                      right: (index == listCategory.length - 1)
                          ? defaultMargin
                          : 0),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: (categoryState.category == listCategory[index].name)
                        ? mainColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: (categoryState.category == listCategory[index].name)
                        ? null
                        : Border.all(color: mainColor),
                  ),
                  child: Center(
                    child: Text(
                      listCategory[index].name,
                      style: whiteTextFont.copyWith(
                          color: (categoryState.category ==
                                  listCategory[index].name)
                              ? Colors.white
                              : mainColor),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return loading(2);
        }
      },
    );
  }
}
