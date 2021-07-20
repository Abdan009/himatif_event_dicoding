part of 'responsive.dart';

class HomePageRes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplatePages(
      body1: HomePageMobile(),
      body2: HomePageWeb(),
    );
  }
}
