import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../model/fixed_asset.dart';
import '../../services/home_service.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/custom_list_tile.dart';
import '../../widgets/not_found_content.dart';
import '../../widgets/popup_menu_item.dart';
import '../../widgets/radio_group.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeService _homeService;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _homeService.getCatalog(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _homeService = Provider.of<HomeService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activo fijo'),
        automaticallyImplyLeading: false,
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                textTheme: const TextTheme().apply(bodyColor: Colors.black),
                dividerColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.white)),
            child: PopupMenuButton<int>(
              color: CustomColors.dartMainColor,
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: RadioGroup(),
                ),
                const PopupMenuDivider(),
                PopUpMenuItem.createPopUpMenuItem(
                    'Actualizar', 0, Icons.update),
              ],
              onSelected: (item) =>
                  _homeService.selectedPopUpMenuItem(item, context),
            ),
          ),
        ],
      ),
      body: AbsorbPointer(
        absorbing: _homeService.isLoading,
        child: _homeService.lstFixedAssets.isNotEmpty
            ? _homeService.lstFixedAssetsFiltered.isNotEmpty ||
                    _homeService.searchController.text.isNotEmpty
                ? _body(_homeService.lstFixedAssetsFiltered)
                : _body(_homeService.lstFixedAssets)
            : const NotFoundContent(text: 'No se encontró ningún resultado.'),
      ),
    );
  }

  Widget _body(List<FixedAsset> lstFixedAssets) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.search),
                title: TextField(
                  controller: _homeService.searchController,
                  keyboardType: _homeService.selectedOptionMenu == 1
                      ? TextInputType.number
                      : TextInputType.text,
                  decoration: InputDecoration(
                      hintText: _homeService.nameSearchTextEdit,
                      border: InputBorder.none),
                  onChanged: _homeService.onSearchTextChanged,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    _homeService.searchController.clear();
                    _homeService.onSearchTextChanged('');
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            itemCount: lstFixedAssets.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>
                    _homeService.openFixedAsset(context, lstFixedAssets[index]),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: CustomColors.dartMainColor, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CustomListTile(
                        title1: 'Número UIA',
                        subTitle1: lstFixedAssets[index].activeNumUia,
                        icon1: FontAwesomeIcons.hashtag,
                        title2: 'Serie',
                        subTitle2: lstFixedAssets[index].serie,
                        icon2: FontAwesomeIcons.barcode,
                      ),
                      CustomListTile(
                        title1: 'Marca',
                        subTitle1: lstFixedAssets[index].brand,
                        icon1: FontAwesomeIcons.tag,
                        title2: 'Modelo',
                        subTitle2: lstFixedAssets[index].model,
                        icon2: FontAwesomeIcons.barsStaggered,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
