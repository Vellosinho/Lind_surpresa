import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/enemy/enemy_sprite_sheet.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';

class WoodenEnemy extends SimpleEnemy {
  Vector2 hitboxSize;
  Vector2 hitboxPosition;
  LocalGameController controller;
  bool attackReady = false;
  WoodenEnemy({
    required super.position,
    required super.size,
    required this.hitboxSize,
    required this.hitboxPosition,
    required this.controller,
  }) : super(
            speed: 50,
            initDirection: Direction.down,
            animation: SimpleDirectionAnimation(
              idleDown: EnemySpriteSheet.woodyFront,
              idleDownRight: EnemySpriteSheet.woodyFront,
              idleDownLeft: EnemySpriteSheet.woodyFront,
              idleUp: EnemySpriteSheet.woodyBack,
              idleUpRight: EnemySpriteSheet.woodyBack,
              idleUpLeft: EnemySpriteSheet.woodyBack,
              idleRight: EnemySpriteSheet.woodyRight,
              runUp: EnemySpriteSheet.woodyBack,
              runUpLeft: EnemySpriteSheet.woodyBack,
              runUpRight: EnemySpriteSheet.woodyBack,
              runDown: EnemySpriteSheet.woodyFront,
              runDownRight: EnemySpriteSheet.woodyFront,
              runDownLeft: EnemySpriteSheet.woodyFront,
              runRight: EnemySpriteSheet.woodyRight,
            ),
            receivesAttackFrom: AcceptableAttackOriginEnum.ALL) {
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(1000, radiusVision: 10000, closePlayer: (player) {
      simpleAttackMelee(
        sizePush: 0.2,
        damage: getDamage().toDouble(),
        withPush: true,
        size: size,
        animationRight: GameSpriteSheet.attackHorizontalRight,
        direction: lastDirection,
      );
      // position.translate(diffBase.x, diffBase.y);
      attackReady = false;
      Future.delayed(const Duration(seconds: 1), () {
        attackReady = true;
      });
    });
    super.update(dt);
  }


  @override
  Future<void> onLoad() {
    stun();
    add(RectangleHitbox(size: hitboxSize, position: hitboxPosition));
    Future.delayed(Duration(milliseconds: 20), () {
      animation?.playOnce(EnemySpriteSheet.woodyCreate);
    });
    return super.onLoad();
  }

  @override
  void onReceiveDamage(attacker, double damage, identify, damageType) {
    stun();
    animation!.playOnce(EnemySpriteSheet.woodyHit);
    super.onReceiveDamage(attacker, damage, identify, damageType);
    if (damage > 75) {
      onDie();
    }
  }

  void stun() {
    speed = 0;
    Future.delayed(Duration(seconds: 1), () {
      speed = getSpeed().toDouble();
    });
  }

  @override
  void onDie() {
    animation!.playOnce(EnemySpriteSheet.woodyBreak);
    controller.getLog();
    Future.delayed(Duration(milliseconds: 750), () {
      removeFromParent();
    });
    super.onDie();
  }

  int getSpeed() {
    switch (controller.logsOnBonfire ~/ 5) {
      case 0:
        print("isZero");
        return 50;
      case 1:
        print("isFive");
        return 75;
      case 2:
        print("isten");
        return 125;
      case 3:
        print("isfifteen");
        return 150;
      case 4:
        print("isTwenty");
        return 150;
      default:
        return 50;
    }
  }

  int getDamage() {
    switch (controller.logsOnBonfire ~/ 5) {
      case 0:
        return 5;
      case 1:
        return 10;
      case 2:
        return 15;
      case 3:
        return 20;
      default:
        return 25;
    }
  }
}
