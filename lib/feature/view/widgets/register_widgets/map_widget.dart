// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
//
//
//
// class OpenStreetMapExample extends StatelessWidget {
//    const OpenStreetMapExample({super.key});
//   final LatLng _initialPosition = const LatLng(51.505, -0.09);
//  // Coordinates for London
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 400,
//       height: 800,
//       child: FlutterMap(
//         options: MapOptions(
//           initialCenter: _initialPosition,
//           minZoom: 13.0,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: const ['a', 'b', 'c'],
//             userAgentPackageName: 'com.example.app', // Required in newer versions
//           ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: _initialPosition,
//                 child: Icon(
//                   Icons.location_on,
//                   color: Colors.red,
//                   size: 40.0,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
