import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:plaktago/data_class/app_settings.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class UpdateButton extends StatefulWidget {
  final AppSettings settings;
  final IsarService isarService;
  
  const UpdateButton({
    Key? key,
    required this.settings,
    required this.isarService
  });

  @override
  State<UpdateButton> createState() => _UpdateButton();
}

class _UpdateButton extends State<UpdateButton> {
  final _shorebirdCodePush = ShorebirdCodePush();
  Color _backgroundColor = Colors.grey[600]!;
  bool updateAvailable = false;

  @override
  void initState() {
    super.initState();
    checkForUpdate();
  }

  Future<void> checkForUpdate() async {
    _shorebirdCodePush.currentPatchNumber().then((currentPatchVersion) {
      if (currentPatchVersion != null) {
        widget.settings.patch = currentPatchVersion;
      } else {
        widget.settings.patch = 0;
      }
      widget.isarService.saveAppSettings(widget.settings);
    });
    setState(() async {
      updateAvailable = await _shorebirdCodePush.isNewPatchAvailableForDownload();      
    });
  }

  Future<void> _downloadUpdate() async {
    if (updateAvailable) {
      await Future.wait([
        _shorebirdCodePush.downloadUpdateIfAvailable(),
        Future<void>.delayed(const Duration(milliseconds: 250)),
      ]);
      _showRestartBanner();
    }
  }

  void _showRestartBanner() {
    Flushbar(
      message: "Redémarrage nécéssaire",
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      mainButton: TextButton(
        onPressed: Restart.restartApp,
        child: Text("Redémarrer"),
      ),
      duration: Duration(seconds: 5),
      borderRadius: BorderRadius.circular(15),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Theme.of(context).colorScheme.surface,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    if (updateAvailable == true) { _backgroundColor = Theme.of(context).colorScheme.primary; }    return Align(
      child: SizedBox(
        height: 40,
        width: 135,
        child: FloatingActionButton.extended(
          onPressed: _downloadUpdate,
          elevation: 2,
          backgroundColor:_backgroundColor,
          splashColor: _backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            side: BorderSide(
              width: 1,
              color: _backgroundColor
            ),
          ),
          icon: Stack(
            children: <Widget>[
              Icon(Icons.download),
              if (updateAvailable)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 10,
                      minHeight: 10,
                    ),
                    child: Text(
                      '1',
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center
                    )
                  )
                )
            ]
          ),
          label: Text("Mise à jour", style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600)),
        )
      )
    );
  }
}
