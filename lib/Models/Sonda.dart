import 'package:meta/meta.dart';

class Sonda {
  final String topRight;
  final String initialPosition;
  final String movementInstructions;

  int _xMax, _yMax, _positionX, _positionY;
  String _actualDirection;
  List<String> movements = new List();
  @visibleForTesting
  Sonda.blank(this.topRight, this.initialPosition, this.movementInstructions);

  Sonda(this.topRight, this.initialPosition, this.movementInstructions) {
    if (!validateInputs()) {
      throw ("Invalid Input at: \n" +
          topRight +
          "\n" +
          initialPosition +
          "\n" +
          movementInstructions);
    }
    _setInitialProperties();
    _executeMovementInstructions();
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

  void _setInitialProperties() {
    var splitedTopRight = topRight.split(" ");
    var splitedInitialPosition = initialPosition.split(" ");

    this._xMax = int.parse(splitedTopRight[0]);
    this._yMax = int.parse(splitedTopRight[1]);

    this._positionX = int.parse(splitedInitialPosition[0]);
    this._positionY = int.parse(splitedInitialPosition[1]);
    _actualDirection = splitedInitialPosition[2];
  }

  void _turn(String direction) {
    bool clockwise = direction == 'R';
    int directionNumber = translateDirectionToANumber(this._actualDirection);
    directionNumber = clockwise ? directionNumber + 1 : directionNumber - 1;
    this._actualDirection = translateANumberToDirection(directionNumber);
  }

  int translateDirectionToANumber(String direction) {
    int directionNumber;
    switch (direction) {
      case 'N':
        directionNumber = 1;
        break;
      case 'E':
        directionNumber = 2;
        break;
      case 'S':
        directionNumber = 3;
        break;
      case 'W':
        directionNumber = 4;
        break;
    }
    return directionNumber;
  }

  String translateANumberToDirection(int direction) {
    String directionChar;
    switch (direction) {
      case 1:
        directionChar = 'N';
        break;
      case 2:
        directionChar = 'E';
        break;
      case 3:
        directionChar = 'S';
        break;
      case 4:
        directionChar = 'W';
        break;
      case 5:
        directionChar = 'N';
        break;
      case 0:
        directionChar = 'W';
        break;
    }
    return directionChar;
  }

  void _moveForward() {
    switch (this._actualDirection) {
      case 'N':
        _positionY = _positionY + 1;
        break;
      case 'E':
        _positionX = _positionX + 1;
        break;
      case 'S':
        _positionY = _positionY - 1;
        break;
      case 'W':
        _positionX = _positionX - 1;
        break;
    }
    _validatePositionLimit();
  }

  void _validatePositionLimit() {
    if (_positionX > _xMax) _positionX = _xMax;
    if (_positionY > _yMax) _positionY = _yMax;
    if (_positionX < 0) _positionX = 0;
    if (_positionY < 0) _positionY = 0;
  }

  void _executeMovementInstructions() {
    _splitMovements();
    movements.forEach((String movement) {
      if (movement == "L" || movement == "R") {
        _turn(movement);
      } else {
        _moveForward();
      }
    });
  }

  void _splitMovements() {
    movements = this.movementInstructions.split('');
  }

  get actualState {
    return this._positionX.toString() +
        " " +
        this._positionY.toString() +
        " " +
        this._actualDirection.toString();
  }
}
