import "package:flutter/material.dart";

class StarredList extends StatelessWidget {
  final List<String> _showUpList;

  StarredList(this._showUpList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Starred names"),
        centerTitle: true,
      ),
      body: createListView(),
    );
  }

  ListView createListView() {
    return ListView.builder(
      itemCount: _showUpList.length,
      itemBuilder: (BuildContext context, int position) {
        return ListTile(
          title: Text(_showUpList[position]),
        );
      },
    );
  }
}