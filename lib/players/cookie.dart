import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';

class CookieNPC extends SimpleAlly with Lighting {
  Vector2 hitboxSize;
  Vector2 hitboxPosition;
  LocalGameController controller;
  bool willTalk = true;
  bool tutorialExplained = false;
  CookieNPC({
    required super.position,
    required super.size,
    required this.hitboxSize,
    required this.hitboxPosition,
    required this.controller,
  }) : super(
            speed: 0,
            animation: SimpleDirectionAnimation(
              idleDown: CookieSprites.cookieSleep,
              idleLeft: CookieSprites.cookieSleep,
              idleRight: CookieSprites.cookieSleep,
              runRight: CookieSprites.cookieSleep,
            ),
            receivesAttackFrom: AcceptableAttackOriginEnum.ALL) {
  }

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: hitboxSize, position: hitboxPosition));
    checkIfGameIsOver();
    return super.onLoad();
  }

  @override
  void onReceiveDamage(attacker, double damage, identify, damageType) {
    super.onReceiveDamage(attacker, 0, identify, damageType);
  }

  void checkIfGameIsOver() {

    if (controller.gameIsOver) {
      endGame();
    } else {
      Future.delayed(Duration(seconds: 1), () {
        checkIfGameIsOver();
      });
    }

  }

  void endGame() {
    TalkDialog.show(context, [Say(text: [TextSpan(text: 'Meu amor por voce e como essa fogueira, queima mais forte a cada segundo, me aquece nos momentos mais frios da vida. Eu amo cada segundo que passo ao seu lado, cada memoria, cada palavra, pra sempre... \nFeliz dia dos namorados, minha vida'),])], style: const TextStyle(fontFamily: 'PressStart2P', fontSize: 24, height: 1.5));
    // gameRef.camera.zoom = 0.2;
  }
}