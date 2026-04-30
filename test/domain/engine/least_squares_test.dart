import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hydrobuddy/domain/engine/least_squares.dart';

void main() {
  group('LeastSquaresSolver', () {
    test('identity: zero targets => zero weights', () {
      final a = Float64List.fromList([10, 5, 5, 10]);
      final b = Float64List.fromList([0, 0]);
      final x = LeastSquaresSolver.solve(a, 2, 2, b);
      expect(x, isNotNull);
      expect(x![0], closeTo(0, 0.001));
      expect(x[1], closeTo(0, 0.001));
    });

    test('exact: 2x2 system', () {
      final a = Float64List.fromList([10, 5, 5, 10]);
      final b = Float64List.fromList([100, 200]);
      final x = LeastSquaresSolver.solve(a, 2, 2, b);
      expect(x, isNotNull);
      final a1x = 10 * x![0] + 5 * x[1];
      final a2x = 5 * x[0] + 10 * x[1];
      expect(a1x, closeTo(100, 0.01));
      expect(a2x, closeTo(200, 0.01));
    });

    test('synthetic: recovers known x', () {
      final rng = Random(42);
      final a = Float64List(6);
      final xTrue = Float64List.fromList([2.5, 1.5]);
      final b = Float64List(3);
      for (int i = 0; i < 3; i++) {
        double rowSum = 0;
        for (int j = 0; j < 2; j++) {
          a[i * 2 + j] = rng.nextDouble() * 10;
          rowSum += a[i * 2 + j] * xTrue[j];
        }
        b[i] = rowSum;
      }

      final x = LeastSquaresSolver.solve(a, 3, 2, b);
      expect(x, isNotNull);
      expect(x![0], closeTo(2.5, 0.01));
      expect(x[1], closeTo(1.5, 0.01));
    });

    test('conservation: ppm_out matches ppm_in', () {
      final a = Float64List.fromList([
        38.6, 0.0, 0.0,
        0.0, 24.4, 0.0,
        13.9, 17.1, 100.0,
      ]);
      final b = Float64List.fromList([200, 150, 210]);
      final x = LeastSquaresSolver.solve(a, 3, 3, b);
      expect(x, isNotNull);

      expect(38.6 * x![0], closeTo(200, 0.01));
      expect(24.4 * x[1], closeTo(150, 0.01));
      final nTotal = 13.9 * x[0] + 17.1 * x[1] + 100.0 * x[2];
      expect(nTotal, closeTo(210, 0.01));
    });

    test('singular: does not crash', () {
      final a = Float64List.fromList([1, 2, 1, 2]);
      final b = Float64List.fromList([10, 20]);
      final x = LeastSquaresSolver.solve(a, 2, 2, b);
      if (x != null) {
        // Solution may exist for dependent rows; verify well-formed
        expect(x.length, 2);
      }
    });

    test('residual is small for exact solution', () {
      final a = Float64List.fromList([10, 5, 5, 10]);
      final b = Float64List.fromList([100, 200]);
      final x = LeastSquaresSolver.solve(a, 2, 2, b);
      final r = LeastSquaresSolver.residual(a, 2, 2, x!, b);
      expect(r, lessThan(0.01));
    });
  });
}
