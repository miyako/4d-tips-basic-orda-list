$event:=FORM Event:C1606

Case of 
	: ($event.code=On Clicked:K2:4)
		
		If (Form:C1466.ds.getInfo().type="4D")
			
			C_OBJECT:C1216($ds)
			
			ON ERR CALL:C155("on_object_error")
			$ds:=Open datastore:C1452(Form:C1466.connect;"remoteCustomers")
			ON ERR CALL:C155("")
			
			If ($ds#Null:C1517)
				
				Form:C1466.ds:=$ds
				
				C_OBJECT:C1216($customers;$compatriots)
				
				$customers:=Form:C1466.customers
				$compatriots:=Form:C1466.compatriots
				
				C_OBJECT:C1216($noCustomers)
				$noCustomers:=$ds.Customer.newSelection()
				
				  //  //リストボックスのコンテキストとデータソースに不一致があってはいけない
				
				$customers.empty:=$noCustomers
				
				$customers.col:=$ds.Customer.all()
				$compatriots.col:=$noCustomers
				
				Form:C1466.customers.allowInput(False:C215)
				
			Else 
				Form:C1466.isRemote:=False:C215
				Form:C1466.isLocal:=Not:C34(Form:C1466.isRemote)
			End if 
			
		End if 
		
End case 