import 'dart:io';

class MatrixUtilities {
  // Check if all columns in given matrix are the same
  bool checkColumns(List<List<int>> mat) {
    int le = mat[0].length;
    for (int i = 1; i < mat.length; i++) {
      if (mat[i].length != le) {
        return false;
      }
    }
    return true;
  }

  // Comparing size of two matrices checking if the are equal
  bool compareSize(List<List<int>> mat1, List<List<int>> mat2) {
    return (mat1.length == mat2.length && mat1[0].length == mat2[0].length);
  }

  List<int>? deleteRows() {
    final regexp = RegExp(r'(?: |, |,)');
    print('Which rows do you wish to delete?');
    final input = stdin.readLineSync();
    final listOfNumbers = input?.split(regexp).map(int.parse).toList();
    return listOfNumbers;
  }

  List<int>? deleteColumns() {
    final regexp = RegExp(r'(?: |, |,)');
    print('Which columns do you wish to delete?');
    final input = stdin.readLineSync();
    final listOfNumbers = input?.split(regexp).map(int.parse).toList();
    return listOfNumbers;
  }

  bool checkDelete(List<List<int>> matrix, List<int> delRows,
      List<int> delCols) {
    if (delRows.any((e) => e < matrix.length) &&
        delCols.any((e) => e < matrix[0].length)) {
      return true;
    }
    else {
      throw FormatException(
          'Check that rows and columns selected are within the matrix.');
    }
  }






}








