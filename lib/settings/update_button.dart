import 'package:flutter/material.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 40,
        width: 135,
        child: FloatingActionButton.extended(
          onPressed: () {},
          elevation: 2,
          backgroundColor: Theme.of(context).colorScheme.primary,
          splashColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            side: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.primary
            ),
          ),
          icon: Stack(
            children: <Widget>[
              Icon(Icons.download),
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
