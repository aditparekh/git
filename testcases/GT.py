#pip install openpyxl
#pip install xlrd

import xlrd
import datetime

workbook = xlrd.open_workbook('GT.xlsx')
worksheet= workbook.sheet_by_name('AccountInvoiceData-1')
num_rows = worksheet.nrows - 1
num_cols=worksheet.ncols-1
curr_row = -1


while curr_row < num_rows:
	curr_row += 1
	row = worksheet.row(curr_row)
	print 'Row:',curr_row
	curr_cell=-1
	while curr_cell<num_cols:
		curr_cell+=1
		cell_value= worksheet.cell_value(curr_row,curr_cell)
		print ":",cell_value

