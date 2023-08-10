import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../model/fixed_asset.dart';
import '../../services/home_service.dart';
import '../../utils/custom_colors.dart';
import '../../utils/var.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: RadioGroup(),
                ),
                const PopupMenuDivider(),
                PopUpMenuItem.createPopUpMenuItem(
                    'Actualizar', 0, Icons.update),
                PopUpMenuItem.createPopUpMenuItem(
                    'Cerrar sesión', 1, Icons.logout),
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
                ? LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (constraints.maxWidth > Var.maxWidth) {
                        return _body(_homeService.lstFixedAssetsFiltered, true);
                      } else {
                        return _body(
                            _homeService.lstFixedAssetsFiltered, false);
                      }
                    },
                  )
                : LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (constraints.maxWidth > Var.maxWidth) {
                        return _body(_homeService.lstFixedAssets, true);
                      } else {
                        return _body(_homeService.lstFixedAssets, false);
                      }
                    },
                  )
            : const NotFoundContent(text: 'No se encontró ningún resultado.'),
      ),
    );
  }

  Widget _body(List<FixedAsset> lstFixedAssets, bool isNotMobile) {
    return Column(
      children: [
        Container(
          color: CustomColors.dartMainColor,
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
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isNotMobile
                            ? MediaQuery.of(context).size.width / 4
                            : 0,
                      ),
                      child: GestureDetector(
                        onTap: () => _homeService.openPrivacyPolice(
                            context, lstFixedAssets[index]),
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
                      ),
                    );
                  },
                  childCount: lstFixedAssets.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
