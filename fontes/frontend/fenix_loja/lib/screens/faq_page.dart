import 'package:fenix_loja/app_properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<Panel> panels = [
    Panel(
        'COMO POSSO ALTERAR MEU ENDEREÇO DE ENTREGA?',
        'Por padrão, o último endereço de entrega utilizado será salvo na sua conta da loja. Ao finalizar seu pedido, o endereço de entrega padrão será exibido e você terá a opção de alterá-lo, se necessário.',
        false),
    Panel(
        'QUANTAS AMOSTRAS GRÁTIS POSSO RESGATAR?',
        'Devido à quantidade limitada, cada conta de membro tem direito a apenas 1 amostra grátis exclusiva. Você pode incluir até 4 amostras grátis em cada compra.',
        false),
    Panel(
        'COMO POSSO ACOMPANHAR MEUS PEDIDOS E PAGAMENTOS?',
        'Por padrão, o último endereço de entrega utilizado será salvo na sua conta da loja. Ao finalizar seu pedido, o endereço de entrega padrão será exibido e você terá a opção de alterá-lo, se necessário.',
        false),
    Panel(
        'QUANTO TEMPO MEU PEDIDO LEVA PARA CHEGAR APÓS O PAGAMENTO?',
        'Por padrão, o último endereço de entrega utilizado será salvo na sua conta da loja. Ao finalizar seu pedido, o endereço de entrega padrão será exibido e você terá a opção de alterá-lo, se necessário.',
        false),
    Panel(
        'COMO MEUS PEDIDOS SÃO ENVIADOS?',
        'Por padrão, o último endereço de entrega utilizado será salvo na sua conta da loja. Ao finalizar seu pedido, o endereço de entrega padrão será exibido e você terá a opção de alterá-lo, se necessário.',
        false),
    Panel(
        'COMO FAÇO PAGAMENTOS COM PAYPAL? COMO FUNCIONA?',
        'Por padrão, o último endereço de entrega utilizado será salvo na sua conta da loja. Ao finalizar seu pedido, o endereço de entrega padrão será exibido e você terá a opção de alterá-lo, se necessário.',
        false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          'Configurações',
          style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:24.0,right:24.0,bottom: 16.0),
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),... panels.map((panel)=>ExpansionTile(
                      title: Text(
                        panel.title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                      ),

                      children: [Container(
                        padding: EdgeInsets.all(16.0),
                          color: Color(0xffFAF1E2),
                          child: Text(
                              panel.content,
                              style:
                              TextStyle(color: Colors.grey, fontSize: 12)))])).toList(),

              ],
            ),
          ),
        ),
    );
  }
}

class Panel {
  String title;
  String content;
  bool expanded;

  Panel(this.title, this.content, this.expanded);
}
