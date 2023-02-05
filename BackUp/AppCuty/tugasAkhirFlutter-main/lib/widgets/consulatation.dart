import 'package:flutter/material.dart';
import 'package:tugas_akhir_flutter/widgets/date_range.dart';

class ConsulatationCard extends StatelessWidget {
  final String name;
  final String cuti;
  final Color color;
  const ConsulatationCard({
    super.key,
    required this.name,
    required this.color,
    required this.cuti,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 270,
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.black87,
                  radius: 21,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const <Widget>[
                    Text(
                      "8:45",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    Text(
                      "Jan 30",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  cuti,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DateRange(),
                        ));
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green[300]),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))))),
                  child: const Text(
                    "Ajukan CUTI",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}


//  @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 155,
//       height: 180,
//       decoration: BoxDecoration(
//           color: color,
//           borderRadius: const BorderRadius.all(Radius.circular(20))),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 const CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   radius: 21,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: const <Widget>[
//                     Text(
//                       "8:45",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 13),
//                     ),
//                     Text(
//                       "Jan 30 2023",
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     )
//                   ],
//                 )
//               ],
//             ),
//             const Spacer(),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 OutlinedButton(
//                   onPressed: (() {}),
//                   style: ButtonStyle(
//                       foregroundColor: MaterialStatePropertyAll(Colors.white),
//                       backgroundColor:
//                           MaterialStateProperty.all(Colors.green[300]),
//                       shape: MaterialStateProperty.all(
//                           const RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20))))),
//                   child: const Text(
//                     "Ajukan Cuti",
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

