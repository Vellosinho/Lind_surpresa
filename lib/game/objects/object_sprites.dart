import 'package:bonfire/bonfire.dart';

class GameObjectsSprites {
  //anvil sprites:
  static Future<Sprite> anvil = Sprite.load('objects/anvil.png');
  static Future<Sprite> yellowMat = Sprite.load('objects/yellow_mat.png');

  static Future<Sprite> anvilMinigame = Sprite.load('objects/anvil_minigame.png');

  // Smithing Table
  static Future<Sprite> smithingTableEmpty = Sprite.load('objects/smithing_table/empty_smithing_table.png');
  static Future<Sprite> smithingTableHammer = Sprite.load('objects/smithing_table/hammer_smithing_table.png');
  
  //furnace
  static Future<SpriteAnimation> get fire => SpriteAnimation.load(
    'objects/active_furnace.png',
    SpriteAnimationData.sequenced(amount: 8, stepTime: 0.2, textureSize: Vector2(32,32))
  );
}