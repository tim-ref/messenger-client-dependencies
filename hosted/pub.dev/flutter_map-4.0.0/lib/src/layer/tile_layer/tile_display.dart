import 'package:flutter_map/src/layer/tile_layer/tile_layer.dart';

abstract class TileDisplay {
  const TileDisplay();

  // Instantly display tiles once they are loaded without a fade animation.
  const factory TileDisplay.instantaneous({
    /// Sets the opacity of tile images to the given value (0.0 - 1.0), default
    /// 1.0. Note that this opacity setting is applied at the tile level which
    /// means that overlapping tiles will be simultaneously visible. This can
    /// happen when changing zoom as tiles from the previous zoom level will
    /// not be cleared until all of the tiles at the new zoom level have
    /// finished loading. For this reason this opacity setting is only
    /// recommended when the displayed map will remain at the same zoom level
    /// or will not move gradually between zoom levels at the same position.
    ///
    /// If you wish to show a transparent map without these restrictions you
    /// can simply wrap the entire [TileLayer] in an [Opacity] widget.
    double opacity,
  }) = InstantaneousTileDisplay._;

  /// Fade in the tile when it is loaded. Not that opacity is not supported
  /// when fading is enabled. This is because underlying tiles are kept when
  /// fading in a new tile until it is loaded and with a partially transparent
  /// tile they are both visible during fading which causes flickering.
  ///
  /// If you wish to make the TileLayer transparent you must disable fading
  /// (see the TileDisplay.instantaneous opacity option) or wrap the whole
  /// TileLayer in an Opacity widget.
  const factory TileDisplay.fadeIn({
    /// Duration of the fade. Defaults to 100ms.
    Duration duration,

    /// Opacity start value when a tile is faded in, default 1.0. The allowed
    /// range is (0.0 - 1.0).
    double startOpacity,

    /// Opacity start value when a tile is reloaded, default 1.0. A tile reload
    /// will occur when the provider tile url changes and
    /// [TileLayer.overrideTilesWhenUrlChanges] is true. Valid range is
    /// (0.0 - 1.0).
    double reloadStartOpacity,
  }) = FadeInTileDisplay._;

  T? map<T>({
    T? Function(InstantaneousTileDisplay instantaneous)? instantaneous,
    T? Function(FadeInTileDisplay fadeIn)? fadeIn,
  }) {
    switch (runtimeType) {
      case InstantaneousTileDisplay:
        return instantaneous?.call(this as InstantaneousTileDisplay);
      case FadeInTileDisplay:
        return fadeIn?.call(this as FadeInTileDisplay);
    }
    return null;
  }
}

class InstantaneousTileDisplay extends TileDisplay {
  final double opacity;

  const InstantaneousTileDisplay._({
    this.opacity = 1.0,
  }) : assert(opacity >= 0.0 && opacity <= 1.0);

  // Note this is used to check if the option has changed.
  @override
  bool operator ==(Object other) {
    return other is InstantaneousTileDisplay && opacity == other.opacity;
  }

  @override
  int get hashCode => opacity.hashCode;
}

class FadeInTileDisplay extends TileDisplay {
  final Duration duration;
  final double startOpacity;
  final double reloadStartOpacity;

  /// Options for fading in tiles when they are loaded.
  const FadeInTileDisplay._({
    this.duration = const Duration(milliseconds: 100),
    this.startOpacity = 0.0,
    this.reloadStartOpacity = 0.0,
  })  : assert(startOpacity >= 0.0 && startOpacity <= 1.0),
        assert(reloadStartOpacity >= 0.0 && reloadStartOpacity <= 1.0);

  // Note this is used to check if the option has changed.
  @override
  bool operator ==(Object other) {
    return other is FadeInTileDisplay &&
        duration == other.duration &&
        startOpacity == other.startOpacity &&
        reloadStartOpacity == other.reloadStartOpacity;
  }

  @override
  int get hashCode => Object.hash(duration, startOpacity, reloadStartOpacity);
}
