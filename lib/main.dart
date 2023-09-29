import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/app.dart';


void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Paint Example'),
//         ),
//         body: Center(
//           child: CustomPaint(
//             size: Size(200, 200), // Kích thước của hình thang
//             painter: RPSCustomPainter(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //Add this CustomPaint widget to the Widget Tree

// //Copy this CustomPainter code to the Bottom of the File
// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final double screenWidth = size.width;
//     final double screenHeight = size.height;

//     final double desiredWidth = 0.8 * screenWidth;
//     final double desiredHeight = 0.6 * screenHeight;

//     final double scaleFactorX = desiredWidth / 72; // 72 is the original width
//     final double scaleFactorY =
//         desiredHeight / 50; // 107 is the original height

//     final Path path_0 = Path();
//     path_0.moveTo(
//         8.964099884033203 * scaleFactorX, 106.4999237060547 * scaleFactorY);
//     path_0.cubicTo(
//         4.29368782043457 * scaleFactorX,
//         106.4804458618164 * scaleFactorY,
//         0.5 * scaleFactorX,
//         102.6748962402344 * scaleFactorY,
//         0.5 * scaleFactorX,
//         98 * scaleFactorY);
//     path_0.lineTo(0.5 * scaleFactorX, 9 * scaleFactorY);
//     path_0.cubicTo(
//         0.5 * scaleFactorX,
//         4.313085556030273 * scaleFactorY,
//         4.313085556030273 * scaleFactorX,
//         0.5 * scaleFactorY,
//         9 * scaleFactorX,
//         0.5 * scaleFactorY);
//     path_0.lineTo(63 * scaleFactorX, 0.5 * scaleFactorY);
//     path_0.cubicTo(
//         67.6869125366211 * scaleFactorX,
//         0.5 * scaleFactorY,
//         71.5 * scaleFactorX,
//         4.313085556030273 * scaleFactorY,
//         71.5 * scaleFactorX,
//         9 * scaleFactorY);
//     path_0.lineTo(
//         70.99488830566406 * scaleFactorX, 89.70274353027344 * scaleFactorY);
//     path_0.cubicTo(
//         70.994873046875 * scaleFactorX,
//         92.29167175292969 * scaleFactorY,
//         70.59986877441406 * scaleFactorX,
//         94.1204833984375 * scaleFactorY,
//         69.75175476074219 * scaleFactorX,
//         95.46122741699219 * scaleFactorY);
//     path_0.cubicTo(
//         68.84049987792969 * scaleFactorX,
//         96.90184783935547 * scaleFactorY,
//         67.33798217773438 * scaleFactorX,
//         97.81922149658203 * scaleFactorY,
//         65.15833282470703 * scaleFactorX,
//         98.26557159423828 * scaleFactorY);
//     path_0.lineTo(
//         8.964099884033203 * scaleFactorX, 106.4999237060547 * scaleFactorY);
//     path_0.close();

//     final Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
//     paint_0_fill.color = Color(0xff707070).withOpacity(1.0);
//     canvas.drawPath(path_0, paint_0_fill);

//     final Path path_1 = Path();
//     path_1.moveTo(9 * scaleFactorX, 1 * scaleFactorY);
//     path_1.cubicTo(
//         4.588783264160156 * scaleFactorX,
//         1 * scaleFactorY,
//         1 * scaleFactorX,
//         4.588783264160156 * scaleFactorY,
//         1 * scaleFactorX,
//         9 * scaleFactorY);
//     path_1.lineTo(1 * scaleFactorX, 98 * scaleFactorY);
//     path_1.cubicTo(
//         1 * scaleFactorX,
//         102.3875198364258 * scaleFactorY,
//         4.550605773925781 * scaleFactorX,
//         105.96142578125 * scaleFactorY,
//         8.92926025390625 * scaleFactorX,
//         105.9996948242188 * scaleFactorY);
//     path_1.lineTo(
//         65.07173919677734 * scaleFactorX, 97.77291870117188 * scaleFactorY);
//     path_1.cubicTo(
//         68.97383117675781 * scaleFactorX,
//         96.96944427490234 * scaleFactorY,
//         70.494873046875 * scaleFactorX,
//         94.7050552368164 * scaleFactorY,
//         70.494873046875 * scaleFactorX,
//         89.70587158203125 * scaleFactorY);
//     path_1.lineTo(
//         70.49488830566406 * scaleFactorX, 89.69961547851562 * scaleFactorY);
//     path_1.lineTo(71 * scaleFactorX, 8.996269226074219 * scaleFactorY);
//     path_1.cubicTo(
//         70.99781036376953 * scaleFactorX,
//         4.586898803710938 * scaleFactorY,
//         67.40986633300781 * scaleFactorX,
//         1 * scaleFactorY,
//         63 * scaleFactorX,
//         1 * scaleFactorY);
//     path_1.lineTo(9 * scaleFactorX, 1 * scaleFactorY);
//     path_1.moveTo(9 * scaleFactorX, 0 * scaleFactorY);
//     path_1.lineTo(63 * scaleFactorX, 0 * scaleFactorY);
//     path_1.cubicTo(
//         67.9705581665039 * scaleFactorX,
//         0 * scaleFactorY,
//         72 * scaleFactorX,
//         4.029426574707031 * scaleFactorY,
//         72 * scaleFactorX,
//         9 * scaleFactorY);
//     path_1.lineTo(
//         71.494873046875 * scaleFactorX, 89.70587158203125 * scaleFactorY);
//     path_1.cubicTo(
//         71.494873046875 * scaleFactorX,
//         94.67642974853516 * scaleFactorY,
//         70.05675506591797 * scaleFactorX,
//         97.77825927734375 * scaleFactorY,
//         65.24475860595703 * scaleFactorX,
//         98.75823974609375 * scaleFactorY);
//     path_1.lineTo(9 * scaleFactorX, 107 * scaleFactorY);
//     path_1.cubicTo(
//         4.029426574707031 * scaleFactorX,
//         107 * scaleFactorY,
//         0 * scaleFactorX,
//         102.9705581665039 * scaleFactorY,
//         0 * scaleFactorX,
//         98 * scaleFactorY);
//     path_1.lineTo(0 * scaleFactorX, 9 * scaleFactorY);
//     path_1.cubicTo(
//         0 * scaleFactorX,
//         4.029426574707031 * scaleFactorY,
//         4.029426574707031 * scaleFactorX,
//         0 * scaleFactorY,
//         9 * scaleFactorX,
//         0 * scaleFactorY);
//     path_1.close();

//     final Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
//     paint_1_fill.color = Color(0xff707070).withOpacity(1.0);
//     canvas.drawPath(path_1, paint_1_fill);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
