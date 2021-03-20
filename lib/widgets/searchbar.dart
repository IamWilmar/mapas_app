part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: GestureDetector(
          onTap: () async {
            print('search bar activada');
            final resultado = await showSearch(
              context: context,
              delegate: SearchDestination(),
            );
            this.retornoBusqueda(resultado);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              'A donde quieres ir?',
              style: TextStyle(color: Colors.black87),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void retornoBusqueda(SearchResult result) {
    print('cancelo: ${result.cancelo}');
    print('manual: ${result.manual}');
    if (result.cancelo) return;
  }
}
