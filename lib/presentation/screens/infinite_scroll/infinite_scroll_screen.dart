import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final scrollController = ScrollController();
  bool isLoading = false;
  bool ismounted = true;


  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        loadNextPage();
      }
    });
    

  }

  @override
  void dispose() {   
    scrollController.dispose();
    isLoading = false; //* Cuando el componente se marca para ser destruido, esta siendo destruido o ya no existe
    super.dispose();
  }

  Future loadNextPage() async {

    if(isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    /*  
     * Valida que estemos en la vista de imagenes con el fin de no recargar
     * con el fin de evitar errores al intentar un recarga cuando no es esta en la vista
    */
    if(!mounted) return;

    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if(!ismounted) return;

    isLoading=false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    
    setState(() {});
    
    
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll(
      [1,2,3,4,5].map((newId) => lastId + newId)
    );
  }

  void moveScrollToBottom(){

    if(scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 400), 
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: ()=> context.pop(),
          child: !isLoading? const Icon(Icons.arrow_back_ios_new_outlined):
                  const CircularProgressIndicator()
        )
    );
  }
}