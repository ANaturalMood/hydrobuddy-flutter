import 'dart:typed_data';

import 'package:ml_linalg/dtype.dart';
import 'package:ml_linalg/matrix.dart';
import 'package:ml_linalg/vector.dart';

class LeastSquaresSolver {
  static Float64List? solve(Float64List a, int rows, int cols, Float64List b) {
    try {
      final matrix = Matrix.fromFlattenedList(
        a,
        rows,
        cols,
        dtype: DType.float64,
      );
      final ata = matrix.transpose() * matrix;
      final atb = matrix.transpose() * Matrix.column(b, dtype: DType.float64);
      final xMatrix = ata.solve(atb);
      final result = xMatrix.asFlattenedList;
      return Float64List.fromList(result);
    } catch (e) {
      return null;
    }
  }

  static double residual(
    Float64List a,
    int rows,
    int cols,
    Float64List x,
    Float64List b,
  ) {
    final matrix = Matrix.fromFlattenedList(
      a,
      rows,
      cols,
      dtype: DType.float64,
    );
    final bVec = Vector.fromList(b, dtype: DType.float64);
    final axMatrix = matrix * Matrix.column(x, dtype: DType.float64);
    final axVec = axMatrix.toVector();
    final diff = axVec - bVec;
    return diff.norm();
  }
}
