import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController GeneralwellTitle =TextEditingController();
  TextEditingController Description  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 50,left: 20,right: 20),
                child: TextField(controller: GeneralwellTitle,)),
            TextButton(onPressed: _createPDF, child: Text('Create PDF'))
          ],
        ),

        );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    document.pageSettings.size = PdfPageSize.a4;

    final page = document.pages.add();
    page.graphics.drawString(
        'Tax Invoice ',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          20,
        ),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(200, 0, 0, 0)
    );





     PdfGrid grid = PdfGrid();
        grid.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 5,top: 5),

        );

    grid.columns.add(count: 1);
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];

    header.cells[0].value = GeneralwellTitle.text;

    header.cells[0].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),
      // textBrush: PdfBrushes.black,
      // textPen: PdfPens.black,

    );

    header.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),);





    PdfGridRow column = grid.rows.add();

    column.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    //  PdfGridRow row = grid.rows.add();
    column.cells[0].value =
        'Plot No 22A & 22B1 Survicey No-46/2,\nopp to khoduae hotel lhagasityi \nRajkot-Gondal Highway rajkot-360022 \nGSTIN/UN:24QQMFGS790R1Zi \nState Name: Gujarat Code:24';


    // column.cells[0].style.borders = PdfBorders(
    //   top:PdfPen(PdfColor.empty),
    // );
    column.height = 75;


    // PdfGridRow row = grid.rows.add();
    // row.cells[0].value = 'Buyer';
    // row.height = 10;
    // row.cells[0].style.borders = PdfBorders(
    //   bottom:PdfPen(PdfColor.empty),
    // );


    PdfGridRow row1211 = grid.rows.add();
    row1211.cells[0].value =   'Buyer';
   // row1211.height = 10;
    row1211.cells[0].style.borders = PdfBorders(
         bottom:PdfPen(PdfColor.empty),
    );
    PdfGridRow row121 = grid.rows.add();


    row121.cells[0].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
    //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold
      )
    );

    row121.cells[0].value = 'Greenwell Biotech(8247593572)';


    row121.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom: PdfPen(PdfColor.empty),
    );






    PdfGridRow row122 = grid.rows.add();
    row122.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );

    row122.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty), bottom:PdfPen(PdfColor.empty),
    );

    row122.cells[0].value ='Sales Off-, Block No-10. Plot No. 77.Phase-Il \nAutonagarm, Guntur Ap-585104 \nGSTINUIN 37 ASVPS3066K1ZT \nPlace of Supply: Andhra Pradesh';
    row122.height = 120;





    //  header.column.width = 50;

  //  row.cells[0].rowSpan = 2;

    // grid.columns[0].height = 10;

    // row.cells[1].rowSpan = 2;


    //grid.draw(page: page, bounds: const Rect.fromLTWH(0, 150, 0, 0));





