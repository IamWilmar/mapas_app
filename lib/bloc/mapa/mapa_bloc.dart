import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'mapa_event.dart';
part 'mapa_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaState> {
  MapaBloc() : super(new MapaState());

  GoogleMapController _mapController;

  void initMap(GoogleMapController controller){
    if(!state.mapaListo){
      this._mapController = controller;
      add(OnMapaListo());
    }
  }

  @override
  Stream<MapaState> mapEventToState(
    MapaEvent event,
  ) async* {
    if(event is OnMapaListo){
      print('mapa Listo');
      yield state.copyWith(mapaListo: true);
    }
  }
}
