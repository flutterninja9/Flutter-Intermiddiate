import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadsPage extends StatefulWidget {
  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          child: Padding(
            padding: const EdgeInsets.only(top: 17,left: 9),
            child: Row(
              children: [
                Icon(Icons.info_outline,color: Colors.white,),
                SizedBox(width: 5,),
                Text("Smart Downloads",style: GoogleFonts.gothicA1(color: Colors.grey[300],fontWeight: FontWeight.w500,fontSize: 16),),
                SizedBox(width: 5,),
                Text("ON",style: GoogleFonts.gothicA1(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 16),),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FeatherIcons.arrowDownCircle,color: Colors.grey,size: 120,),
              SizedBox(height: 10,),
              Text("Movies and TV Shows that you\ndownload appear here.",textAlign: TextAlign.center,style: GoogleFonts.montserrat(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 18),),
            ],
          ),
        ),
      ],
    );
  }
}