//Draw grid on the page of PDF document and store the grid position in PdfLayoutResult
    PdfLayoutResult result = grid.draw(page: page, bounds: Rect.fromLTWH(0, 29.5, 259.9, 350)) as PdfLayoutResult;


    PdfGrid grid2 = PdfGrid();
    grid2.columns.add(count: 2);


    grid2.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5,),

    );









    grid2.headers.add(1);
    PdfGridRow header1 = grid2.headers[0];
    header1.cells[0].value = 'Invoice No  ';
    header1.cells[0].style = PdfGridCellStyle(
      cellPadding: PdfPaddings(top: 5,),
    //  font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),
    );


    header1.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );
    header1.cells[1].style = PdfGridCellStyle(

      cellPadding: PdfPaddings(top: 5,),
      //font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );

    header1.cells[1].value = 'Dated ';
    header1.cells[1].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );


    PdfGridRow row11 = grid2.rows.add();





    row11.cells[0].value = '1060';
    row11.cells[0].style = PdfGridCellStyle(
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),
    );
    row11.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );


    row11.cells[1].value = '29-dec-2021';
    row11.cells[1].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
        cellPadding: PdfPaddings( top: 5, ),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );


    row11.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );



    PdfGridRow row12 = grid2.rows.add();
    row11.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    row12.cells[0].value = 'Delivery Note';
    row12.cells[0].style.borders = PdfBorders(
        bottom:PdfPen(PdfColor.empty),);

    row12.cells[1].value = 'ModelTerm of Payment';

    row12.cells[1].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),);

    PdfGridRow row13 = grid2.rows.add();
    row13.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);
    row13.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);
    row13.cells[0].value = '-';//
    row13.cells[1].value = '-';//






    PdfGridRow row14= grid2.rows.add();
    row14.cells[0].value = 'Supplers Ref'; //Buyer Order No
    row14.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),);

    row14.cells[1].value = 'Other refference(s)';//Dated
    row14.cells[1].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),);


    PdfGridRow row15 = grid2.rows.add();
    row15.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);
    row15.cells[0].value = ' -';//Dispatch Document
    // row15.cells[0].style.borders = PdfBorders(
    //   bottom:PdfPen(PdfColor.empty),
    // );

    row15.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);
    row15.cells[1].value = '-';//Delivery Note Date No




    PdfGridRow row19 = grid2.rows.add();
    row19.cells[0].value = 'Buyer Orders No ';
    row19.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );
    row19.cells[1].value = 'Dated';
    row19.cells[1].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );
    PdfGridRow row188 = grid2.rows.add();
    row188.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    row188.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    row188.cells[0].value = '-';
    row188.cells[1].value = '-';
    PdfGridRow row20 = grid2.rows.add();

    row20.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    row20.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );






    PdfGridRow row191 = grid2.rows.add();
    row191.cells[0].value = 'Dispatch Documnets No ';
    row191.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );



    row191.cells[1].value = 'Delivery Note Date';
    row191.cells[1].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );
    PdfGridRow row181 = grid2.rows.add();
    row181.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    row181.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    row181.cells[0].value = '1060';



    row181.cells[1].value = '-';
    PdfGridRow row81 = grid2.rows.add();

    row81.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    row81.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );





    PdfGridRow row1911 = grid2.rows.add();
    row1911.cells[0].value = 'Despatched throught ';
    row1911.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );
    row1911.cells[1].value = 'Destination';
    row1911.cells[1].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );
    PdfGridRow row1881 = grid2.rows.add();



    row1881.cells[0].value = 'BY  TRANSPORT-VRL';
    row1881.cells[0].style = PdfGridCellStyle(
      font: PdfStandardFont(PdfFontFamily.timesRoman, 8,style: PdfFontStyle.bold),
    );
    row1881.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );








    row1881.cells[1].value = 'GUNTUR';
    row1881.cells[1].style = PdfGridCellStyle(
      font: PdfStandardFont(PdfFontFamily.timesRoman, 8,style: PdfFontStyle.bold),
    );
    row1881.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );

    PdfGridRow row201 = grid2.rows.add();

    row201.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    row201.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );



    PdfGridRow row21 = grid2.rows.add();
    row21.cells[0].value = 'Bill of landing LR-RR No ';
    row21.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );
    row21.cells[1].value = 'Motor Vechicle No';
    row21.cells[1].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );
    row19.cells[1].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );
    PdfGridRow row22 = grid2.rows.add();
    row22.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    row22.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );
    row22.cells[0].value = ' dt.29-Dec-2021';



    row22.cells[0].style = PdfGridCellStyle(
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),
    );

    row22.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),
    );







      PdfGridRow row2111 = grid2.rows.add();
    row2111.cells[0].value = ' Terms of Delivery';
    row2111.cells[0].columnSpan = 2;
