import 'package:bonfire/bonfire.dart';

class EnemySpriteSheet {
  static Future<SpriteAnimation> get woodyFront => SpriteAnimation.load(
    'wooden_enemy/woody_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get woodyBack => SpriteAnimation.load(
    'wooden_enemy/woody_back.png',
    SpriteAnimationData.sequenced(amount: 1, stepTime: 2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get woodyRight => SpriteAnimation.load(
    'wooden_enemy/woody_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get woodyHit => SpriteAnimation.load(
    'wooden_enemy/woody_hit.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get woodyBreak => SpriteAnimation.load(
    'wooden_enemy/woody_break.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get woodyCreate => SpriteAnimation.load(
    'wooden_enemy/woody_create.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
}