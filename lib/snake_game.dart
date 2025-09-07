import 'package:flutter/material.dart';

class SnakeGame extends StatelessWidget {
  const SnakeGame({super.key});

  @override
  Widget build(BuildContext context) {
    // Just a placeholder grid with one "snake" square
    return Center(
      child: AspectRatio(
        aspectRatio: 1, // make it square
        child: Container(
          color: Colors.black,
          child: CustomPaint(
            painter: _SnakePainter(),
          ),
        ),
      ),
    );
  }
}

class _SnakePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintGrid = Paint()
      ..color = Colors.grey.shade800
      ..style = PaintingStyle.stroke;

    // draw a simple 10x10 grid
    const int rows = 10;
    const int cols = 10;
    final cellW = size.width / cols;
    final cellH = size.height / rows;

    for (int i = 0; i <= cols; i++) {
      final x = i * cellW;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paintGrid);
    }
    for (int j = 0; j <= rows; j++) {
      final y = j * cellH;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paintGrid);
    }

    // draw a single green square at (3,4)
    final snakePaint = Paint()..color = Colors.green;
    final rect = Rect.fromLTWH(3 * cellW, 4 * cellH, cellW, cellH);
    canvas.drawRect(rect.deflate(2), snakePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
