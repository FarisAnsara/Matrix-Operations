
import 'dart:io';



class Matrix {
  // Zeros matrix of any size required

  List<List<int>> emptyMatrix(rows, columns) {
    List<List<int>> matrix = List.generate(
        rows, (index) => List.generate(columns, (_) => 0));
    return matrix;
  }

  // Matrix Generation using user input
  List<List<int>> matrixGeneration(int length) {
    final regexp = RegExp(r'(?:|,)');
    print('input number of rows of matrix:');
    int? numRows = int.parse(stdin.readLineSync()!);
    List<List<int>> matrix = emptyMatrix(numRows, 0);
    for (int i = 0; i < numRows; i++) {
      print('Please enter row ${i + 1} of the matrix you wish to use:');
      final input = stdin.readLineSync();
      final listOfNumbers = input?.split(regexp).map(int.parse).toList();
      matrix[i] = listOfNumbers!;
    }
    return matrix;
  }

  List<List<int>> matrixCopy(List<List<int>> matrix) {
    var matrixCopied = emptyMatrix(matrix.length, matrix[0].length);
    for (int i = 0; i < matrix.length; i++ ){
      for (int j = 0; j < matrix[0].length; j++){
        matrixCopied[i][j] = matrix[i][j];
      }
    }
   return matrixCopied;
  }


}