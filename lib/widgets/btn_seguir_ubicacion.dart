part of 'widgets.dart';

class BtnSeguirUbicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapaBloc, MapaState>(
        builder: (context, state) => this._crearBoton(context));
  }

  Widget _crearBoton(BuildContext context) {
    final mapaBloc = BlocProvider.of<MapaBloc>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(
            mapaBloc.state.seguirUbicacion
                ? Icons.accessibility_new
                : Icons.directions_run,
            color: Colors.black,
          ),
          onPressed: () {
            mapaBloc.add(OnSeguirUbicacion());
          },
        ),
      ),
    );
  }
}
