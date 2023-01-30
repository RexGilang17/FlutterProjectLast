import 'package:flutter/material.dart';

class ConsulatationCard extends StatelessWidget {
  final String name;
  final Color color;
  const ConsulatationCard({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 180,
      decoration: BoxDecoration(
          color: color,
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
                  backgroundColor: Colors.grey,
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
                      "Jan 30 2023",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                OutlinedButton(
                  onPressed: (() {}),
                  style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green[300]),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))))),
                  child: const Text(
                    "Ajukan Cuti",
                    style: TextStyle(fontSize: 12),
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

