import 'package:bonfire/bonfire.dart';

class GameObjectsSprites {
  //anvil sprites:
  static Future<Sprite> anvil = Sprite.load('objects/anvil.png');
  static Future<Sprite> yellowMat = Sprite.load('objects/yellow_mat.png');

  static Future<Sprite> anvilMinigame = Sprite.load('objects/anvil_minigame.png');

  // Trees
  static Future<SpriteAnimation> get pine1 => SpriteAnimation.load('plants/pinheiro1.png', SpriteAnimationData.sequenced(amount: 1, stepTime: 0.2, textureSize: Vector2(160,160)));
  static Future<SpriteAnimation> get pine1Hit => SpriteAnimation.load('plants/pinheiro1_hit.png', SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(160,160)));
  static Future<SpriteAnimation> get pine1fall => SpriteAnimation.load('plants/pinheiro1_falling.png', SpriteAnimationData.sequenced(amount: 7, stepTime: 0.2, textureSize: Vector2(160,160)));
  static Future<SpriteAnimation> get pine1cut => SpriteAnimation.load('plants/pinheiro1_cut.png', SpriteAnimationData.sequenced(amount: 1, stepTime: 0.2, textureSize: Vector2(160,160)));
  static Future<Sprite> pine2 = Sprite.load('plants/pinheiro2.png');
  static Future<Sprite> pine3 = Sprite.load('plants/pinheiro3.png');

  // Tent
  static Future<Sprite> tent = Sprite.load('ruins_village_map/tent.png');
  static Future<Sprite> shack = Sprite.load('objects/shack.png');
  
  //furnace
  static Future<SpriteAnimation> get fire => SpriteAnimation.load(
    'objects/active_furnace.png',
    SpriteAnimationData.sequenced(amount: 8, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get deadFire => SpriteAnimation.load(
    'objects/bonfire_dead.png',
    SpriteAnimationData.sequenced(amount: 1, stepTime: 0.2, textureSize: Vector2(32,32))
  );
}