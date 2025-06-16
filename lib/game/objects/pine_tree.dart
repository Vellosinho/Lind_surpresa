import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';

int tileSize = 192;

class PineTree extends GameDecoration with Attackable {
  LocalGameController localGameController;
  PineTree({
    required super.position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.pine1, size: Vector2(576, 960)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(72, 40), position: Vector2(224, 856),));
      return super.onLoad();
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt); 
    } 

    @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify, DamageType damageType) {
    super.onReceiveDamage(attacker, 0, identify, damageType);
  }
}

class PineTreeMedium extends GameDecoration with Attackable {
  LocalGameController localGameController;
  PineTreeMedium({
    required super.position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.pine2, size: Vector2(576, 960)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(72, 40), position: Vector2(280, 856),));
      return super.onLoad();
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt); 
    } 

    @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify, DamageType damageType) {
    super.onReceiveDamage(attacker, 0, identify, damageType);
  }
}

class PineTreeSmall extends GameDecoration with Attackable {
  LocalGameController localGameController;
  PineTreeSmall({
    required super.position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.pine3, size: Vector2(384, 960)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(72, 40), position: Vector2(156, 856),));
      return super.onLoad();
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt); 
    } 

    @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify, DamageType damageType) {
    super.onReceiveDamage(attacker, 0, identify, damageType);
  }
}