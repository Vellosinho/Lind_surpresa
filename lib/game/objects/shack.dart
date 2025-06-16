import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';

class Shack extends GameDecoration with Attackable {
  Shack({
    required super.position})
      : super.withSprite(sprite: GameObjectsSprites.shack, size: Vector2(384, 768)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(64, 40), position: Vector2(0, 736),));
      add(RectangleHitbox(size:Vector2(64, 40), position: Vector2(320, 736),));
      return super.onLoad();
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt); 
    } 
}