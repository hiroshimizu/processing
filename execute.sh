#!/bin/sh

#文頭のコメント記号で要素化しないようにスペースを消去
sed -in "1 s/#    time/#____time/g" 000.dat
sed -in "1 s/#    time/#____time/g" 000.ufm

python3 TsvtoCsv.py 000.dat
python3 TsvtoCsv.py 000.ufm
python3 TsvtoCsv.py sch.inp
python3 CsvtoXlsx.py 000_dat.csv
python3 CsvtoXlsx.py 000_ufm.csv
python3 CsvtoXlsx.py sch_inp.csv

python3 copy_sheet.py 000_dat.xlsx Sheet1 Landau_LE4_template5.xlsx 000.dat
python3 copy_sheet.py 000_ufm.xlsx Sheet1 Landau_LE4_template5.xlsx 000.ufm
python3 copy_sheet.py sch_inp.xlsx Sheet1 Landau_LE4_template5.xlsx sch.inp
python3 copy_text_to_xlsx.py potential.cu Landau_LE4_template5.xlsx potential.cu