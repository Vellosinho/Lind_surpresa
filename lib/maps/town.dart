import 'package:bonfire/bonfire.dart';
import 'package:bonfire/player/lit_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/enum/character_faction.dart';
// import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';
import 'package:projeto_gbb_demo/game/interface/player_interface.dart';
import 'package:projeto_gbb_demo/game/objects/daytime_clock.dart';
import 'package:projeto_gbb_demo/game/objects/objects.dart';
import 'package:projeto_gbb_demo/parallax/parallax_clouds.dart';
import 'package:projeto_gbb_demo/players/cookie.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';
import 'package:projeto_gbb_demo/forge_minigame/minigame.dart';
import 'package:projeto_gbb_demo/players/lind.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class TownMap extends StatefulWidget {
  // late final widget.controller widget.controller;
  final LocalGameController controller;

  const TownMap({super.key, required this.controller});

  @override
  State<TownMap> createState() => _TownMapState();
}

class _TownMapState extends State<TownMap> {
  late final CharacterFaction playerFaction;
  late final SimpleDirectionAnimation playerOneAnimations;
  late final String id;

  @override
  void initState() {
    playerFaction = context.read<PlayerConsts>().faccao;
    // playerOneAnimations = getAnimations(playerOneClass, playerFaction);
    id = const Uuid().v1();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    double tileSize = 192;

    
    List<GameDecoration> forest = [
      // Big Trees
      PineTree(position: Vector2(tileSize * 15, tileSize * 74), localGameController: widget.controller),
      PineTree(position: Vector2(tileSize * 21, tileSize * 74), localGameController: widget.controller),
      PineTree(position: Vector2(tileSize * 24, tileSize * 72), localGameController: widget.controller),
      PineTree(position: Vector2(tileSize * 27, tileSize * 83), localGameController: widget.controller),
      PineTree(position: Vector2(tileSize * 31, tileSize * 87), localGameController: widget.controller),
      PineTree(position: Vector2(tileSize * 33, tileSize * 84), localGameController: widget.controller),

      // Medium Trees
      PineTreeMedium(position: Vector2(tileSize * 17, tileSize * 75), localGameController: widget.controller),
      PineTreeMedium(position: Vector2(tileSize * 25, tileSize * 74), localGameController: widget.controller),
      PineTreeMedium(position: Vector2(tileSize * 26, tileSize * 77), localGameController: widget.controller),
      PineTreeMedium(position: Vector2(tileSize * 25, tileSize * 85), localGameController: widget.controller),
      PineTreeMedium(position: Vector2(tileSize * 29, tileSize * 82), localGameController: widget.controller),

      PineTreeSmall(position: Vector2(tileSize * 20, tileSize * 73), localGameController: widget.controller),
      PineTreeSmall(position: Vector2(tileSize * 24, tileSize * 75), localGameController: widget.controller),
      PineTreeSmall(position: Vector2(tileSize * 21, tileSize * 71), localGameController: widget.controller),
      PineTreeSmall(position: Vector2(tileSize * 23, tileSize * 70), localGameController: widget.controller),
      PineTreeSmall(position: Vector2(tileSize * 29, tileSize * 85), localGameController: widget.controller),
      PineTreeSmall(position: Vector2(tileSize * 33, tileSize * 86), localGameController: widget.controller),
      PineTreeSmall(position: Vector2(tileSize * 35, tileSize * 83), localGameController: widget.controller),
    ];
    
    LocalGameController gameController = context.read<LocalGameController>();
    LitPlayer player = Lind(
      localGameController: gameController,
      id: id,
      playerLife: context.watch<LocalGameController>().playerLife.toDouble(),
      onHit: () {
        gameController.hit(2);
      },
      faction: playerFaction,
      position: Vector2(tileSize * 12, tileSize * 85),
    );

    return BonfireWidget(
      backgroundColor: Color(0xff2c6ec7),
      background: BonfireParallaxBackground(),
      playerControllers: [
        Keyboard(
            config: KeyboardConfig(acceptedKeys: [
          LogicalKeyboardKey.arrowDown,
          LogicalKeyboardKey.arrowLeft,
          LogicalKeyboardKey.arrowUp,
          LogicalKeyboardKey.arrowRight,
          LogicalKeyboardKey.keyZ,
          LogicalKeyboardKey.keyX,
          LogicalKeyboardKey.keyC,
          LogicalKeyboardKey.escape,
        ]))
      ],
      // widget.controller: widget.controller,
      lightingColorGame: Colors.orange[400]!.withAlpha(48),
      components: [
        Bonfire(
            position: Vector2(tileSize * 15.5, tileSize * 85),
            localGameController: widget.controller),
        Shack(position: Vector2(tileSize * 10, tileSize * 83)),
        Tent(
            position: Vector2(tileSize * 15, tileSize * 80),
            localGameController: widget.controller),
        CookieNPC(position: Vector2(tileSize * 15.5, tileSize * 83.5), size: PlayerConsts.characterSize, hitboxSize: PlayerConsts.characterHitbox, hitboxPosition: PlayerConsts.characterHitboxPosition, controller: gameController),
        DayTimeClock(
            position: Vector2(0, 0), localGameController: widget.controller),
        ...forest
      ],
      // ],
      // cameraConfig: CameraConfig(zoom: 0.1, moveOnlyMapArea: true),
      cameraConfig: CameraConfig(zoom: 0.8, moveOnlyMapArea: true),
      map: WorldMapByTiled(
          WorldMapReader.fromAsset('ruins_village_map/snowy_hills.json'),
          forceTileSize: Vector2(tileSize, tileSize)),
      player: player,
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) =>
            PlayerInterface(game: game, characterClass: playerOneClass),
        MiniGame.overlayKey: (context, game) => MiniGame(),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
        MiniGame.overlayKey,
      ],
      // showCollisionArea: true,
    );
  }
}
