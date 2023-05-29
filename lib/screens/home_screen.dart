import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _counter = 0;
  String _content = 'أستغفر الله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() => _counter += 1);
        },
        backgroundColor: Colors.brown.shade600,
        child: const Icon(Icons.add,),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('الصفحة الرئيسية',style: GoogleFonts.arefRuqaa(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/info_screen');
              },
              icon: const Icon(Icons.info)),
          PopupMenuButton<String>(
            onSelected:(String value){
              if(value != _content){
                setState(() => _content = value);
              }
              if(value == _content){
               setState(() => _counter = 0);
              }
            },
            itemBuilder: (context){
            return [
              PopupMenuItem(
                value: 'أستغفر الله',
                child: Text(
                  'أستغفر الله',
                  style: GoogleFonts.arefRuqaa(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: 'الحمد الله',
                child: Text(
                  'الحمد لله',
                  style: GoogleFonts.arefRuqaa(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: 'سبحان الله',
                child: Text(
                'سبحان الله',
               style: GoogleFonts.arefRuqaa(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
                ),),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: 'لا اله الا الله',
                child: Text(
               'لا اله الا الله',

               style: GoogleFonts.arefRuqaa(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
                ),),
              ),
            ];
          }),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0XFFE38B29),
              Color(0XFFFFD8A9),
            ]
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsetsDirectional.only(bottom: 5,),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/image1.png'),
              ),
            ),
            Text(
              'مسبحة الأذكار',style: GoogleFonts.arefRuqaa(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
            const Divider(
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsetsDirectional.only(start: 30,end: 30,top: 20,),
              child: Row(
                children: [
                  Expanded(
                     child: Text(
                       _content,
                       textAlign: TextAlign.center,
                       style: GoogleFonts.arefRuqaa(
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                  ),)),
                  Container(
                    alignment: Alignment.center,
                    width: 66,
                    height: 60,
                    color: Colors.grey.shade300,
                    child: Text(
                      _counter.toString(),
                      style: GoogleFonts.arefRuqaa(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),),

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 30,end: 30,top: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(10),
                          ),
                        ), backgroundColor: Colors.brown.shade600,
                      ),
                      onPressed: (){
                        setState(() => _counter += 1);
                      },

                      child: Text('تسبيح',style: GoogleFonts.arefRuqaa(
                        fontSize: 20,
                      ),),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade400,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: (){
                        setState(() => _counter = 0);
                      },
                      child: Text('اعادة',style: GoogleFonts.arefRuqaa(
                        fontSize: 20,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
