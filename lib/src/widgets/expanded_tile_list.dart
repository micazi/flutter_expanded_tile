//SECTION - Imports
//
//s1 PACKAGES
//---------------
//s2 CORE
import 'package:flutter/material.dart';
//s2 3RD-PARTY
//
//s1 DEPENDENCIES
//---------------
//s2 SERVICES
//s2 MODELS
import '../controller.dart';
import '../models/tile_list_type.enum.dart';
import 'expanded_tile.dart';

//s2 MISC
//!SECTION - Imports
//
//SECTION - Exports
//!SECTION - Exports
//
typedef ExpandedTileBuilder = ExpandedTile Function(BuildContext context, int index, ExpandedTileController controller);

/// An extension of the listview returning a list of [ExpandedTile] widgets which are
/// Expansion tile similar to the list tile supports leading widget,
/// Trailing widget and programatic control with content expansion animation.
///
///
/// This ListView also supports separate controllers for each tile with separate programatic controls.
///
///
/// Available constructors right now: [ExpandedListTile.builder()] , [ExpandedListTile.separated()]
///
///
/// P.S : Supplied Controllers are overlooked in the [ExpandedTileList] builder widget, supply a new or initialized controller, it doesn't matter!
///
/// {@tool snippet}
///
/// ```dart
/// ExpandedTileList.builder(
///  itemCount: 7,
///  maxOpened: 2,
///   itemBuilder: (context, index, controller) {
///     return ExpandedTile(
///       controller:controller,
///       onTap: (){
///       },
///       onLongTap: (){
///       },
///       theme: ExpandedTileThemeData(),
///       title:
///       content:
///       ...
///   }
/// )
///
/// ```
/// {@end-tool}
class ExpandedTileList extends StatefulWidget {
  //SECTION - Widget Arguments
  final TileListConstructor _constructor;
  //
  final int itemCount;
  final IndexedWidgetBuilder? separatorBuilder;
  final ExpandedTileBuilder itemBuilder;
  final int maxOpened;
  final List<int> initiallyOpenedControllersIndexes;
  //
  final EdgeInsetsGeometry? padding;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool reverse;
  final String? restorationId;
  //!SECTION
  //
  const ExpandedTileList.builder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.maxOpened = 1,
    this.initiallyOpenedControllersIndexes = const [],
    this.padding,
    this.scrollController,
    this.physics,
    this.shrinkWrap = true,
    this.reverse = false,
    this.restorationId,
  })  : assert(itemCount != 0, 'Item Count cannot be 0!'),
        assert(maxOpened != 0, 'Max Opened cannot be 0!'),
        _constructor = TileListConstructor.builder,
        separatorBuilder = null;

  const ExpandedTileList.separated({
    super.key,
    required this.itemCount,
    required this.separatorBuilder,
    required this.itemBuilder,
    this.maxOpened = 1,
    this.initiallyOpenedControllersIndexes = const [],
    this.padding,
    this.scrollController,
    this.physics,
    this.shrinkWrap = true,
    this.reverse = false,
    this.restorationId,
  })  : assert(itemCount != 0, 'Item Count cannot be 0!'),
        assert(maxOpened != 0, 'Max Opened cannot be 0!'),
        assert(initiallyOpenedControllersIndexes.length <= maxOpened, "Initially opened controllers can't exceed max number of opened tiles!"),
        _constructor = TileListConstructor.separated;

  @override
  State<ExpandedTileList> createState() => _ExpandedTileListState();
}

class _ExpandedTileListState extends State<ExpandedTileList> {
  //
  //SECTION - State Variables
  //s1 --State
  //s1 --State
  //
  //s1 --Controllers
  late List<ExpandedTileController> tileControllers;
  late List<ExpandedTileController> openTileControllers;
  late ScrollController scrollController;
  //s1 --Controllers
  //
  //s1 --Constants
  //s1 --Constants
  //!SECTION

  @override
  void initState() {
    super.initState();
    //
    //SECTION - State Variables initializations & Listeners
    //s1 --State
    //s1 --State
    //
    //s1 --Controllers & Listeners
    scrollController = widget.scrollController ?? ScrollController();
    tileControllers = List.generate(
      widget.itemCount,
      (index) => ExpandedTileController(key: Key(index.toString()), isExpanded: widget.initiallyOpenedControllersIndexes.contains(index)),
    );
    openTileControllers = widget.initiallyOpenedControllersIndexes.map((ind) => tileControllers[ind]).toList();
    //s1 --Controllers & Listeners
    //
    //s1 --Late & Async Initializers
    //s1 --Late & Async Initializers
    //!SECTION
  }

  //SECTION - Dumb Widgets
  //!SECTION

  //SECTION - Stateless functions
  //!SECTION

  //SECTION - Action Callbacks\
  _onTap(int index, ExpandedTileController controller) {
    if (widget.itemBuilder(context, index, tileControllers[index]).enabled) {
      int currentlyOpenTiles = openTileControllers.length;
      if (tileControllers[index].isExpanded) {
        if (currentlyOpenTiles == widget.maxOpened) {
          openTileControllers.last.collapse();
          openTileControllers.removeLast();
        }
        openTileControllers.add(tileControllers[index]);
      } else {
        openTileControllers.remove(tileControllers[index]);
      }
      if (widget.itemBuilder(context, index, tileControllers[index]).onTap != null) {
        widget.itemBuilder(context, index, tileControllers[index]).onTap!();
      }
    }
  }

  //!SECTION

  @override
  Widget build(BuildContext context) {
    //SECTION - Build Setup
    //s1 --Values
    //s1 --Values
    //
    //s1 --Contexted Widgets
    //s1 --Contexted Widgets
    //!SECTION

    //SECTION - Build Return
    return widget._constructor == TileListConstructor.builder
        ? ListView.builder(
            shrinkWrap: widget.shrinkWrap,
            controller: scrollController,
            itemCount: widget.itemCount,
            reverse: widget.reverse,
            physics: widget.physics,
            padding: widget.padding,
            //
            itemBuilder: (context, index) {
              return widget
                  .itemBuilder(
                    context,
                    index,
                    tileControllers[index],
                  )
                  .copyWith(
                    controller: tileControllers[index],
                    onTap: () => _onTap(index, tileControllers[index]),
                  );
            },
          )
        : ListView.separated(
            shrinkWrap: widget.shrinkWrap,
            controller: scrollController,
            itemCount: widget.itemCount,
            reverse: widget.reverse,
            physics: widget.physics,
            padding: widget.padding,
            separatorBuilder: (context, index) {
              return widget.separatorBuilder!(
                context,
                index,
              );
            },
            itemBuilder: (context, index) {
              return widget
                  .itemBuilder(
                    context,
                    index,
                    tileControllers[index],
                  )
                  .copyWith(
                    controller: tileControllers[index],
                    onTap: () => _onTap(index, tileControllers[index]),
                  );
            },
          );
    //!SECTION
  }
}
