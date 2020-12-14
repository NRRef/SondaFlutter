import 'Sonda.dart';

class InputAutomate {
  String _topRight, _output = "";
  List<Sonda> _sondas = new List();
  List<Map> _sondaProperties = new List();
  List<String> _inputLines = new List();
  InputAutomate(String input) {
    try {
      if(!validateInput(input)) throw("Invalid Input");
      _inputLines = input.split('\n');
      _topRight = _inputLines[0];
      _splitProperties();
      _sondasConstruct();
      _outputMount();
    } catch (e) {}
  }
  bool validateInput(input){
    return RegExp(r"^[0-9]+\s[0-9]+(\n|\r)([0-9]+\s[0-9]+\s(N|E|S|W)(\n|\r)(L|R|M)*(\n|\r)*)*$").hasMatch(input);
        
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
