import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/enum/enum_day_time.dart';
import 'package:projeto_gbb_demo/game/enum/one_time_animations.dart';
import 'package:projeto_gbb_demo/game/items/base_item.dart';
import 'package:projeto_gbb_demo/game/items/log.dart';

class LocalGameController with ChangeNotifier {
  int hour = 19;
  // int hour = 6
  int minute = 00;

  DayTime daytime = DayTime.same;

  Color mapTintColor = Colors.orange[400]!.withAlpha(48);

  bool gameIsOver = false;
  bool showBowDraw = false;

  double _playerLife = 100;
  int _playerWallet = 0;
  int _playerFollowers = 0;
  int _hitCount = 0;
  int _arrowStrength = 0;

  final List<Item> _inventory = [
    Item(name: 'empty'),
    Item(name: 'empty'),
    Item(name: 'empty'),
    Item(name: 'empty'),
  ];
  List<Item> get inventory => _inventory;

  //remove later

  double get playerLife => _playerLife;
  int get playerWallet => _playerWallet;
  int get playerFollowers => _playerFollowers;
  int get hitcount => _hitCount;
  int get arrowStrength => _arrowStrength;

  //Mini Game logic:
  int swordScore = 0;
  int _logsOnBonfire = 0;
  int get logsOnBonfire => _logsOnBonfire;
  int minigameHitCount = 0;
  double timeCount = 0.0;
  Vector2 minigamePos = Vector2(0, 0);
  OneTimeAnimations _playAnimation = OneTimeAnimations.none;
  OneTimeAnimations get playAnimation => _playAnimation;

  int stashedIron = 0;

  void heal(int value) {
    ((_playerLife + value) > 20) ? _playerLife = 20 : _playerLife += value;
    notifyListeners();
  }

  void hit(double value) {
    _playerLife -= value;
    print("playerLife: $_playerLife");
    notifyListeners();
  }

  void spendMoney(int amount) {
    (_playerWallet - amount < 0) ? _playerWallet = 0 : _playerWallet -= amount;
    notifyListeners();
  }

  void playerFollowersAdd() {
    _playerFollowers++;
    notifyListeners();
  }

  void addHitCount() {
    _hitCount++;
    Future.delayed(const Duration(seconds: 3), () {
      _hitCount--;
    });
  }

  void addArrowHitCount() {
    _hitCount--;
    Future.delayed(const Duration(seconds: 3), () {
      _hitCount++;
    });
  }

  void setGameOver() {
    gameIsOver = true;
    notifyListeners();
  }

  void getLog() {
    if (!isInventoryFull()) {
      addToInventory(Log());
      notifyListeners();
    }
  }

  void setArrowStrength(int value) {
    _arrowStrength = value;
    notifyListeners();
  }

  bool addLogToFire() {
    if(hasLog() && !gameIsOver) {
      removeFromInventory(Log());
      _logsOnBonfire++;
      return true;
    } else {
      return false;
    }
  }

  void endGame() {
    print("Game is Over");
  }

  int getTime() {
    int time = (hour * 100) + minute;
    return time;
  }

  // Inventory Functions:

  void addToInventory(Item itemToAdd) {
    // _inventory.firstWhere((element) => element.name == 'empty');
    if (_inventory[0].name == 'empty') {
      _inventory[0] = itemToAdd;
    } else if (_inventory[1].name == 'empty') {
      _inventory[1] = itemToAdd;
    } else if (_inventory[2].name == 'empty') {
      _inventory[2] = itemToAdd;
    } else if (_inventory[3].name == 'empty') {
      _inventory[3] = itemToAdd;
    }
    notifyListeners();
  }

  void removeFromInventory(Item itemToRemove) {
    // _inventory.firstWhere((element) => element.name == 'empty');
    if (_inventory[0].name == itemToRemove.name) {
      _inventory[0] = Item(name: 'empty');
    } else if (_inventory[1].name == itemToRemove.name) {
      _inventory[1] = Item(name: 'empty');
    } else if (_inventory[2].name == itemToRemove.name) {
      _inventory[2] = Item(name: 'empty');
    } else if (_inventory[3].name == itemToRemove.name) {
      _inventory[3] = Item(name: 'empty');
    }
    notifyListeners();
  }

  bool hasLog() {
    bool hasLog = false;
    for (int i = 0; i < 4; i++) {
      if (_inventory[i].name == 'log') {
        hasLog = true;
      }
    }
    return hasLog;
  }

  bool isInventoryFull() {
    bool full = true;
    for (int i = 0; i < 4; i++) {
      if (_inventory[i].name == 'empty') {
        full = false;
      }
    }
    return full;
  }

  Item? getFirstOfType(Item type) {
    int pos = -1;
    for (int i = 0; i < 4; i++) {
      if (_inventory[i].name == type.name) {
        pos = i;
        break;
      }
    }
    if (pos == -1) {
      return null;
    }
    return _inventory[pos];
  }

  void startDaynightCycle() {
    Future.delayed(Duration(seconds: 10), () {
      passMinute();
    });
  }

  void passMinute() {
    print("$hour:$minute");
    if (minute > 40) {
      passHour();
      minute = 00;
    } else {
      minute += 10;
    }

    updateShading();

    // Future.delayed(Duration(seconds: 10), () {
    Future.delayed(Duration(seconds: 10), () {
      passMinute();
    });
  }

  void passHour() {
    if (hour > 22) {
      hour = 00;
    } else {
      hour++;
    }
    updateShading();
  }

  void updateShading() {
    Color nightColor = Colors.indigo[900]!.withAlpha(148);
    Color sunRiseColor = Colors.orange[400]!.withAlpha(48);
    Color noonColor = Colors.orange[400]!.withAlpha(0);

    switch (hour) {
      case 6:
        mapTintColor = sunRiseColor;
        daytime = DayTime.sunrise;
        break;
      case 7:
        mapTintColor = noonColor;
        daytime = DayTime.noon;
        break;
      case 18:
        mapTintColor = sunRiseColor;
        daytime = DayTime.sunset;
        break;
      case 19:
        mapTintColor = nightColor;
        daytime = DayTime.night;
        break;
    }
    notifyListeners();
  }

  void turnOffTimechange() {
    daytime = DayTime.same;
    notifyListeners();
  }

  void shrugPlayer() {
    _playAnimation = OneTimeAnimations.shrug;
  }
}
