import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';
import 'package:projeto_gbb_demo/players/consts.dart';

class Bonfire extends GameDecoration with Attackable {
  LocalGameController localGameController;
  late TextComponent textComponent;
  int logsOnBonfire = 0;
  Bonfire({required super.position, required this.localGameController})
      : super.withAnimation(
            animation: GameObjectsSprites.fire, size: Vector2(192, 192));
  @override
  Future<void> onLoad() {
    add(RectangleHitbox(
      size: Vector2(192, 192),
      position: Vector2(0, 0),
    ));
    textComponent = TextComponent(
        anchor: Anchor.topCenter,
        position: Vector2(192 / 2, -32.0),
        text: localGameController.bonfireRemainingTime.toString().padLeft(2, '0'),
        textRenderer: TextPaint(
            style: TextStyle(
                fontFamily: 'PressStart2P', fontSize: 24, height: 1.5)));
    add(textComponent);
    updateLighting(radiusWidth: 1.15);
    Future.delayed(Duration(microseconds: 400), () {
      fireOscilation();
    });
    return super.onLoad();
  }

  void updateTextWidget() {
    textComponent.text = '${(localGameController.bonfireRemainingTime ~/ 60).toString().padLeft(2, '0')}:${(localGameController.bonfireRemainingTime.remainder(60)).toString().padLeft(2, '0')}';
  }

  void fireOscilation() {
    updateTextWidget();
    localGameController.removeBonfireTime();
    Random rand = Random();
    int random = rand.nextInt(25) + 125 + logsOnBonfire * 25;
    updateLighting(radiusWidth: (random / 100));
    Future.delayed(Duration(seconds: 1), () {
      fireOscilation();
    });
  }

  void updateLighting({required double radiusWidth}) {
    setupLighting(
      LightingConfig(
        radius: width * radiusWidth,
        align: Vector2(0, 0),
        color: ElementColors.fireColor.withAlpha(80),
        blurBorder: 120, // this is a default value
      ),
    );
  }

  @override
  void update(double dt) {
    // do anything
    super.update(dt);
  }

  @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify,
      DamageType damageType) {
    // localGameController.getLog();
    bool addLog = false;
    addLog = localGameController.addLogToFire();
    if (addLog) {
      logsOnBonfire++;
    }
    if (logsOnBonfire >= 25) {
      localGameController.setGameOver();
    }
    super.onReceiveDamage(attacker, 0, identify, damageType);
  }
}
