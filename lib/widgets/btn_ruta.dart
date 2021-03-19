part of 'widgets.dart';

class BtnRuta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapaBloc = BlocProvider.of<MapaBloc>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(
            Icons.alt_route,
            color: Colors.black,
          ),
          onPressed: () {
            mapaBloc.add(OnShowRoute());
          },
        ),
      ),
    );
  }
}
