import 'Sonda.dart';

class InputAutomate {
  String _topRight, _output = "";
  List<Sonda> _sondas = new List();
  List<Map> _sondaProperties = new List();
  List<String> _inputLines = new List();
  InputAutomate(String input) {
    try {
      _inputLines = input.split('\n');
      _topRight = _inputLines[0];
      _splitProperties();
      _sondasConstruct();
      _outputMount();
    } catch (e) {}
  }
  void _splitProperties() {
    for (int i = 1; i < _inputLines.length; i = i + 2) {
      _sondaProperties.add(
          {'position': _inputLines[i], 'instructions': _inputLines[i + 1]});
    }
  }

  void _sondasConstruct() {
    _sondaProperties.forEach((sonda) {
      _sondas.add(Sonda(_topRight, sonda['position'], sonda['instructions']));
    });
  }

  void _outputMount() {
    _sondas.forEach((sonda) {
      _output += sonda.actualState + '\n';
    });
  }

  get output {
    return this._output;
  }
}
