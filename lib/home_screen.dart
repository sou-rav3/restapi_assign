import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> items = [
    {
      'name': 'Pullover',
      'color': 'Black',
      'size': 'L',
      'price': 51,
      'quantity': 1,
      'imagePath': 'assets/images/firstpic.png', // Use image path for local assets
    },
    {
      'name': 'T-Shirt',
      'color': 'Gray',
      'size': 'L',
      'price': 30,
      'quantity': 1,
      'imagePath': 'assets/images/gray.png' // Replace with actual image URL
    },
    {
      'name': 'Sport Dress',
      'color': 'Black',
      'size': 'M',
      'price': 43,
      'quantity': 1,
      'imagePath': 'assets/images/firstpic.png' // Replace with actual image URL
    },
  ];

  // Method to calculate the total amount
  int getTotalAmount() {
    int total = 0;
    for (var item in items) {
      num price = item['price'];        // 'price' is a num
      num quantity = item['quantity'];  // 'quantity' is a num
      total += (price * quantity).toInt();  // Cast the result to int
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag', style: TextStyle(fontSize: 35)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: items[index]['imagePath'] != null
                        ? Image.asset(
                      items[index]['imagePath'],
                      width: 50,
                      height: 70,
                      fit: BoxFit.cover,
                    )
                        : Image.network(
                      items[index]['imageUrl'],
                      width: 50,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    title: Text('${items[index]['name']}'),
                    subtitle: Text(
                        'Color: ${items[index]['color']}, Size: ${items[index]['size']}'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (items[index]['quantity'] > 1) {
                                    items[index]['quantity']--;
                                  }
                                });
                              },
                            ),
                            Text('${items[index]['quantity']}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  items[index]['quantity']++;
                                });
                              },
                            ),
                          ],
                        ),
                        Text(
                          '${items[index]['price']}\$',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total amount:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${getTotalAmount()}\$',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              const snackBar = SnackBar(
                content:
                Text('Congratulations! You have successfully checked out!'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding:
              const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text('CHECK OUT'),
          ),
        ],
      ),
    );
  }
}