row2111.height=36;

    row2111.cells[1].style.borders = PdfBorders(
     // left:PdfPen(PdfColor.empty),  bottom:PdfPen(PdfColor.empty),
    );
 //   row21.cells[0].rowSpan = 2;
    row21.height = 20;







    grid2.draw(
        page: result.page,
        bounds: Rect.fromLTWH(260, 29.5, 510, 289.9));









    PdfGrid grid7 = PdfGrid();
    grid7.columns.add(count: 7);
    grid7.headers.add(1);
    grid7.columns[0].width=15;
    grid7.columns[1].width=140;
    grid7.columns[5].width=20;
    PdfGridRow header7 = grid7.headers[0];
    header7.cells[0].value = 'Sr';
    header7.cells[0].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);


    header7.cells[1].value = 'Description of goods';
    header7.cells[1].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);
    header7.cells[2].value = 'HSN/SAC';
    header7.cells[2].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 10);


    header7.cells[3].value = 'Quality';
    header7.cells[3].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 10);

    header7.cells[4].value = 'Rate';
    header7.cells[4].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 10);

    header7.cells[5].value = 'per';
    header7.cells[5].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 10);

    header7.cells[6].value = 'Amount';
    header7.cells[6].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 10);




    PdfGridRow row71 = grid7.rows.add();

    grid7.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5,),
    );


    row71.cells[0].value = '1';
    row71.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),);
    row71.cells[0].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);




    row71.cells[1].value = 'GREEN CLAIM';

    row71.cells[1].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );

    row71.cells[1].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),);




    row71.cells[2].value = '3808';
    row71.cells[2].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);




    row71.cells[3].value = '300.000 kg';


    row71.cells[3].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row71.cells[3].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);

    row71.cells[4].value = '70.00';
    row71.cells[4].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);

    row71.cells[5].value = 'kg';

    row71.cells[5].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);



    row71.cells[6].value = '21,000.00';
    row71.cells[6].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row71.cells[6].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);







    PdfGridRow row72 = grid7.rows.add();


    row72.cells[0].style.borders = PdfBorders(
        top:PdfPen(PdfColor.empty),);
    row72.cells[0].value = '';
    row72.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),
    );



    row72.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);
    row72.cells[1].value = '100 GM 30CS 250GM-30CS';

    row72.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);
    row72.cells[1].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);





    row72.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);

    row72.cells[2].value = '';
    row72.cells[2].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);
    row72.cells[3].value = '';
    row72.cells[3].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);
    row72.cells[4].value = '';
    row72.cells[4].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);


    row72.cells[5].value = '';
    row72.cells[5].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);





    row72.cells[6].value = '';
    row72.cells[6].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);



    PdfGridRow row73 = grid7.rows.add();
    // row73.cells[0].style.borders = PdfBorders(
    //     top:PdfPen(PdfColor.empty),);
    row73.cells[0].value = '2';
    row73.cells[0].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);


    row73.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);
    // row73.cells[0].style.borders = PdfBorders(
    //   bottom:PdfPen(PdfColor.empty),
    // );


    row73.cells[1].value = 'CHLORD GOLD(50)';
    row73.cells[1].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row73.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);


    row73.cells[2].value = '3808';
    row73.cells[2].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);

    row73.cells[3].value = '200.000 ltr';
    row73.cells[3].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row73.cells[3].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);


    row73.cells[4].value = '90.00';
    row73.cells[4].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);


    row73.cells[5].value = 'ltr';
    row73.cells[5].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);





    row73.cells[6].value = '18,000.00';
    row73.cells[6].style = PdfGridCellStyle(

      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row73.cells[6].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);




    PdfGridRow row74 = grid7.rows.add();



    row74.cells[0].value = '';

    row74.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);



    row74.cells[1].value = '20CS(1 LTR-13CS 500ML-7CS)';

    row74.cells[1].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);

    row74.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);


    row74.cells[2].value = '';
    row74.cells[2].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);



    row74.cells[3].value = '';
    row74.cells[3].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);


    row74.cells[4].value = '';
    row74.cells[4].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);

    row74.cells[5].value = '';
    row74.cells[5].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);


    row74.cells[6].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);
    row74.cells[6].value = '';







    PdfGridRow row75 = grid7.rows.add();


    row75.cells[0].value = '';
    row75.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);

    row75.cells[1].value = '';
    row75.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);

    row75.cells[2].value = '';
    row75.cells[2].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);

    row75.cells[3].value = '';
    row75.cells[3].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);


    row75.cells[4].value = '';
    row75.cells[4].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);

    row75.cells[5].value = '';
    row75.cells[5].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),bottom:PdfPen(PdfColor.empty),);

    row75.cells[6].value = '39,000.00';
    row75.cells[6].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),);





    PdfGridRow row76 = grid7.rows.add();

    row76.cells[0].value = '';
    row76.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);
    row76.cells[1].value = 'lgst';

    row76.cells[1].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );

    row76.cells[1].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.right,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 20);


    row76.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);

    row76.cells[2].value = '';
    row76.cells[2].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);


    row76.cells[3].value = '';
    row76.cells[3].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);

    row76.cells[4].value = '';
    row76.cells[4].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);

    row76.cells[5].value = '';
    row76.cells[5].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);


    row76.cells[6].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);
    row76.cells[6].value = '7,020.00';



    PdfGridRow row77 = grid7.rows.add();



    row77.cells[0].value = '';

    row77.cells[1].value = 'Total';
    row77.cells[1].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.right,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);


    row77.cells[2].value = '';
    row77.cells[3].value = '';
    row77.cells[4].value = '';
    row77.cells[5].value = '';
    row77.cells[6].value = '\$ 46,020.00';


    grid7.draw(
        page: result.page,
        bounds: Rect.fromLTWH(0, 287, 510, 450));





    //Save the document
    PdfGrid grid5 = PdfGrid();
    grid5.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5,),
    );
