import 'package:flutter/material.dart';
import 'Constantes.dart';
class LifeCycleManager extends StatefulWidget {
  LifeCycleManager({Key key, @required this.child}) : super(key: key);
  final Widget child;
  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager> with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.inactive || state == AppLifecycleState.detached)
      return;
    if(state == AppLifecycleState.paused){
      reproduceFondo.pause();
      reproduceInstrucciones.pause();
      reproduceFrases.pause();
    }
    if (state == AppLifecycleState.resumed) {
      reproduceFondo.resume();
      if(auxAudioInstrucciones)
        reproduceInstrucciones.resume();
      if(auxAudio)
        reproduceFrases.resume();
    }
  }
}