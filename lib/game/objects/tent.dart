import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';

class Tent extends GameDecoration with Attackable {
  LocalGameController localGameController;
  Tent({
    required super.position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.tent, size: Vector2(384, 576)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(24, 24), position: Vector2(170, 540),));
      add(RectangleHitbox(size:Vector2(24, 200), position: Vector2(0, 364),));
      add(RectangleHitbox(size:Vector2(24, 200), position: Vector2(360, 364),));
      add(RectangleHitbox(size:Vector2(384, 80), position: Vector2(0, 244),));
      return super.onLoad();
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt); 
    }

    @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify, DamageType damageType) {}
} 