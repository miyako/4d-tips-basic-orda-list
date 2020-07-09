$event:=FORM Event:C1606

Case of 
	: ($event.code=On Clicked:K2:4)
		
		If (Form:C1466.ds.getInfo().type="4D Server")
			
			$ds:=ds:C1482
			
			Form:C1466.ds:=$ds
			
			C_OBJECT:C1216($customers;$compatriots)
			
			$customers:=Form:C1466.customers
			$compatriots:=Form:C1466.compatriots
			
			C_OBJECT:C1216($noCustomers)
			$noCustomers:=$ds.Customer.newSelection()
			
			  //リストボックスのコンテキストとデータソースに不一致があってはいけない
			
			$customers.empty:=$noCustomers
			
			$customers.col:=$ds.Customer.all()
			$compatriots.col:=$noCustomers
			
		End if 
		
End case 