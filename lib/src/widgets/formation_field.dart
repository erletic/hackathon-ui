import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../models/tactics.dart';

class FormationField extends StatefulWidget {
  final Formation formation;
  final OffensiveTactics offensiveTactics;
  final DefensiveTactics defensiveTactics;

  const FormationField({
    super.key,
    required this.formation,
    required this.offensiveTactics,
    required this.defensiveTactics,
  });

  @override
  State<FormationField> createState() => _FormationFieldState();
}

class _FormationFieldState extends State<FormationField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return CustomPaint(
          size: Size(width, height),
          painter: FormationFieldPainter(
            formation: widget.formation,
            offensiveTactics: widget.offensiveTactics,
            defensiveTactics: widget.defensiveTactics,
            animation: _controller,
            colorScheme: Theme.of(context).colorScheme,
          ),
        );
      },
    );
  }
}

class FormationFieldPainter extends CustomPainter {
  final Formation formation;
  final OffensiveTactics offensiveTactics;
  final DefensiveTactics defensiveTactics;
  final Animation<double> animation;
  final ColorScheme colorScheme;

  FormationFieldPainter({
    required this.formation,
    required this.offensiveTactics,
    required this.defensiveTactics,
    required this.animation,
    required this.colorScheme,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorScheme.surfaceContainerHighest
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    _drawField(canvas, size);
    _drawFormation(canvas, size);
    _drawTacticalLines(canvas, size);
  }

  void _drawField(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = colorScheme.outline.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      linePaint,
    );

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      linePaint,
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      30,
      linePaint,
    );

    final penaltyBoxHeight = size.height * 0.2;
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.3,
        0,
        size.width * 0.4,
        penaltyBoxHeight,
      ),
      linePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.3,
        size.height - penaltyBoxHeight,
        size.width * 0.4,
        penaltyBoxHeight,
      ),
      linePaint,
    );
  }

  void _drawFormation(Canvas canvas, Size size) {
    final positions = formation.positions;
    final lineCount = positions.length;

    final widthFactor = offensiveTactics.width / 100;
    final depthOffset = _getDepthOffset();

    final playerPaint = Paint()
      ..color = colorScheme.primary
      ..style = PaintingStyle.fill;

    final playerBorderPaint = Paint()
      ..color = colorScheme.onPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (int lineIndex = 0; lineIndex < lineCount; lineIndex++) {
      final playersInLine = positions[lineIndex].length > 0
          ? positions[lineIndex][0]
          : 1;

      final baseY = size.height * (0.1 + (lineIndex * 0.8 / lineCount)) + depthOffset;

      final pressingAnimation = _getPressingAnimation(lineIndex);
      final y = baseY - pressingAnimation;

      for (int playerIndex = 0; playerIndex < playersInLine; playerIndex++) {
        final xSpacing = size.width * widthFactor;
        final startX = (size.width - xSpacing) / 2;
        final x = startX + (xSpacing / (playersInLine + 1)) * (playerIndex + 1);

        canvas.drawCircle(Offset(x, y), 12, playerPaint);
        canvas.drawCircle(Offset(x, y), 12, playerBorderPaint);
      }
    }
  }

  double _getDepthOffset() {
    switch (defensiveTactics.depth) {
      case DefensiveDepth.veryDeep:
        return 40;
      case DefensiveDepth.deep:
        return 20;
      case DefensiveDepth.balanced:
        return 0;
      case DefensiveDepth.high:
        return -20;
      case DefensiveDepth.veryHigh:
        return -40;
    }
  }

  double _getPressingAnimation(int lineIndex) {
    final pressingFactor = _getPressingFactor();
    if (pressingFactor == 0) return 0;

    final animValue = animation.value;
    final lineOffset = lineIndex * 0.2;
    return math.sin((animValue + lineOffset) * math.pi) * 15 * pressingFactor;
  }

  double _getPressingFactor() {
    switch (defensiveTactics.pressing) {
      case PressingIntensity.none:
        return 0;
      case PressingIntensity.low:
        return 0.3;
      case PressingIntensity.medium:
        return 0.6;
      case PressingIntensity.high:
        return 0.9;
      case PressingIntensity.aggressive:
        return 1.2;
    }
  }

  void _drawTacticalLines(Canvas canvas, Size size) {
    final widthFactor = defensiveTactics.width / 100;
    final linePaint = Paint()
      ..color = colorScheme.primary.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final xSpacing = size.width * widthFactor;
    final leftX = (size.width - xSpacing) / 2;
    final rightX = leftX + xSpacing;

    final path = Path();
    path.moveTo(leftX, size.height * 0.2);
    path.lineTo(leftX, size.height * 0.8);
    path.moveTo(rightX, size.height * 0.2);
    path.lineTo(rightX, size.height * 0.8);

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(FormationFieldPainter oldDelegate) {
    return oldDelegate.formation != formation ||
        oldDelegate.offensiveTactics != offensiveTactics ||
        oldDelegate.defensiveTactics != defensiveTactics;
  }
}
