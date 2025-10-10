import 'package:flutter/material.dart';

class AddOrUpdatePage extends StatelessWidget {
  const AddOrUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Column(
        children: [
          Container(
            height: 160,
            width: 366,
            margin: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color.fromARGB(243, 243, 243, 243),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage('images/upload.png')),
            ),
          ),
          Container(
            margin: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'name',
                  style: TextStyle(
                    fontSize: 16
                  ) 
                  ),
                _buildBoxes(40, 2),
                 Text(
                  'category',
                  style: TextStyle(
                    fontSize: 16
                  ) 
                  ),
                  _buildBoxes(40, 2),
                  Text(
                  'price',
                  style: TextStyle(
                    fontSize: 16
                  ) 
                  ),
                  _buildBoxes(40, 2),
                  Text(
                  'decription',
                  style: TextStyle(
                    fontSize: 16
                  ) 
                  ),
                  _buildBoxes(40, 40),
                  // SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 145,vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Add",style: TextStyle(color: Colors.white),),

                    ),
                  ),
                  SizedBox(height: 10,),
                   GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 140,vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      child: Text("Delete",style: TextStyle(color: Colors.red),),

                    ),
                  )
               
                
              ],

            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxes(double width, double height) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF3F3F3),
            labelText: '',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: width,
              vertical: height,
            ),
          ),
        ),
      ],
    );
  }
}
