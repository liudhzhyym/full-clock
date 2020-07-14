import 'dart:async';
import 'package:flutter/material.dart';
import 'package:only_clock/blocs/application_bloc.dart';
import 'package:only_clock/lang/app_localizations.dart';
import 'package:only_clock/utils/screen_util.dart';
import 'package:only_clock/blocs/home_bloc.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ScreenUtil {
  String _weekDisplay(no) {
    String title = '';
    switch (no) {
      case 1: { title = AppLocalizations.of('monday'); }
      break;
      case 2: { title = AppLocalizations.of('tuesday'); }
      break;
      case 3: { title = AppLocalizations.of('wednesday'); }
      break;
      case 4: { title = AppLocalizations.of('thursday'); }
      break;
      case 5: { title = AppLocalizations.of('friday'); }
      break;
      case 6: { title = AppLocalizations.of('saturday'); }
      break;
      case 7: { title = AppLocalizations.of('sunday'); }
      break;
      default: { title = AppLocalizations.of('unknown'); }
      break;
    }
    return title;
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  Future<Color> showSettingDialog() {
    var hb = Provider.of<HomeBloc>(context, listen: false);
    return showCustomDialog<Color>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white70,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(0),
                child: Text(
                    AppLocalizations.of('select_font_color'),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: setSp(24),
                    )
                ),
              ),
              Expanded(
                child: GridView(
                  padding: EdgeInsets.only(left: 15, right: 15),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 100.0,
                        childAspectRatio: 1.0 //宽高比为2
                    ),
                    children:<Widget>[
                      Card(
                        color: Colors.white,
                        elevation: 0.0,
                        child: Container(
                          child: InkWell(
                            splashColor: Colors.white70,
                            onTap: (){
                              hb.changeFontColor(Colors.white);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.blue,
                        elevation: 0.0,
                        child: Container(
                          child: InkWell(
                            splashColor: Colors.white70,
                            onTap: (){
                              hb.changeFontColor(Colors.blue);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.indigo,
                        elevation: 0.0,
                        child: Container(
                          child: InkWell(
                            splashColor: Colors.white70,
                            onTap: (){
                              hb.changeFontColor(Colors.indigo);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.green,
                        elevation: 0.0,
                        child: Container(
                          child: InkWell(
                            splashColor: Colors.white70,
                            onTap: (){
                              hb.changeFontColor(Colors.green);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.red,
                        elevation: 0.0,
                        child: Container(
                          child: InkWell(
                            splashColor: Colors.white70,
                            onTap: (){
                              hb.changeFontColor(Colors.red);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.yellow,
                        elevation: 0.0,
                        child: Container(
                          child: InkWell(
                            splashColor: Colors.white70,
                            onTap: (){
                              hb.changeFontColor(Colors.yellow);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.pink,
                        elevation: 0.0,
                        child: Container(
                          child: InkWell(
                            splashColor: Colors.white70,
                            onTap: (){
                              hb.changeFontColor(Colors.pink);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.orange,
                        elevation: 0.0,
                        child: Container(
                          child: InkWell(
                            splashColor: Colors.white70,
                            onTap: (){
                              hb.changeFontColor(Colors.orange);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var ab = Provider.of<ApplicationBloc>(context);
    int batteryLevel = ab.batteryLevel;
    DateTime dateTime = ab.dateTime;
    Color fontColor = Provider.of<HomeBloc>(context).fontColor;

    initScreenUtil(context, width: 750, height: 1344);
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(0),
                    height: setHeight(80),
                    width: setWidth(60),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${batteryLevel.toString()}%',
                      style: TextStyle(
                        color: fontColor,
                        fontSize: setSp(20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                      height: setHeight(180),
                      alignment: Alignment.center,
                      child: Text(
                        '${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}  ${_weekDisplay(dateTime.weekday)}',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: setSp(32),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(0),
                    height: setHeight(80),
                    width: setWidth(60),
                  ),
                ],
              ),

              Expanded(
                child: Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(
                      minWidth: double.infinity, //宽度尽可能大
                      minHeight: double.infinity //最小高度为50像素
                  ),
                  alignment: Alignment.center,
                  child: Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: setSp(200),
                        ),
                      ),
                      TextSpan(
                        text: ' ${dateTime.second.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: setSp(40),
                        ),
                      )
                    ],
                  )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                height: setHeight(180),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Color color = await showSettingDialog();
          if (color != null) {
            print('Color is: '+color.toString());
          }
        },
        backgroundColor: Colors.black45,
        mini: true,
        child: Icon(Icons.settings, color: Colors.white24,),
      ),
    );
  }
}