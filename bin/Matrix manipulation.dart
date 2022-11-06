import 'dart:math';
import 'dart:mirrors';
import 'dart:io';

import 'package:untitled2/matrix_operations.dart';



void main() {

  MatrixOperations mo =MatrixOperations();


  print('\nDiagonal Matrix: \n${mo.squareMatOpsInput(ShapeSquare.diagonal)}\n==========================');
  print('\nLower Triangular Matrix: \n${mo.squareMatOpsInput(ShapeSquare.lowerTriangle)}\n==========================');
  print('\nUpper Triangular Matrix: \n${mo.squareMatOpsInput(ShapeSquare.upperTriangle)}\n==========================');


}

