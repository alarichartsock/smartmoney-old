import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

final menuScreenKey = GlobalKey(debugLabel: 'MenuScreen');

class MenuScreen extends StatefulWidget {
  final Menu menu;
  final String selectedItemId;
  final Function(String) onMenuItemSelected;

  MenuScreen({this.menu, this.selectedItemId, this.onMenuItemSelected})
      : super(key: menuScreenKey);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  AnimationController titleAnimationController;
  RenderBox _selectedRenderBox;
  double selectorYTop = 250.0;
  double selectorYBottom = 300.0;

  setSelectedRenderBox(RenderBox newRenderBox) async {
    final newYTop = newRenderBox.localToGlobal(const Offset(0.0, 0.0)).dy;
    final newYBottom = newYTop + newRenderBox.size.height;

    if (newYTop != selectorYTop) {
      setState(() {
        selectorYTop = newYTop;
        selectorYBottom = newYBottom;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    titleAnimationController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
  }

  @override
  void dispose() {
    titleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomScaffoldMenuController(
        builder: (BuildContext context, MenuController menuController) {
      var actualSelectorYTop = selectorYTop;
      var actualSelectorYBottom = selectorYBottom;
      var selectorOpacity = 1.0;

      if (menuController.state == MenuState.closed ||
          menuController.state == MenuState.closing) {
        final RenderBox menuScreenRenderBox =
            context.findRenderObject() as RenderBox;

        if (menuScreenRenderBox != null) {
          final menuScreenHeight = menuScreenRenderBox.size.height;
          actualSelectorYTop = menuScreenHeight - 50;
          actualSelectorYBottom = menuScreenHeight;
          selectorOpacity = 0.0;
        }
      }

      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xFFffffff), const Color(0xFFdfe9f3)])),
        width: double.infinity,
        height: double.infinity,
        child: Material(
            child: Stack(
          children: [
            createMenuTitle(menuController),
            createMenuItems(menuController),
            ItemSelector(
              topY: actualSelectorYTop,
              bottomY: actualSelectorYBottom,
              opacity: selectorOpacity,
            ),
          ],
        )),
      );
    });
  }

  createMenuTitle(MenuController menuController) {
    switch (menuController.state) {
      case MenuState.open:
        break;
      case MenuState.opening:
        titleAnimationController.forward();
        break;
      case MenuState.closed:
        break;
      case MenuState.closing:
        titleAnimationController.reverse();
        break;
    }

    return AnimatedBuilder(
        animation: titleAnimationController,
        child: OverflowBox(
          maxWidth: double.infinity,
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'moves',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
              softWrap: false,
            ),
          ),
        ),
        builder: (BuildContext context, Widget child) {
          return Transform(
            transform: Matrix4.translationValues(
                50.0 * (1.0 - titleAnimationController.value) - 5.0, 50.0, 0.0),
            child: child,
          );
        });
  }

  createMenuItems(MenuController menuController) {
    final List<Widget> listItems = [];
    final animationIntervalDuration = 0.5;
    final perListItemDelay =
        menuController.state != MenuState.closing ? 0.10 : 0.0;

    for (var i = 0; i < widget.menu.items.length; ++i) {
      var animationIntervalStart = i * perListItemDelay;
      var animationIntervalEnd =
          animationIntervalStart + animationIntervalDuration;
      final isSelected = widget.menu.items[i].id == widget.selectedItemId;
      listItems.add(
        AnimatedMenuListItem(
          curve: Interval(animationIntervalStart, animationIntervalEnd,
              curve: Curves.easeOut),
          menuState: menuController.state,
          isSelected: isSelected,
          duration: const Duration(milliseconds: 600),
          menuListItem: _MenuListItem(
            title: widget.menu.items[i].title,
            isSelected: isSelected,
            onTap: () {
              widget.onMenuItemSelected(widget.menu.items[i].id);
              menuController.close();
            },
          ),
        ),
      );
    }

    return Transform(
        transform: Matrix4.translationValues(0.0, 180.0, 0.0),
        child: Column(children: listItems));
  }
}

class ItemSelector extends ImplicitlyAnimatedWidget {
  final double topY;
  final double bottomY;
  final double opacity;

  ItemSelector({this.topY, this.bottomY, this.opacity})
      : super(
            duration: const Duration(milliseconds: 250), curve: Curves.easeOut);

  @override
  _ItemSelectorState createState() => _ItemSelectorState();
}

class _ItemSelectorState extends AnimatedWidgetBaseState<ItemSelector> {
  Tween<double> _topY;
  Tween<double> _bottomY;
  Tween<double> _opacity;

  @override
  void forEachTween(TweenVisitor visitor) {
    _topY = visitor(
        _topY, widget.topY, (dynamic value) => Tween<double>(begin: value));
    _bottomY = visitor(_bottomY, widget.bottomY,
        (dynamic value) => Tween<double>(begin: value));
    _opacity = visitor(_opacity, widget.opacity,
        (dynamic value) => Tween<double>(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _topY.evaluate(animation),
      child: Opacity(
          opacity: _opacity.evaluate(animation),
          child: Container(
            width: 5.0,
            height: _bottomY.evaluate(animation) - _topY.evaluate(animation),
            color: Colors.red,
          )),
    );
  }
}

class AnimatedMenuListItem extends ImplicitlyAnimatedWidget {
  final _MenuListItem menuListItem;
  final MenuState menuState;
  final bool isSelected;
  final Duration duration;

  AnimatedMenuListItem(
      {this.menuListItem,
      this.menuState,
      this.isSelected,
      this.duration,
      curve})
      : super(duration: duration, curve: curve);

  @override
  _AnimatedMenuListItemState createState() => _AnimatedMenuListItemState();
}

class _AnimatedMenuListItemState
    extends AnimatedWidgetBaseState<AnimatedMenuListItem> {
  final double closedSlidePosition = 150.0;
  final double openSlidePosition = 0.0;

  Tween<double> _translation;
  Tween<double> _opacity;

  updateSelectedRenderBox() {
    final renderBox = context.findRenderObject() as RenderBox;
    if (renderBox != null && widget.isSelected) {
      (menuScreenKey.currentState as _MenuScreenState)
          .setSelectedRenderBox(renderBox);
    }
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    var slide, opacity;

    switch (widget.menuState) {
      case MenuState.closed:
      case MenuState.closing:
        slide = closedSlidePosition;
        opacity = 0.0;
        break;
      case MenuState.open:
      case MenuState.opening:
        slide = openSlidePosition;
        opacity = 1.0;
        break;
    }

    _translation = visitor(
      _translation,
      slide,
      (dynamic value) => Tween<double>(begin: value),
    );

    _opacity = visitor(
        _opacity, opacity, (dynamic value) => Tween<double>(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    updateSelectedRenderBox();
    return Opacity(
      opacity: _opacity.evaluate(animation),
      child: Transform(
        transform: Matrix4.translationValues(
            0.0, _translation.evaluate(animation), 0.0),
        child: widget.menuListItem,
      ),
    );
  }
}

class _MenuListItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;

  _MenuListItem({
    this.title,
    this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color(0x44000000),
      onTap: isSelected ? null : onTap,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 20.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 2.0,
                decoration: isSelected ? TextDecoration.underline : null),
          ),
        ),
      ),
    );
  }
}

class Menu {
  final List<MenuItem> items;

  Menu({this.items});
}

class MenuItem {
  final String id;
  final String title;

  MenuItem({this.id, this.title});
}
