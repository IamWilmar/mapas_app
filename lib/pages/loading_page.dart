import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geoLocator;
import 'package:mapas_app/helpers/helpers.dart';
import 'package:mapas_app/pages/acceso_gps_page.dart';
import 'package:mapas_app/pages/map_page.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print("===========>>>>>>>>> $state");
    if (state == AppLifecycleState.resumed) {
      if (await geoLocator.Geolocator.isLocationServiceEnabled() && await Permission.location.isGranted)
        Navigator.pushReplacement(
            context, navegarMapaFafeIn(context, MapPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsLocation(context),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data),
                  MaterialButton(
                    color: Colors.purple[800],
                    child: Text('Listo', style: TextStyle(color: Colors.white)),
                    onPressed: ()async{
                      await checkGpsLocation(context);
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(strokeWidth: 2.0),
            );
          }
        },
      ),
    );
  }

  Future checkGpsLocation(BuildContext context) async {
    //Permisos gps
    final permisoGps = await Permission.location.isGranted;
    final gpsActivo = await geoLocator.Geolocator.isLocationServiceEnabled();
    //Gps activo
    if (permisoGps && gpsActivo) {
      Navigator.pushReplacement(context, navegarMapaFafeIn(context, MapPage()));
      return '';
    } else if (!permisoGps) {
      Navigator.pushReplacement(
          context, navegarMapaFafeIn(context, AccesoGpsPage()));
      return 'Es necesario el permiso GPS';
    } else {
      return 'Active el GPS';
    }
    //Navigator.pushReplacement(context, navegarMapaFafeIn(context, AccesoGpsPage()));
  }
}
