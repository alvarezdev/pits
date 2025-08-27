

// import 'package:pits/screen/screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   static const routeName = 'home-screen';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Pits Home"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(Dimensions.d30),
//           child: Column(
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(
//                     context,
//                     RegisterVehicleScreen.routeName,
//                   );
//                 },
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Center(
//                     child: Text(AppLocalizations.of(context).enter_vehicle),
//                   ),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(
//                     context,
//                     PayTicketScreen.routeName,
//                   );
//                 },
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Center(
//                     child: Text(AppLocalizations.of(context).exit_vehicle),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
