import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Roboto'),
      home: const BankingHomePage(),
    );
  }
}

class BankingHomePage extends StatefulWidget {
  const BankingHomePage({Key? key}) : super(key: key);

  @override
  State<BankingHomePage> createState() => _BankingHomePageState();
}

class _BankingHomePageState extends State<BankingHomePage> {
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      _buildQuickTransferCard(),
                      const SizedBox(height: 16),
                      _buildBalanceCard(),
                      const SizedBox(height: 16),
                      _buildOfflinePaymentCard(),
                      const SizedBox(height: 16),
                      _buildActionGrid(),
                      const SizedBox(height: 16),
                      _buildReferralCard(),
                      const SizedBox(height: 16),
                      _buildMainActionButtons(),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            _buildBottomNavBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.purple[100],
            child: const Text(
              'JC',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Hola Juan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(' 👋', style: TextStyle(fontSize: 20)),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.headset_mic_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildQuickTransferCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Rápido y sin complicaciones',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Transfiere a otros bancos al instante',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.account_balance,
                    color: Colors.purple[400],
                    size: 30,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.grey,
                      ),
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

  Widget _buildBalanceCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Saldo disponible',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      _isBalanceVisible ? '\$ 0,00' : '\$ ****',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _isBalanceVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          _isBalanceVisible = !_isBalanceVisible;
                        });
                      },
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Recargar desde',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'PRINCIPAL ******0261',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '+ \$10',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.double_arrow, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text(
                        'd!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[700],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflinePaymentCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Conoce cómo pagar sin internet',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.deepPurple[700],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.phone_android, color: Colors.white, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionGrid() {
    final List<Map<String, dynamic>> actions = [
      {
        'icon': Icons.send,
        'color': Colors.green[100],
        'iconColor': Colors.green,
        'title': 'Transferir',
      },
      {
        'icon': Icons.account_balance_wallet,
        'color': Colors.purple[100],
        'iconColor': Colors.purple,
        'title': 'Recargar',
      },
      {
        'icon': Icons.payments,
        'color': Colors.orange[100],
        'iconColor': Colors.orange,
        'title': 'Cobrar',
      },
      {
        'icon': Icons.train,
        'color': Colors.purple[100],
        'iconColor': Colors.purple,
        'title': 'Metro de Quito',
      },
      {
        'icon': Icons.card_giftcard,
        'color': Colors.blue[100],
        'iconColor': Colors.blue,
        'title': 'Invita y Gana',
      },
      {
        'icon': Icons.person,
        'color': Colors.purple[100],
        'iconColor': Colors.purple,
        'title': 'Deuna Jóvenes',
      },
      {
        'icon': Icons.verified,
        'color': Colors.purple[100],
        'iconColor': Colors.purple,
        'title': 'Verificar pago',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 16,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: action['color'],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(action['icon'], color: action['iconColor'], size: 30),
            ),
            const SizedBox(height: 8),
            Text(
              action['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReferralCard() {
    return Card(
      elevation: 0,
      color: Colors.purple[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: const [
            Text(
              '¿Un amigo te invitó?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Text('Pega tu código', style: TextStyle(fontSize: 16)),
            Spacer(),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  Widget _buildMainActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.send),
            label: const Text('Transferir'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.deepPurple,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.deepPurple[200]!),
              ),
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.qr_code),
            label: const Text('Pagar a QR'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple[700],
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Inicio', true),
            _buildNavItem(Icons.local_offer, 'Promos', false, hasNew: true),
            _buildNavItem(
              Icons.account_balance_wallet,
              'Billetera',
              false,
              hasNew: true,
            ),
            _buildNavItem(Icons.person, 'Tú', false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isSelected, {
    bool hasNew = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(icon, color: isSelected ? Colors.deepPurple : Colors.grey),
            if (hasNew)
              Positioned(
                top: -5,
                right: -5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Nuevo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.deepPurple : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
