import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

class ProductCard extends StatelessWidget {
  dynamic image;
  dynamic title;  
  dynamic price;

  ProductCard({
    Key? key, 
    String? this.image, 
    String? this.title, 
    int? this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyFormatter mf = MoneyFormatter(
      amount: double.parse(price.toString()), 
      settings: MoneyFormatterSettings(
        thousandSeparator: '.',
        decimalSeparator: ',',
        fractionDigits: 0
      )
    );

    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        child: InkWell(
          onTap: (){},
          splashColor: Colors.blue[300],
          child: Ink(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image!),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 60,
                width: double.infinity,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      mf.output.symbolOnLeft,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
