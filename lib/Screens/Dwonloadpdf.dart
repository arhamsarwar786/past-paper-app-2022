import 'package:book_app/Const.dart';
import 'package:book_app/Path%20Manager/Download%20Manager/download.dart';
import 'package:book_app/Screens/pdf_viewer.dart';
import 'package:book_app/SharePreferences/SharePreferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Downloads extends StatelessWidget {
  const Downloads({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MyProvider>(context,listen: false).fetchPdfs();
    return DefaultTabController(

      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          SavedPreferences.clearPreferences();
          print("okkkkkkkkkkkkkkkkkkkk");

        }),
        appBar: AppBar(
          backgroundColor: Constant.primarycolor,
          bottom: TabBar(tabs: [
            Tab(text: "Downloaded",icon: Icon(Icons.download_done),),
            Tab(text: "Downloading",icon: Icon(Icons.download),),
          ]),
        ),
        body: Consumer<MyProvider>(
          builder: (context,provider,child) {
            return TabBarView(
              children: [
                Container(
                      child: provider.downloadedPdfs == null ? Center(child: Text("No Downloads"),): ListView.builder(
                        
                        itemCount: provider.downloadedPdfs.length,
                        itemBuilder: (context,index){
                          print(provider.downloadedPdfs[index]);
                          var pdf = provider.downloadedPdfs[index];
                            var key = pdf.keys.toList()[0];
                        return Card(
                          child: ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> PdfViewerOpener(key,pdf[key])));
                            },
                            title: Text("$key"),
                            subtitle: Text("Downloaded",style: TextStyle(color: Colors.green),),
                            trailing: Icon(Icons.check,color: Colors.green,),
                          ),
                        );
                      }),
                    ),
                  
                provider.progress >=1 || provider.progress == 0 ? Center(child: Text("No Downloading Yet"),) : ListTile(
                      title: Text("Paper Downloading... ${(provider.progress*100).round()}"),
                      subtitle: LinearProgressIndicator(value: provider.progress,),
                      trailing: Icon(Icons.download),
                    )
              ],
            );
          }
        ),
      ),
    );
  }
}