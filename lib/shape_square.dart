
enum ShapeSquare {
  diagonal,
  lowerTriangle,
  upperTriangle;
  bool func(int i, int j) {
    switch (this) {
      case ShapeSquare.diagonal:
        return i == j;
      case ShapeSquare.lowerTriangle:
        return i >= j;
      case ShapeSquare.upperTriangle:
        return i >= j;
      default:
        return false;
    }
  }

  Function func2() {
    switch (this) {
      case ShapeSquare.diagonal:
        return (int i, int j) => i == j;
      case ShapeSquare.lowerTriangle:
        return (int i, int j) => i >= j;
      case ShapeSquare.upperTriangle:
        return (int i, int j) => i >= j;
      default:
        return (int i, int j) => 0;
    }
  }
}
