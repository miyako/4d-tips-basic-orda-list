//%attributes = {"invisible":true,"preemptive":"capable"}
/*
このメソッドはスレッドセーフ
*/

C_OBJECT:C1216($1;$request;$0;$response)

$request:=$1

If ($request#Null:C1517)
	
/*
v18 R3以降はOB Instance of,OB Classが使用できる
*/
	
	C_TEXT:C284($dataClassName)
	ON ERR CALL:C155("on_object_error")
	$dataClassName:=$request.getDataClass().getInfo().name
	ON ERR CALL:C155("")
	
	If ($dataClassName="Customer")
		
		C_OBJECT:C1216($params)
		
		Case of 
			: ($request.length=Null:C1517)
				  //entity?
				$request:=New object:C1471("出身地";New collection:C1472($request["出身地"]);"ID";New collection:C1472($request["ID"]))
			Else 
				  //entitySelection?
				$request:=New object:C1471("出身地";$request.distinct("出身地");"ID";$request.distinct("ID"))
		End case 
		
		If ($request#Null:C1517)
			
			C_TEXT:C284($workerName)
			$workerName:=New collection:C1472(Current method name:C684;Generate UUID:C1066).join("@")
			
			C_OBJECT:C1216($signal)
			$signal:=New signal:C1641
			
/*
サーバー上で実行（同期処理）はスレッドセーフではないのでワーカーを使用する
*/
			
			CALL WORKER:C1389($workerName;"a_function_example_c";$signal;$request)
			
			If ($signal.wait())
				If ($signal.response#Null:C1517)
					$response:=JSON Parse:C1218($signal.response;Is object:K8:27)
				End if 
			End if 
			
		End if 
	End if 
End if 

$0:=$response