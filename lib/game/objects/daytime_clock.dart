import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/enemy/wooden_enemy.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/enum/enum_day_time.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';

class DayTimeClock extends GameDecoration {
  LocalGameController localGameController;
  int stashedIron = 0;
  DayTimeClock({required super.position, required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.anvil, size: Vector2(0, 0));
  @override
  Future<void> onLoad() {
    // localGameController.startDaynightCycle();
    updateGameLighting();
    print('initialized Daynight Cycle');
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // do anything
    super.update(dt);
  }

  // void updateGameLighting() {

  // gameRef.lighting!.animateToColor(localGameController.lightingColor, duration: Duration(seconds: 10));
  // }

  void updateGameLighting() {
      // checkRandomEnemy();
    Future.delayed(Duration(seconds: 10), () {
      updateGameLighting();
    });
    if (localGameController.daytime != DayTime.same) {
      switch (localGameController.daytime) {
        // case DayTime.sunrise:
        //   gameRef.lighting!.animateToColor(Colors.orange[400]!.withAlpha(48),
        //       duration: Duration(seconds: 10));
        //   localGameController.turnOffTimechange();
        //   return;
        // case DayTime.noon:
        //   gameRef.lighting!.animateToColor(Colors.orange[400]!.withAlpha(0),
        //       duration: Duration(seconds: 10));
        //   localGameController.turnOffTimechange();
        //   return;
        // case DayTime.sunset:
        //   gameRef.lighting!.animateToColor(Colors.orange[400]!.withAlpha(48),
        //       duration: Duration(seconds: 10));
        //   localGameController.turnOffTimechange();
        //   return;
        // case DayTime.night:
        //   gameRef.lighting!.animateToColor(Colors.indigo[900]!.withAlpha(148),
        //       duration: Duration(seconds: 10));
        //   localGameController.turnOffTimechange();
          // return;
        default:
          gameRef.lighting!.animateToColor(Colors.indigo[900]!.withAlpha(0),
              duration: Duration(seconds: 10));
          localGameController.turnOffTimechange();
          return;
      }
    }
  }
  
  void checkRandomEnemy() {
    if (((localGameController.hour > 18) || (localGameController.hour < 6)) && (!localGameController.gameIsOver)) {
      Random rand = Random();
      int randomX = rand.nextInt(20) + 5;
      int randomY = rand.nextInt(17) + 8;
      Vector2 randomPosition = Vector2(randomX * tileSize, randomY * tileSize); 
      add(WoodenEnemy(
        position: randomPosition,
        size: PlayerConsts.characterSize, 
        hitboxSize: PlayerConsts.characterHitbox, 
        hitboxPosition: PlayerConsts.characterHitboxPosition, 
        controller: localGameController));
    }
  }
}
