import 'dart:async';
import 'dart:core';
import 'main.dart';
import 'dart:core' as prefix0;
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as prefix2;
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart' ;
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:loading_alert_dialog/loading_alert_dialog.dart';
import 'package:poly/poly.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class mapPage extends StatefulWidget {
  @override
  _mapPage createState() => _mapPage();
}

class _mapPage extends State<mapPage> {
  static const kGoogleApiKey = "prj_live_sk_0c76aea744553d75a093d40c98210284a5beb9b8";
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return WillPopScope(

        onWillPop: () {  },
        child: Scaffold(
        body: Stack(

        children: <Widget>[

          GoogleMap(

            //onMapCreated: _onMapCreated,
/*            onMapCreated: (controller) {
              _controller1.complete(controller);
              mapController = controller;
              //mapController.clearMarkers();
            },
            markers: _markers,
            polylines:_polyLines,
            myLocationEnabled: true,
            polygons: Set<Polygon>.of(polygons.values),
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),*/

            myLocationButtonEnabled: false,
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
            rotateGesturesEnabled: true,
            compassEnabled: true,
            //  markers:  this.myMarker(),
          ),

        ]

        )
        )
    );
  }
  
  
}