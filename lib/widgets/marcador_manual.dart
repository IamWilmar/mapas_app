part of 'widgets.dart';

class MarcadorManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusquedaBloc, BusquedaState>(
      builder: (context, state) {
        if (state.seleccionManual) {
          return _BuildMarcadorManual();
        } else {
          return Container();
        }
      },
    );
  }
}

class _BuildMarcadorManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        //Boton
        Positioned(
          top: 70,
          left: 20,
          child: FadeInLeft(
            duration: Duration(milliseconds: 300),
            child: CircleAvatar(
              maxRadius: 25,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black87),
                onPressed: () {
                  final busquedaBloc = BlocProvider.of<BusquedaBloc>(context);
                  busquedaBloc.add(OnDesactivarMarcadorManual());
                },
              ),
            ),
          ),
        ),
        //Marcador
        Center(
          child: Transform.translate(
            offset: Offset(0.0, -20),
            child: BounceInDown(
              child: Icon(
                Icons.location_on,
                size: 50,
              ),
            ),
          ),
        ),

        //Boton de confirmar destino
        Positioned(
          bottom: 70,
          left: 40,
          child: FadeIn(
            child: MaterialButton(
              minWidth: size.width - 120,
              color: Colors.black,
              shape: StadiumBorder(),
              elevation: 0.0,
              splashColor: Colors.transparent,
              child: Text(
                'Confirmar destino',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
