Dart wrapper for Tolgee localization framework 

See full documentation at [http://tolgee.io]() or more complex example [here](https://github.com/tolgee/tolgee-dart/issues)
## Usage

A simple usage example:

```dart
 var config = {
  'apiKey': "your api key here",
  'apiUrl': "https://app.tolgee.io",
  'targetElement': window.document.getElementsByTagName('body').first
};

var tolgee = Tolgee(config);
await tolgee.run();

querySelector('#output').text = await tolgee.translate('hello_world');
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/tolgee/tolgee-dart/issues
