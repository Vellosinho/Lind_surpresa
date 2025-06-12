import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
// import 'package:flutter/material.dart';
import 'enum/character_class.dart';
import 'enum/character_faction.dart';


class GameSpriteSheet {
  // Unarmed
  static Future<SpriteAnimation> get lindIdleLeft => SpriteAnimation.load(
    'lind_sprites/lind_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindIdleRight => SpriteAnimation.load(
    'lind_sprites/lind_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindIdleFront => SpriteAnimation.load(
    'lind_sprites/lind_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindIdleBack => SpriteAnimation.load(
    'lind_sprites/lind_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindWalkLeft => SpriteAnimation.load(
    'lind_sprites/lind_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindDashLeft => SpriteAnimation.load(
    'lind_sprites/lind_dash_left.png',
    SpriteAnimationData.sequenced(amount:4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindWalkRight => SpriteAnimation.load(
    'lind_sprites/lind_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindDashRight => SpriteAnimation.load(
    'lind_sprites/lind_dash_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindWalkFront => SpriteAnimation.load(
    'lind_sprites/lind_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindDashFront => SpriteAnimation.load(
    'lind_sprites/lind_dash_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindWalkBack => SpriteAnimation.load(
    'lind_sprites/lind_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get lindDashBack => SpriteAnimation.load(
    'lind_sprites/lind_dash_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  
  static Future<SpriteAnimation> get attackHorizontalRight => SpriteAnimation.load(
    'attack_sprites/horizontal_attack_right.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.15, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get arrowHorizontalRight => SpriteAnimation.load(
    'arrow_right.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.15, textureSize: Vector2(22,14))
  );
  static Future<SpriteAnimation> get dashEffect => SpriteAnimation.load(
    'attack_sprites/dash_effect.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.15, textureSize: Vector2(16,16))
  );
  static Future<SpriteAnimation> get hammerAttackHorizontalRight => SpriteAnimation.load(
    'attack_sprites/hammer_attack_right.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.15, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get hammerSpinAttack => SpriteAnimation.load(
    'attack_sprites/hammer_spin_attack.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(64,46))
  );
  static Future<SpriteAnimation> get hammerSpinAttackFire => SpriteAnimation.load(
    'attack_sprites/fire_hammer_spin_attack.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(64,46))
  );
  static Future<SpriteAnimation> get hammerSpinAttackHammer => SpriteAnimation.load(
    'attack_sprites/thunder_hammer_spin_attack.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(64,46))
  );
  
}
  
  SimpleDirectionAnimation lind = SimpleDirectionAnimation(
    idleRight: GameSpriteSheet.lindIdleRight,
    runRight: GameSpriteSheet.lindWalkRight,
    idleLeft: GameSpriteSheet.lindIdleLeft,
    runLeft: GameSpriteSheet.lindWalkLeft,
    idleDown: GameSpriteSheet.lindIdleFront,
    idleDownRight: GameSpriteSheet.lindIdleFront,
    idleDownLeft: GameSpriteSheet.lindIdleFront,
    runDown: GameSpriteSheet.lindWalkFront,
    runDownLeft: GameSpriteSheet.lindWalkFront,
    runDownRight: GameSpriteSheet.lindWalkFront,
    idleUp: GameSpriteSheet.lindIdleBack,
    idleUpRight: GameSpriteSheet.lindIdleBack,
    idleUpLeft: GameSpriteSheet.lindIdleBack,
    runUp: GameSpriteSheet.lindWalkBack,
    runUpRight: GameSpriteSheet.lindWalkBack,
    runUpLeft: GameSpriteSheet.lindWalkBack,
  );

class CookieSprites {
  static Future<SpriteAnimation> get cookieSleep => SpriteAnimation.load(
    'cookie_sprites/cookie_sleep.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.4, textureSize: Vector2(32,40))
  );
}


class InterfaceSpriteSheet {
  //Tokens
  static Image get archerToken => Image.asset('assets/images/interface/archer_token.png');
  static Image get swordsmanToken => Image.asset('assets/images/interface/swordsman_token.png');
  static Image get knightToken => Image.asset('assets/images/interface/knight_token.png');
  //Vertentes Politicas
  static Image get communistSymbol => Image.asset('assets/images/interface/workers.png', height: 128, width: 128, fit: BoxFit.cover);
  static Image get monarchistSymbol => Image.asset('assets/images/interface/monarchists.png');
  static Image get capitalistSymbol => Image.asset('assets/images/interface/capitalists.png');
  //Title Screen
  static Image get titleScreen => Image.asset('assets/images/title.png');
  static Image get menuScreen => Image.asset('assets/images/menu_Screen.png');
  static Image get menuScreenNoLabels => Image.asset('assets/images/menu_Screen_NoLabels.png', fit: BoxFit.fill,);
  static Image get menuScreenDescription => Image.asset('assets/images/menu_Screen_description.png');
  static Image get workersBanner => Image.asset('assets/images/WorkersBanner.png');
  static Image get workersBannerSelected => Image.asset('assets/images/WorkersBannerSelected.png');
  static Image get ownersBannerDisabled => Image.asset('assets/images/OwnersBannerDisabled.png');
  static Image get ownersBanner => Image.asset('assets/images/OwnersBanner.png');
  static Image get ownersBannerSelected => Image.asset('assets/images/OwnersBannerSelected.png');
  static Image get loyalistsBannerDisabled => Image.asset('assets/images/LoyalistBannerDisabled.png');
  static Image get loyalistsBanner => Image.asset('assets/images/LoyalistBanner.png');
  static Image get loyalistsBannerSelected => Image.asset('assets/images/LoyalistBannerSelected.png');
  static Image get lindEasterEgg => Image.asset('assets/images/LindEasterEgg.png');
  //Life bar
  // static List<Image> lifebarList = [
  //   Image.asset('assets/images/interface/lifebar/life_bar_1.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_2.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_3.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_4.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_5.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_6.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_7.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_8.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_9.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_10.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_11.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_12.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_13.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_14.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_15.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_16.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_17.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_18.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_19.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_20.png', height: 144,),
  // ];
  static Image get inventoryBar => Image.asset('assets/images/interface/inventorybar/inventory_bar.png',height: 88, fit: BoxFit.cover,);
  static Image get lifeBar => Image.asset('assets/images/interface/lifebar/lifebar.png',height: 152, fit: BoxFit.cover,);
  // static Image get miniMapDecoration => Image.asset('assets/images/interface/minimap/minimap.png',height: 340, fit: BoxFit.cover,);
  static Image get miniMapDecoration => Image.asset('assets/images/interface/minimap/complete_minimap_interface.png',height: 360, fit: BoxFit.cover,);
  //Interface elements
  static Image get coin => Image.asset('assets/images/interface/coin.png');
  static Image get people => Image.asset('assets/images/interface/people.png');
  
}

List<Widget> getToken(CharacterClass characterClass, CharacterFaction faction) {
  List<Widget> sideToken = [];
  if(characterClass == CharacterClass.Archer) {
    sideToken.add(InterfaceSpriteSheet.archerToken);
  }
  if(characterClass == CharacterClass.SwordsMan) {
    sideToken.add(Padding(
      padding: const EdgeInsets.all(4),
      child: InterfaceSpriteSheet.swordsmanToken,
    ));
  }
  if(characterClass == CharacterClass.Knight) {
    sideToken.add(InterfaceSpriteSheet.knightToken);
  }
  if(faction == CharacterFaction.Communist) {
    sideToken.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: InterfaceSpriteSheet.communistSymbol,
    ));
  }
  if(faction == CharacterFaction.Capitalist) {
    sideToken.add(InterfaceSpriteSheet.capitalistSymbol);
  }
  if(faction == CharacterFaction.Monarchist) {
    sideToken.add(InterfaceSpriteSheet.monarchistSymbol);
  }
  // sideToken.add(InterfaceSpriteSheet.interface);
  return sideToken;

}

class MinigameInterface {
  static Image get bowLowDraw => Image.asset('assets/images/minigame/bow_low_draw.png',height: 400, fit: BoxFit.cover,);
  static Image get bowMediumDraw => Image.asset('assets/images/minigame/bow_medium_draw.png',height: 400, fit: BoxFit.cover,);
  static Image get bowFullDraw => Image.asset('assets/images/minigame/bow_full_draw.png',height: 400, fit: BoxFit.cover,);
  static Image get minigameDecoration => Image.asset('assets/images/minigame/minigame_decoration.png',height: 400, fit: BoxFit.cover,);

  static Image getBackground(value) {
    switch (value) {
      case 1:
        return bowLowDraw;
      case 2:
        return bowMediumDraw;
      case 3:
        return bowFullDraw;
      default:
        return bowLowDraw;
    }
  }
}

class BackgroundImages {
  static String get clouds => 'background/clouds_background.png';
}

class ItemSprites {
  static Image get logIcon => Image.asset('assets/images/items/log.png', height: 64, fit: BoxFit.cover);
}