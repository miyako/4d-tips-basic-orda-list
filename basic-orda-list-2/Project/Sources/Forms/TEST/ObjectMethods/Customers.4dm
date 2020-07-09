$event:=FORM Event:C1606

Case of 
	: ($event.code=On Selection Change:K2:29)
		
		C_OBJECT:C1216($ds)
		
		$ds:=Form:C1466.ds
		
		C_OBJECT:C1216($this;$selection)
		$this:=Form:C1466.customers.item
		$selection:=Form:C1466.customers.sel
		
		Case of 
			: ($selection.length=0)
				Form:C1466.compatriots.col:=Form:C1466.customers.empty
				Form:C1466.customers.allowInput(False:C215)
			: ($selection.length=1)
				Form:C1466.compatriots.col:=$ds.Customer.query("出身地 === :1";$this.出身地).minus($this)
				Form:C1466.customers.allowInput(True:C214)
			Else 
				Form:C1466.compatriots.col:=$ds.Customer.query("出身地  in :1";$selection.distinct("出身地")).minus($selection).orderBy("出身地")
				Form:C1466.customers.allowInput(False:C215)
		End case 
		
End case 