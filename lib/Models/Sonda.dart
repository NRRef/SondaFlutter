class Sonda {
  final String topRight;
  final String initialPosition;
  final String movementInstructions;
  int _xMax, _yMax, _positionX, _positionY;
  String _initialDirection;
  Sonda(String this.topRight, String this.initialPosition,
      String this.movementInstructions) {
    if (!validateInputs()) {
      throw ("Invalid Input at: \n" +
          topRight +
          "\n" +
          initialPosition +
          "\n" +
          movementInstructions);
    }
    print(validateInputs());
    setInitialProperties();
  }

  bool validateInputs() {
    bool isValidTopRight = RegExp(r"^[0-9]+\s[0-9]+$").hasMatch(topRight);
    bool isValidInitialPosition =
        RegExp(r"^[0-9]+\s[0-9]+\s(N|E|S|W)$").hasMatch(initialPosition);
    bool isValidmovementInstructions =
        RegExp(r"^(L|R|M)*$").hasMatch(movementInstructions);
    return isValidTopRight &&
        isValidInitialPosition &&
        isValidmovementInstructions;
  }

  void setInitialProperties() {
    var splitedTopRight = topRight.split(" ");
    var splitedInitialPosition = initialPosition.split(" ");

    this._xMax = int.parse(splitedTopRight[0]);
    this._yMax = int.parse(splitedTopRight[1]);

    this._positionX = int.parse(splitedInitialPosition[0]);
    this._positionY = int.parse(splitedInitialPosition[1]);
    _initialDirection = splitedInitialPosition[2];
  }

  void turn() {}
  void moveForward() {}
  void executeMovementInstructions() {}
  get actualState {}
}
