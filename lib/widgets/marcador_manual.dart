part of 'widgets.dart';

class MarcadorManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        //Boton
        Positioned(
          top: 70,
          left: 20,
          child: CircleAvatar(
            maxRadius: 25,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black87),
              onPressed: () {
                //TODO: hacer algo
              },
            ),
          ),
        ),

        //Marcador
        Center(
          child: Transform.translate(
            offset: Offset(0.0, -20),
            child: Icon(
              Icons.location_on,
              size: 50,
            ),
          ),
        ),

        //Boton de confirmar destino
        Positioned(
          bottom: 70,
          left: 40,
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
      ],
    );
  }
}
