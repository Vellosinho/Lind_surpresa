import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game/enum/one_time_animations.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';

import '../game/enum/character_faction.dart';
import '../game/game_sprite_sheet.dart';
import 'player_consts.dart';
import 'package:bonfire/player/lit_player.dart';

/* 
  static Vector2 characterSize = Vector2(192, 192);
  static Vector2 characterHitbox = Vector2(96, 40);
*/

class Lind extends LitPlayer with BlockMovementCollision {
  Function onHit;
  double playerLife;

  // control booleans:
  bool dashReady = true;
  bool attackReady = true;
  bool holdingArrow = false;

  LocalGameController localGameController;

  bool _isPlayingOneTimeAnimation = false;

  final String id;
  Lind({
    required super.position,
    required this.onHit,
    required this.playerLife,
    required CharacterFaction faction,
    required this.localGameController,
    required this.id,
  }) : super(
          life: playerLife,
          initDirection: Direction.down,
          size: PlayerConsts.characterSize,
          animation: lind,
          // speed: PlayerConsts.characterSpeed,
          speed: PlayerConsts.characterSpeed,
        );
  @override
  Future<void> onLoad() {
    setupColisions();
    return super.onLoad();
  }

  @override
  void onReceiveDamage(attacker, double damage, identify, damageType) {
    print("damage received");
    // onHit();
    localGameController.hit(damage);
    super.onReceiveDamage(attacker, damage, identify, damageType);
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    lindHitSet(event);
    return super.onJoystickAction(event);
  }

  @override
  void update(double dt) {
    _isPlayingOneTimeAnimation =
        localGameController.playAnimation != OneTimeAnimations.none;
    super.update(dt);
  }

  void lindHitSet(JoystickActionEvent event) {
    if ((event.id.keyId == LogicalKeyboardKey.keyZ.keyId) && attackReady) {
      if (event.event == ActionEvent.DOWN) {
        holdingArrow = true;
        localGameController.setArrowStrength(1);
        Future.delayed(Duration(milliseconds: 750), () {
          increasePullStrength();
        });
      } else {
        releaseArrow();
      }
    }
    if (event.id.keyId == LogicalKeyboardKey.keyC.keyId && event.event == ActionEvent.DOWN) {
      simpleAttackMelee(damage: 0, size: size, withPush: false);
    }
    if (event.id.keyId == LogicalKeyboardKey.keyX.keyId &&
        dashReady &&
        !_isPlayingOneTimeAnimation) {
      lindDash();
    }
  }

  void increasePullStrength() {
    if (holdingArrow) {
      if (localGameController.arrowStrength < 3) {
        int value = localGameController.arrowStrength + 1;
        localGameController.setArrowStrength(value);
        Future.delayed(Duration(milliseconds: 750), () {
          increasePullStrength();
        });
      }
    }
  }

  void releaseArrow() {
    if(holdingArrow) {
      simpleAttackRangeByDirection(
          animationRight: GameSpriteSheet.arrowHorizontalRight,
          damage: (26 * localGameController.arrowStrength).toDouble(),
          attackFrom: AttackOriginEnum.PLAYER_OR_ALLY,
          direction: lastDirection,
          size: Vector2(155, 95),
          speed: (1000 * localGameController.arrowStrength).toDouble(),
          centerOffset: Vector2(0, -60));
      localGameController.setArrowStrength(0);
      holdingArrow = false;
      attackReady = false;
      Future.delayed(const Duration(seconds: 1), () {
        attackReady = true;
      });
    }
  }

  void lindDash() {
    simpleAttackMelee(
      sizePush: 0,
      damage: 0,
      withPush: false,
      size: Vector2(96, 96),
      animationRight: GameSpriteSheet.dashEffect,
      direction: lastDirection,
    );
    Vector2 initPosition = gameRef.player?.position.gg ?? Vector2(0, 0);

    Vector2 startPosition = initPosition + Vector2.zero();

    Vector2 diffBase = BonfireUtil.diffMovePointByAngle(
      startPosition,
      250,
      lastDirection.toRadians(),
    );

    // animation?.playOnce(isArmed
    //     ? playerOneAnimations
            // .getArmedAnimation(lastDirection.toRadians().toString())
    //     : playerOneAnimations
    //         .getUnarmedAnimation(lastDirection.toRadians().toString()));

    translate(diffBase);
    dashReady = false;
    Future.delayed(const Duration(seconds: 2), () {
      dashReady = true;
    });
  }

  @override
  void onDie() {
    onRevive();
    playerLife = 100;
    localGameController.heal(100);
    super.onDie();
  }

  @override
  void setupColisions() {
    add(RectangleHitbox(
        size: PlayerConsts.characterHitbox,
        position: PlayerConsts.characterHitboxPosition));
    super.setupColisions();
  }

  // Archer Skillset
  // @override
  // void joystickAction(JoystickActionEvent event) {
  //   double getDashAngle(String originalAngle) {
  //     switch (originalAngle) {
  //       case '3.141592653589793':
  //         return 1.7453292519943295e-9;
  //       case '1.7453292519943295e-9':
  //         return 3.141592653589793;
  //       case '-0.7853981633974483':
  //         return 2.356194490192345;
  //       case '2.356194490192345':
  //         return -0.7853981633974483;
  //       case '-2.356194490192345':
  //         return 0.7853981633974483;
  //       case '0.7853981633974483':
  //         return -2.356194490192345;
  //       case '-1.5707963267948966':
  //         return 1.5707963267948966;
  //       case '1.5707963267948966':
  //         return -1.5707963267948966;
  //       default:
  //         return 0.0;
  //     }
  //   }

  //   var initPosition = rectConsideringCollision;

  //   Vector2 startPosition =
  //       initPosition.center.toVector2() + Vector2.zero();

  //   Vector2 diffBase = BonfireUtil.diffMovePointByAngle(
  //     startPosition,
  //     350,
  //     getDashAngle(lastDirection.toRadians().toString())
  //   );

  //   startPosition.add(diffBase);
  //   startPosition.add(Vector2(-size.x / 2, -size.y / 2));

  //   if(hasGameRef && !gameRef.camera.isMoving) {

  //     if(event.id == LogicalKeyboardKey.keyZ.keyId && attackReady) {
  //       simpleAttackRangeByDirection(animationRight: GameSpriteSheet.arrowHorizontalRight,
  //         attackFrom: AttackFromEnum.PLAYER_OR_ALLY,
  //         direction: lastDirection,
  //         size: Vector2(155,95),
  //         speed: 2000,
  //         centerOffset: Vector2(0, -60)
  //       );
  //       attackReady = false;
  //       Future.delayed(const Duration(seconds: 1), () {
  //         attackReady = true;
  //       });
  //     }
  //     if(event.id == LogicalKeyboardKey.keyX.keyId && dashReady) {
  //       translate(diffBase.x, diffBase.y);
  //       dashReady = false;
  //       Future.delayed(const Duration(seconds: 2),() {
  //         dashReady = true;
  //       });
  //     }
  //   }
  // }
}
