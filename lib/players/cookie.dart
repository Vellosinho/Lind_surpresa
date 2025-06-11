import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';

class CookieNPC extends SimpleAlly with Lighting {
  Vector2 hitboxSize;
  Vector2 hitboxPosition;
  LocalGameController controller;
  bool willTalk = true;
  bool tutorialExplained = false;
  CookieNPC({
    required super.position,
    required super.size,
    required this.hitboxSize,
    required this.hitboxPosition,
    required this.controller,
  }) : super(
            speed: 0,
            animation: SimpleDirectionAnimation(
              idleDown: CookieSprites.cookieSleep,
              idleLeft: CookieSprites.cookieSleep,
              idleRight: CookieSprites.cookieSleep,
              runRight: CookieSprites.cookieSleep,
            ),
            receivesAttackFrom: AcceptableAttackOriginEnum.ALL) {
    // setupLighting(
    //   LightingConfig(
    //     radius: width * 1.25,
    //     color: Colors.transparent,
    //     blurBorder: 160, // this is a default value
    //     // type: LightingType.circle, // this is a default value
    //     // useComponentAngle: false, // this is a default value. When true light rotate together component when change `angle` param.
    //   ),
    // );
  }

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: hitboxSize, position: hitboxPosition));
    return super.onLoad();
  }

  @override
  void onReceiveDamage(attacker, double damage, identify, damageType) {
    if (willTalk) {
      // TalkDialog.show(context, getCurrentLines(), style: const TextStyle(fontFamily: 'PressStart2P', fontSize: 24, height: 1.5));
    }
    willTalk = !willTalk;
    super.onReceiveDamage(attacker, 0, identify, damageType);
  }

}