//Add columns to second grid
    grid5.columns.add(count: 2);
    grid5.headers.add(1);
    PdfGridRow header2 = grid5.headers[0];

    header2.cells[0].value = 'Amount Chargeable (in words)';
    header2.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),right:PdfPen(PdfColor.empty),top: PdfPen(PdfColor.empty), );
    header2.cells[1].value = 'E & O E';
    header2.cells[1].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
       cellPadding: PdfPaddings( right: 10),
    //  font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );





    header2.cells[1].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.right,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);
    header2.cells[1].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),left:PdfPen(PdfColor.empty),top: PdfPen(PdfColor.empty), );

//Add rows to grid
    PdfGridRow row51 = grid5.rows.add();
    row51.cells[0].value = 'INR Forty Six Thousand Twenty Only';
    row51.cells[0].style = PdfGridCellStyle(
      //backgroundBrush: PdfBrushes.lightYellow,
      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );

    row51.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),right:PdfPen(PdfColor.empty),bottom: PdfPen(PdfColor.empty), );

    row51.cells[1].value = '';
    row51.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),left:PdfPen(PdfColor.empty),bottom: PdfPen(PdfColor.empty), );
    // PdfGridRow row52 = grid5.rows.add();
    // row52.cells[0].value = '';
//Draw the grid in PDF document page
    grid5.draw(
        page: result.page,
        bounds: Rect.fromLTWH(0, 410, 510, 600));




    //fourth table

    PdfGrid grid6 = PdfGrid();

//Add columns to second grid
    grid6.columns.add(count: 5);
    grid6.headers.add(1);
    PdfGridRow header6 = grid6.headers[0];

    grid6.columns[0].width=230;
    grid6.columns[1].width=75;
    grid6.columns[2].width=55;
    grid6.columns[3].width=75;
    grid6.columns[4].width=75;






    header6.cells[0].value = 'HSN/SAC';


    header6.cells[0].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);


    header6.cells[0].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty), );

    header6.cells[1].value = 'Taxable value';
    header6.cells[2].value = 'Integrated Tax';
    header6.cells[2].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);

    header6.cells[3].value = '';
    header6.cells[4].value = 'Total Tax Amount';
    header6.cells[4].style.borders = PdfBorders(
      bottom:PdfPen(PdfColor.empty),);
    header6.cells[2].columnSpan = 2;

   // grid6.columns[1].width=140;
   //  grid6.columns[5].width=20;

// Add rows to grid

    PdfGridRow row61 = grid6.rows.add();
    row61.cells[0].value = '';
    row61.cells[0].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);

    row61.cells[1].value = '';
    row61.cells[1].style.borders = PdfBorders(
      top:PdfPen(PdfColor.empty),);
    row61.cells[2].value = 'Rate';
    row61.cells[3].value = 'Amount';



    PdfGridRow row62 = grid6.rows.add();

    grid6.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 5,),
       );

    row62.cells[0].value = '3808';
    row62.cells[1].value = '39,000.00';
    row62.cells[2].value = '18%';
    row62.cells[3].value = '7,020,00';
    row62.cells[4].value = '7,020,00';


    PdfGridRow row63 = grid6.rows.add();
    row63.cells[0].value = 'Total';


    // row63.cells[0].style = PdfGridCellStyle(
    //
    //   cellPadding: PdfPaddings( right: 10,),
    //   //font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),
    //
    // );



    row63.cells[0].style = PdfGridCellStyle(

       cellPadding: PdfPaddings( right: 10,),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row63.cells[0].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.right,
        lineAlignment: PdfVerticalAlignment.middle,
        wordSpacing: 2);
    row63.cells[1].value = '39,000.00';
    row63.cells[2].value = '';
    row63.cells[3].value = '7,020,00';
    row63.cells[3].style = PdfGridCellStyle(

      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row63.cells[4].value = '7,020,00';
    row63.cells[4].style = PdfGridCellStyle(

      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );



//Draw the grid in PDF document page
    grid6.draw(
        page: result.page,
        bounds: Rect.fromLTWH(0, 440, 700, 590));








    PdfGrid grid51 = PdfGrid();

  //Add columns to second grid
    grid51.columns.add(count: 2);


    grid51.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 5,),
      );

