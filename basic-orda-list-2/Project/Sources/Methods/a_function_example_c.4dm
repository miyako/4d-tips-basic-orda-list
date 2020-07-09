//%attributes = {"invisible":true,"preemptive":"incapable"}
C_OBJECT:C1216($1;$signal;$2;$request;$response)

$signal:=$1
$request:=$2

/*
サーバー上で実行メソッド
*/

$response:=a_function_example_s ($request)

If (Not:C34(Process aborted:C672))
	If ($response#Null:C1517)
		Use ($signal)
			$signal.response:=JSON Stringify:C1217($response)
		End use 
	End if 
	$signal.trigger()
End if 

KILL WORKER:C1390