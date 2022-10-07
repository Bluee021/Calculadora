class Memory{

  static const operations = ['%', '/', '*', '-', '+', '='];

  int _bufferIndex = 0;
  final _buffer = [0.0, 0.0];
  String? _operation = '';
  String _value = '0';
  bool _wipeValue = false;
  String? _lastCommand;
  
  void applyCommand(command){
    if(_isReplacingOperation(command)){
      _operation = command;
      return;
    }
    
    if(command == 'AC'){
      _allClear();
    }else if(operations.contains(command)){
      _setOperation(command);
    }
      else{
        _addDigit(command);
    }

  }
  
  _setOperation(String newOperation){
      bool isEqualSign = newOperation == '=';
    if(_bufferIndex == 0){
      if(!isEqualSign){
        _operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;
    
      }
    }else{
      _buffer[0] = _calculate();
      _buffer[1] = 0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;
    
      _operation = isEqualSign ? '' : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;

    }
    
        _wipeValue = true;
        _lastCommand = _operation;
  }

  _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue; 

    if(isDot && _value.contains('.') && !wipeValue){
      return;
    }

    final emptyValue = isDot ? '0': '';
    final currentValue = wipeValue ? emptyValue : _value;

    _value =  currentValue + digit ;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;

    print(_buffer);
  }

  _isReplacingOperation(String command){
    return operations.contains(_lastCommand)
      && operations.contains(command)
      && _lastCommand != '='
      && command != '=';
  }

  _allClear(){
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    // _buffer[0] = 0.0;
    // _buffer[1] = 0.0;
    _operation = '';
    _bufferIndex = 0;
    _wipeValue = false;
    print(_buffer);
  }

  _calculate(){
    switch(_operation){
      case '%': return _buffer[0] % _buffer[1];

      case '+': return _buffer[0] + _buffer[1];

      case '-': return _buffer[0] - _buffer[1];

      case '*': return _buffer[0] * _buffer[1];

      case '/': return _buffer[0] / _buffer[1];

      // case '=': return _buffer[0] = _buffer[1];
      default: return _buffer[0];
    }
  }
  
  String get value{
    return _value;
  }
  set value(n){
    _value = n;
  }

  String? get operation{
    return _operation;
  }
  
}