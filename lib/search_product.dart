import 'package:flutter/material.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  RangeValues _priceRange = const RangeValues(10, 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Product")),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 260,
                      child: TextField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF3F3F3),
                          labelText: 'Leather',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          suffixIcon:
                              Icon(Icons.arrow_forward, color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Image.asset('images/list_icon.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // 🔸 Cards that scroll
                _buildCard(context, "images/shoe.png", "Derby Leather Shoes",
                    "Men's shoe", "\$120", 4.0),
                _buildCard(context, "images/shoe.png", "Derby Leather Shoes",
                    "Men's shoe", "\$120", 4.0),
                _buildCard(context, "images/shoe.png", "Derby Leather Shoes",
                    "Men's shoe", "\$120", 4.0),

                const SizedBox(height: 250), 
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 50),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Category", style: TextStyle(fontSize: 15)),
                    const SizedBox(height: 5),
                    const TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text("Price", style: TextStyle(fontSize: 15)),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.deepPurple,
                        inactiveTrackColor: Colors.grey.shade300,
                        trackHeight: 10.0,
                        thumbColor: Colors.white,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 10.0),
                        valueIndicatorColor: Colors.deepPurple,
                        valueIndicatorTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: RangeSlider(
                        values: _priceRange,
                        min: 0,
                        max: 1000,
                        labels: RangeLabels(
                          '\$${_priceRange.start.round()}',
                          '\$${_priceRange.end.round()}',
                        ),
                        onChanged: (RangeValues newValues) {
                          setState(() => _priceRange = newValues);
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Apply",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildCard(BuildContext context, String imagePath, String title,
      String desc, String price, double rate) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black45,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      desc,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(price),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        const SizedBox(width: 5),
                        Text('($rate)'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
