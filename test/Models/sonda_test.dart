import 'package:flutter_test/flutter_test.dart';
import 'package:sonda_flutter/Models/Sonda.dart';
import 'package:meta/meta.dart';

void main() {
  test('Validation pass', () {
    Sonda sn = new Sonda.blank("1 1", "1 1 N", "M");
    expect(sn.validateInputs(), true);
  });
  test('Validation fail 1', () {
    Sonda sn = new Sonda.blank("1 1s", "1 1 N", "M");
    expect(sn.validateInputs(), false);
  });
  test('Validation fail 2', () {
    Sonda sn = new Sonda.blank("1 1", "1 1 n", "M");
    expect(sn.validateInputs(), false);
  });
  test('Validation fail 3', () {
    Sonda sn = new Sonda.blank("1 1", "1 1 N", "G");
    expect(sn.validateInputs(), false);
  });
  test('Construct and execute a set of instructions 1', () {
    Sonda sn = new Sonda("5 5", "1 2 N", "LMLMLMLMM");
    expect(sn.actualState, "1 3 N");
  });
  test('Construct and execute a set of instructions 2', () {
    Sonda sn = new Sonda("5 5", "1 2 N", "LMLMLMLMM");
    expect(sn.actualState, "1 3 N");
  });

  test('Construct and execute a set of instructions 3', () {
    Sonda sn = new Sonda("5 5", "3 3 E", "MMRMMRMRRM");
    expect(sn.actualState, "5 1 E");
  });
}
