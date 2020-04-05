# Prefs Guard

Prefs Guard is a data protection wrapper for local storage (Shared Prefs). supporting both IOS & Android.

```diff
- Notice :- Use Same GuardType through out the app to get the proper result.
```

## Prefs guard supports three types of encryption formats

### GuardType.AES
```dart
import 'package:prefs_guard/prefsguard.dart';

final prefs = PrefsGuard(GuardType.AES);

//Storing a value in local storage 
pres.write(key: 'hello', value: 'flutter'); //encrypts using AES encryption.

//reading a value from local storage
final data= await pres.read(key: 'hello');//decrypt using AES 
```

### GuardType.Salsa20
```dart
import 'package:prefs_guard/prefsguard.dart';

final prefs = PrefsGuard(GuardType.Salsa20);

//Storing a value in local storage 
pres.write(key: 'hello', value: 'flutter'); //encrypts using Salsa20 encryption.

//reading a value from local storage
final data= await pres.read(key: 'hello');//decrypt using Salsa20 
```


### GuardType.FerNet
```dart
import 'package:prefs_guard/prefsguard.dart';

final prefs = PrefsGuard(GuardType.FerNet);

//Storing a value in local storage 
pres.write(key: 'hello', value: 'flutter'); //encrypts using FerNet encryption.

//reading a value from local storage
final data= await pres.read(key: 'hello');//decrypt using FerNet 
```

### Clearing Prefs
```dart
final prefs = PrefsGuard(GuardType.FerNet);
prefs.clearAll();
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update the tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
