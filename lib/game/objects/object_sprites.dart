import 'package:bonfire/bonfire.dart';

class GameObjectsSprites {
  //anvil sprites:
  static Future<Sprite> anvil = Sprite.load('objects/anvil.png');
  static Future<Sprite> yellowMat = Sprite.load('objects/yellow_mat.png');

  static Future<Sprite> anvilMinigame = Sprite.load('objects/anvil_minigame.png');

  // Trees
  static Future<Sprite> pine1 = Sprite.load('plants/pinheiro1.png');
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
}