//Add rows to grid
    PdfGridRow rowg51 = grid51.rows.add();



    rowg51.cells[0].value = 'Tax Amount(In Words):';

    rowg51.cells[1].value = 'INR Seven Thousand Twenty Only';
    row51.cells[1].style = PdfGridCellStyle(

      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row51.cells[1].style = PdfGridCellStyle(

      //  cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row51.cells[1].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.justify,
        lineAlignment: PdfVerticalAlignment.bottom,
        wordSpacing: 2);



    rowg51.cells[0].style.borders = PdfBorders(
    right:PdfPen(PdfColor.empty),bottom: PdfPen(PdfColor.empty),top: PdfPen(PdfColor.empty),
    );
    rowg51.cells[1].style.borders = PdfBorders(
    left:PdfPen(PdfColor.empty),bottom: PdfPen(PdfColor.empty),top: PdfPen(PdfColor.empty),
    );
    PdfGridRow row52 = grid51.rows.add();


    row52.cells[0].value = 'Declaration';
    row52.cells[1].value = 'For Greenwell Bio-Tech';
    row52.cells[1].style = PdfGridCellStyle(cellPadding: PdfPaddings( right: 10,), font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row52.cells[1].style.borders = PdfBorders(
      bottom: PdfPen(PdfColor.empty),
    );





    grid51.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5,),

    );


    row52.cells[1].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.right,
        lineAlignment: PdfVerticalAlignment.top,
        wordSpacing: 2);
    row52.cells[0].style.borders = PdfBorders(
    top:PdfPen(PdfColor.empty),bottom: PdfPen(PdfColor.empty),
    );

    PdfGridRow row53 = grid51.rows.add();
    row53.cells[1].value = ' ';
    row53.cells[0].value = 'We declare that this invoice shows the actual price of the goods described  and that ALL  particulars are true and correct ';
    row53.cells[0].style.borders = PdfBorders(
    top:PdfPen(PdfColor.empty)
    );





    row53.cells[1].value = 'Authorsed signature';


    row53.cells[1].style = PdfGridCellStyle(

       cellPadding: PdfPaddings( right: 10,),
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold),

    );
    row53.cells[1].style.borders = PdfBorders(
        top:PdfPen(PdfColor.empty)
    );

    row53.cells[1].style.stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.right,
        lineAlignment: PdfVerticalAlignment.bottom,
        wordSpacing: 2);



//Draw the grid in PDF document page
    grid51.draw(
        page: result.page,
        bounds: Rect.fromLTWH(0, 500, 510, 555));





    PdfImage image = PdfBitmap.fromBase64String('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'
    );

    page.graphics.drawImage(image, Rect.fromLTWH(270, 530, 50, 20));



    List<int> bytes = document.save();
    document.dispose();

    final directory = await getApplicationDocumentsDirectory();
    print(directory);
    // final path = directory.path;
    //File file = File('$path/Output.pdf');
    //await file.writeAsBytes(bytes, flush: true);
    //OpenFile.open('$path/Output.pdf');
//its make default
    final path = Directory("storage/emulated/0/documents/testPdf");
    print(path);
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      await Permission.storage.request();
      await Permission.manageExternalStorage.request();

      await  Permission.mediaLibrary.request();
    }
    if ((await path.exists())) {
      null;
    } else {
      path.create();
    }

    String route = "storage/emulated/0/documents/testPdf";
    File file = File('$route/Output1.pdf');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$route/Output1.pdf');
  }
}





//   final directory = await getApplicationDocumentsDirectory();
//
// final path = directory.path;
// final  path= Directory("Device storage/sagar/test.pdf");
//  print(path);






