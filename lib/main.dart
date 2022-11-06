import 'dart:io';

import 'package:untitled2/matrix_operations.dart';
import 'dart:math';

import 'package:untitled2/matrix_utilities.dart';
import 'package:untitled2/matrix.dart';
import 'package:untitled2/shape_square.dart';

void main() {
  MatrixOperations mo = MatrixOperations();
  MatrixUtilities mu = MatrixUtilities();
  Matrix mat = Matrix();

  List<List<int>> matrix1 = [[2,3,4],[5,7,9],[7,8,9]];
  List<List<int>>? matrix2 = [[5,6,7],[9,8,9],[6,5,3]];
  List<List<int>> matrix = [[7,7,8],[7,8,9],[8,9,0]];


  print('Summation: \n${matrix1 + matrix2} \n${mo.summation(matrix1, matrix2)} \n==========================');

  print('\nScalar Multiplication:');
  print('\nPlease enter the scalar value you wish to find the product of $matrix with:');
  int scalar = int.parse(stdin.readLineSync()!);
  print('$scalar x $matrix = ${mo.scalarProd(matrix, scalar)} \n==========================');

  print('\nTranspose:\n Transpose of the matrix $matrix is:\n ${mo.matrixTranspose(matrix)}\n==========================');

  print('\nDot Product:\n $matrix1 * $matrix2 = ${mo.matrixMultiplication(matrix1, matrix2)}\n==========================');

  List<List<int>> originalMatrix = [[7,1,1],[7,2,2],[7,3,3]];
  List<int>? deleteRows = mu.deleteRows();
  List<int>? deleteColumns = mu.deleteColumns();
  print('\nSub-Matrix: \nSub-matrix of $originalMatrix = ${mo.subMatrix(originalMatrix, deleteRows!, deleteColumns!)}\n==========================');

  print('\nDiagonal Matrix: \n${mo.forLoopSqr(ShapeSquare.diagonal, 5)}\n==========================');
  print('\nLower Triangular Matrix: \n${mo.forLoopSqr(ShapeSquare.lowerTriangle, 5)}\n==========================');
  print('\nUpper Triangular Matrix: \n${mo.forLoopSqr(ShapeSquare.upperTriangle, 5)}\n==========================');

  List<List<int>> squareMatrix = [[1,2,1],[2,2,3],[3,4,3]];
  print('\nDeterminant:\nThe determinant of matrix $squareMatrix is: \n${mo.determinant(squareMatrix)}');
}