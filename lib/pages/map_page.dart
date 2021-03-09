import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_app/bloc/mapa/mapa_bloc.dart';
import 'package:mapas_app/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';

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
      body: BlocBuilder<MiUbicacionBloc, MiUbicacionState>(
          builder: (_, state) => crearMapa(state)),
    );
  }

  Widget crearMapa(MiUbicacionState state) {
    if (!state.existeUbicacion) return Text('Ubicando...');
    final mapaBloc = BlocProvider.of<MapaBloc>(context);
    final cameraPosition = CameraPosition(
      target: state.ubicacion,
      zoom: 15,
      tilt: 90.0,
      bearing: 30.0,
    );
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: mapaBloc.initMap
    );
  }
}