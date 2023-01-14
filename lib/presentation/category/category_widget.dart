import 'package:dashboard_shox_shop/data/models/all_category.dart';
import 'package:dashboard_shox_shop/data/urls.dart';
import 'package:dashboard_shox_shop/presentation/category/alert_category.dart';
import 'package:dashboard_shox_shop/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  AllCagegory? _allCagegory;
  Future init() async {
    var result = await ApiService.Get(Url: AppUrls.categoryAllPagenated);

    _allCagegory = result;
    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _allCagegory?.data?.length,
        itemBuilder: ((context, index) => Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: (c) {},
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (c) {},
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${AppUrls.base}/Uploads/${_allCagegory?.data?[index].image}"))),
                ),
                title: Text("${_allCagegory?.data?[index].name}"),
                onTap: () => showDialog(
                    context: context, builder: ((context) => AlertCategory())),
              ),
            )));
  }
}
