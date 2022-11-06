import 'dart:math';

import 'package:untitled2/matrix_utilities.dart';
import 'package:untitled2/matrix.dart';
import 'package:untitled2/shape_square.dart';

class MatrixOperations {
  MatrixUtilities mu = MatrixUtilities();
  Matrix mat = Matrix();

  //Task 1: Summation
  List<List<int>> summation(List<List<int>> matrix1, List<List<int>> matrix2) {
    if (!mu.checkColumns(matrix1) ||
        !mu.checkColumns(matrix2) ||
        !mu.compareSize(matrix1, matrix2)) {
      throw FormatException(
          'Please make sure the number of rows and columns of both matrices are the same.');
    }
    var matrixSum = mat.matrixCopy(matrix1);
    for (int column = 0; column < matrix1.length; column++) {
      for (int row = 0; row < matrix1[0].length; row++) {
        matrixSum[column][row] += matrix2[column][row];
      }
    }
    print('$matrix1 + $matrix2 \n=');
    return matrixSum;
  }

  //Task 2: Scalar Product
  List<List<int>> scalarProd(List<List<int>> matrix, int scalar) {
    if (!mu.checkColumns(matrix)) {
      throw FormatException(
          'An error has occurred.\nPlease check that all columns of the matrix are the same size.');
    }
    var matrixScalarProd = mat.matrixCopy(matrix);
    for (int row = 0; row < matrix.length; row++) {
      for (int column = 0; column < matrix[0].length; column++) {
        matrixScalarProd[row][column] *= scalar;
      }
    }
    return matrixScalarProd;
  }

  //Task 3: Transpose
  List<List<int>> matrixTranspose(List<List<int>> matrix) {
    List<List<int>> matrixTrans =
        mat.emptyMatrix(matrix[0].length, matrix.length);
    if (!mu.checkColumns(matrix)) {
      throw FormatException(
          "This transpose couldn't be done. \nCheck that all columns of the matrix have the same number of inputs.");
    }
    for (int column = 0; column < matrix.length; column++) {
      for (int row = 0; row < matrix[1].length; row++) {
        matrixTrans[row][column] = matrix[column][row];
      }
    }
    return matrixTrans;
  }

  //Task 4:  Multiplication
  List<List<int>> matrixMultiplication(
      List<List<int>> matrix1, List<List<int>> matrix2) {
    List<List<int>> matrixMult =
        mat.emptyMatrix(matrix1.length, matrix2[0].length);
    if (matrix1[0].length != matrix2.length ||
        !mu.checkColumns(matrix1) ||
        !mu.checkColumns(matrix2)) {
      throw FormatException(
          "This dot product couldn't be done as the first matrix's number of rows doesn't match the number of columns of the second matrix");
    }
    for (int row = 0; row < matrix1.length; row++) {
      for (int column = 0; column < matrix2[0].length; column++) {
        var total = 0;
        for (int num = 0; num < matrix1[0].length; num++) {
          total += matrix1[row][num] * matrix2[num][column];
        }
        matrixMult[row][column] = total;
      }
    }
    return matrixMult;
  }

  //Task 5: Sub-Matrix
  List<List<int>> subMatrix(List<List<int>> originalMatrix,
      List<int> deleteRows, List<int> deleteColumns) {
    int lengthRowsNew = originalMatrix.length - deleteRows.length;
    int lengthColumnsNew = originalMatrix[0].length - deleteColumns.length;
    List<List<int>> newMatrix =
        mat.emptyMatrix(lengthRowsNew, lengthColumnsNew);
    if (!mu.checkColumns(originalMatrix) ||
        !mu.checkDelete(originalMatrix, deleteRows, deleteColumns)) {
      throw FormatException(
          'Check that all columns have the same number of values');
    }
    var rowIndex = 0;
    for (int rows = 0; rows < originalMatrix.length; rows++) {
      if (!deleteRows.contains(rows)) {
        var columnIndex = 0;
        for (int columns = 0; columns < originalMatrix[0].length; columns++) {
          if (!deleteColumns.contains(columns)) {
            newMatrix[rowIndex][columnIndex] = originalMatrix[rows][columns];
            columnIndex++;
          }
        }
        rowIndex++;
      }
    }
    return newMatrix;
  }

  //Task 6: Square Matrix Manipulation

  List<List<int>> forLoopSqr(ShapeSquare inp, int size) {
    List<List<int>> matrix = mat.emptyMatrix(size, size);
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[0].length; j++) {
        if (inp.func(i, j)) {
          matrix[i][j] = 3;
        }
      }
    }

    return matrix;
  }

  //Task 7: Determinant
  int determinant(List<List<int>> squareMatrix) {
    int n = squareMatrix.length;
    int det = 0;
    if (!mu.checkColumns(squareMatrix)) {
      throw FormatException(
          'Check that all columns have the same number of values');
    }
    if (n == 2) {
      det += (squareMatrix[0][0] * squareMatrix[1][1]) -
          (squareMatrix[0][1] * squareMatrix[1][0]);
    } else {
      for (int i = 0; i < n; i++) {
        List<List<int>> sub = subMatrix(squareMatrix, [0], [i]);
        int coef = squareMatrix[0][i];
        det += pow(-1, i).toInt() * coef * determinant(sub);
      }
    }
    return det;
  }
}
