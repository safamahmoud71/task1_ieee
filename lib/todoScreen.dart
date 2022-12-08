import 'package:flutter/material.dart';
class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final items = List<String>.generate(30, (index) => 'Item ${index+1}');

  @override
  Widget build(BuildContext context) {
   TextEditingController textc = TextEditingController();
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(

          )),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(onPressed: (){
              setState(() {
                items.clear();
              });
            },
                icon: Icon(Icons.menu))
          ],
          leading:IconButton(onPressed: (){},
              icon: Icon(Icons.sort)) ,
          centerTitle: true,
          title: Text("TODO APP", style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ),
        body: items.isNotEmpty ?
            SingleChildScrollView(
              child: Container(
                height:  700,
                width:  double.infinity,
                child: ListView.builder(
                  itemCount: items.length,
                    itemBuilder: (context , index){
                    final item= items[index];
                    return  Card(
                      child: Dismissible(
                        key: UniqueKey(),
                        onDismissed: (d)
                        {
                          setState(() {
                            items.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content : Text('$item has been deleted succssfully ')
                          ));
                        },
                        child: ListTile(
                          title: Text(items[index]),

                        ),

                      ),
                    );
                    }

                )
              ),

            )
      : SingleChildScrollView(
          child: Container(
            color: Colors.white,
              margin: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Text(
                    'You have no tasks please add one !:D',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                ],
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.redAccent,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return SizedBox(
                    height: 110,
                    child: MaterialApp(
                      home: Scaffold(
                        body: Center(
                          child: Column(
                            children: [
                              TextField(
                                controller: textc,
                                decoration: const InputDecoration(
                                    hintText: 'New Todo',
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (textc.text.isNotEmpty)
                                          items.add(textc.text);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Add')),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });

          },
        ),
      ),

    );
  }
}
