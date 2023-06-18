import 'package:flutter/material.dart';

Widget builderBody(article)
    { return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(25),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: 120,
          height: 120,
          child: Image(
            fit: BoxFit.fill,
            image: NetworkImage('${article['urlToImage']}')
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 3,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700, color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );}