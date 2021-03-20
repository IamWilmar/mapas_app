import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_app/bloc/mapa/mapa_bloc.dart';
import 'package:mapas_app/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:mapas_app/widgets/widgets.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MiUbicacionBloc ubicacionBloc;

  @override
  void initState() {
    ubicacionBloc = BlocProvider.of<MiUbicacionBloc>(context, listen: false);
    ubicacionBloc.iniciarSeguimiento();
    super.initState();
  }

  @override
  void dispose() {
    ubicacionBloc.cancelarSegumiento();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<MiUbicacionBloc, MiUbicacionState>(
            builder: (_, state) => crearMapa(state),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: SearchBar(),
          ),
          MarcadorManual(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          BtnUbicacion(),
          BtnRuta(),
          BtnSeguirUbicacion(),
        ],
      ),
    );
  }

  Widget crearMapa(MiUbicacionState state) {
    if (!state.existeUbicacion) return Text('Ubicando...');
    final mapaBloc = BlocProvider.of<MapaBloc>(context);
    mapaBloc.add(OnLocationUpdate(state.ubicacion));
    final cameraPosition = CameraPosition(
      target: state.ubicacion,
      zoom: 15,
      tilt: 90.0,
      bearing: 30.0,
    );
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationEnabled: true,
      compassEnabled: false,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: mapaBloc.initMap,
      polylines: mapaBloc.state.polylines.values.toSet(),
      onCameraMove: (cameraPosition) {
        mapaBloc.add(OnMovioMapa(cameraPosition.target));
      },
    );
  }
}
