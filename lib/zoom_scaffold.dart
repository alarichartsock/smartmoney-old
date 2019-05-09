import 'package:flutter/material.dart';
import 'screens.dart';

//this file defines the animations to zoom between the contentscreen and the menuscreen.

class ZoomScaffold extends StatefulWidget {
  final Widget menuScreen;
  final Screen contentScreen;

  ZoomScaffold({this.menuScreen, this.contentScreen});

  @override
  _ZoomScaffoldState createState() => _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {
  Widget title;
  Icon searchIcon = Icon(Icons.search);
  Icon addIcon = Icon(Icons.add);
  bool searchIsOpen = false;
  bool addIsOpen = false;
  MenuController menuController;
  Curve scaleDownCurve =
      Interval(0.0, 0.3, curve: Curves.easeOut); //defining animations
  Curve scaleUpCurve = Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = Interval(0.0, 1.0, curve: Curves.easeOut);

  @override
  void initState() {
    super.initState();
    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  searchPressed() {
    setState(() {
      if (searchIcon.icon == Icons.search) {
        searchIcon = Icon(Icons.close);
        searchIsOpen = true;
        title = new TextField();
      } else {
        searchIcon = Icon(Icons.search);
        searchIsOpen = false;
        title = titleStyle(widget.contentScreen.title);
      }
    });
  }

  addPressed() {
    setState(() {
      if (addIcon.icon == Icons.add) {
        addIcon = Icon(Icons.done);
        addIsOpen = true;
        title = TextField();
      } else {
        addIcon = Icon(Icons.add);
        addIsOpen = true;
        title = titleStyle(widget.contentScreen.title);
      }
    });
  }

  searchIconButton() {
    return IconButton(
      icon: searchIcon,
      color: Colors.black,
      iconSize: 25.0,
      onPressed: () {
        searchPressed();
      },
    );
  }

  addIconButton() {
    return IconButton(
      icon: addIcon,
      color: Colors.black,
      iconSize: 25.0,
      onPressed: () {
        addPressed();
      },
    );
  }

  accountIconButton() {
    return IconButton(
      icon: Icon(Icons.person),
      color: Colors.black,
      iconSize: 25.0,
      onPressed: () {
        print("Account Pressed.");
      },
    );
  }

  buttonType(String type) {
    if (type == "search") {
      return searchIconButton();
    }
    if (type == "add") {
      return addIconButton();
    }
    if (type == "account") {
      return accountIconButton();
    } else {
      return null;
    }
  }

  titleStyle(String name) {
    return Text(name,
        style: TextStyle(
            fontSize: 27.5, color: Colors.black, fontWeight: FontWeight.w500));
  }

  returnNothing() {
    return;
  }

  createContentDisplay() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0xFFffffff), const Color(0xFFdfe9f3)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: (searchIsOpen == false) && (addIsOpen == false)
              ? titleStyle(widget.contentScreen.title)
              : title,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              menuController.toggle();
              setState(() {
                title = titleStyle(widget.contentScreen.title);
                searchIsOpen = false;
                addIsOpen = false;
                addIcon = Icon(Icons.add);
                searchIcon = Icon(Icons.search);
              });
            },
            // buttonType(widget.contentScreen.icon)
          ),
          actions: <Widget>[
            (widget.contentScreen.icon == null)
            ? Icon(Icons.add, size: 0.0)
            : buttonType(widget.contentScreen.icon)
          ],
        ),
        body: widget.contentScreen.contentBuilder(context),
      ),
    );
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;
    switch (menuController.state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(menuController.percentageOpen);
        scalePercent = scaleDownCurve.transform(menuController.percentageOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(menuController.percentageOpen);
        scalePercent = scaleUpCurve.transform(menuController.percentageOpen);
        break;
    }

    final slideAmount = 260.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius = 10.0 * menuController.percentageOpen;

    return new Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0x44000000),
              offset: const Offset(0.0, 5.0),
              blurRadius: 20.0,
              spreadRadius: 10.0,
            )
          ],
        ),
        child: ClipRRect(
          child: content,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.menuScreen,
        zoomAndSlideContent(createContentDisplay())
      ],
    );
  }
}

class ZoomScaffoldMenuController extends StatefulWidget {
  @override
  ZoomScaffoldMenuControllerState createState() =>
      ZoomScaffoldMenuControllerState();

  ZoomScaffoldMenuController({
    this.builder,
  });

  final ZoomScaffoldBuilder builder;
}

class ZoomScaffoldMenuControllerState
    extends State<ZoomScaffoldMenuController> {
  MenuController menuController;

  getMenuController(BuildContext context) {
    final scaffoldState =
        context.ancestorStateOfType(TypeMatcher<_ZoomScaffoldState>())
            as _ZoomScaffoldState;
    return scaffoldState.menuController;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, getMenuController(context));
  }

  @override
  void initState() {
    super.initState();

    menuController = getMenuController(context);
    menuController.addListener(_onMenuControllerChange);
  }

  @override
  void dispose() {
    menuController.removeListener(_onMenuControllerChange);
    super.dispose();
  }

  _onMenuControllerChange() {
    setState(() {});
  }
}

typedef ZoomScaffoldBuilder(
    BuildContext context, MenuController menuController);

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController animationController;
  MenuState state = MenuState.closed;

  MenuController({
    this.vsync,
  }) : animationController = AnimationController(vsync: vsync) {
    animationController
      ..duration = const Duration(milliseconds: 250)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  get percentageOpen {
    return animationController.value;
  }

  open() {
    animationController.forward();
  }

  close() {
    animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState { closed, open, closing, opening }
