import 'package:flutter_test/flutter_test.dart';
import 'package:http_inspector/src/core/data_utils.dart';

void main() {
  test('formats pretty JSON string from String', () {
    const jsonStr = '{"a":1,"b":2}';
    const expected = '{\n  "a": 1,\n  "b": 2\n}';
    expect(DataUtils.jsonDataFormated(jsonStr), expected);
  });

  test('formats pretty JSON from Map', () {
    final jsonMap = {
      'x': [1, 2],
      'y': {'z': 3},
    };
    final result = DataUtils.jsonDataFormated(jsonMap);
    expect(result, contains('"x": [\n    1,\n    2\n  ]'));
    expect(result, contains('"y": {\n    "z": 3\n  }'));
  });

  test('returns string for non-JSON string input', () {
    const txt = 'not json!';
    expect(DataUtils.jsonDataFormated(txt), txt);
  });

  test('returns toString for plain int or bool', () {
    expect(DataUtils.jsonDataFormated(42), '42');
    expect(DataUtils.jsonDataFormated(true), 'true');
  });

  test('returns input string for invalid JSON string', () {
    const invalid = '{"bad":1,}';
    expect(DataUtils.jsonDataFormated(invalid), invalid);
  });
}
