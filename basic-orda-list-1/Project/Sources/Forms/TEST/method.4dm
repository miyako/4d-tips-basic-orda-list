$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
/*
		
このようなメタ情報式はリモートORDA向きではない
Choose(Form.customers.sel.contains(This);Form.customers.metas[0];Form.customers.metas[1])
Choose(Form.compatriots.sel.contains(This);Form.compatriots.metas[0];Form.compatriots.metas[1])
		
*/
		
		Form:C1466.ds:=ds:C1482
		
		Form:C1466.isLocal:=True:C214
		Form:C1466.isRemote:=Not:C34(Form:C1466.isLocal)
		
		C_OBJECT:C1216($connect)
		$connect:=New object:C1471
		$connect.type:="4D Server"
		$connect.hostname:="127.0.0.1:443"
		$connect.tls:=True:C214
		
		Form:C1466.connect:=$connect
		
		C_OBJECT:C1216($ds)
		$ds:=Form:C1466.ds
		
		C_OBJECT:C1216($customers;$compatriots)
		
		C_OBJECT:C1216($noCustomers)
		$noCustomers:=$ds.Customer.newSelection()
		
		$customers:=New object:C1471("col";Null:C1517;"sel";Null:C1517;"item";Null:C1517;"pos";0)
		$customers.col:=$ds.Customer.all()
		Form:C1466.customers:=$customers
		
		$cell:=New collection:C1472(New object:C1471("出身地";New object:C1471);New object:C1471("出身地";New object:C1471))
		$cell[0].出身地.stroke:="#FFFFFF"
		$cell[1].出身地.stroke:="#CCCCCC"
		
		$metas:=New collection:C1472(New object:C1471;New object:C1471)
		$metas[0].stroke:="#F5EEF8"
		$metas[0].fill:="#633974"
		$metas[0].cell:=$cell[0]
		$metas[1].stroke:="#633974"
		$metas[1].fill:="#F5EEF8"
		$metas[1].cell:=$cell[1]
		
		$customers.metas:=$metas
		
		$compatriots:=New object:C1471("col";$noCustomers;"sel";Null:C1517;"item";Null:C1517;"pos";0)
		Form:C1466.compatriots:=$compatriots
		$compatriots.metas:=$metas
		
		Form:C1466.customers.allowInput:=Formula:C1597(OBJECT SET ENABLED:C1123(*;"customer_@";$1))
		Form:C1466.customers.empty:=$noCustomers
		
End case 