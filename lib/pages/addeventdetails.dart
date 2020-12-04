import 'package:flutter/material.dart';
import 'package:ocm/resource/functions.dart';
import 'package:ocm/server/putEvent.dart';

class ShowEventSheet extends StatefulWidget {
  @override
  _ShowEventSheetState createState() => _ShowEventSheetState();
}

class _ShowEventSheetState extends State<ShowEventSheet> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

addEventBottomSheet(BuildContext context) {
  var descController = TextEditingController();
  var batchController = TextEditingController();
  var idController = TextEditingController();
  var nameController = TextEditingController();
  ////
  var usrID;
  bool err = false;
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32.0),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 10,
                right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "ADD new events",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.cancel),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: idController,
                  onChanged: (val) async {
                    bool ret = false;
                    // print(val);
                    ret = await checkID(val);
                    if (ret != err) {
                      err = ret;
                      //  (context as Element).reassemble();
                      // (context as Element).rebuild();
                    }
                  },
                  decoration: InputDecoration(
                    errorText: err ? "ID exists!!!" : null,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: "Event ID",
                    hintText: "Event ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: "Event Name",
                    hintText: "Event Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: "Event Description",
                    hintText: "Event Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: batchController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    labelText: "Batch ID",
                    hintText: "Target Batch",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(32.0),
                  color: Color(0xff01A0C7),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * .5,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () async {
                      await putEvent(
                          idController.text,
                          usrID,
                          batchController.text,
                          nameController.text,
                          descController.text);
                      Navigator.of(context).pop();
                      //    setState(() {});
                    },
                    child: Text(
                      "ADD EVENT",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      });
}
