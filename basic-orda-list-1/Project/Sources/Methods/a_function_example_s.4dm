//%attributes = {"invisible":true,"executedOnServer":true,"preemptive":"incapable"}
ASSERT:C1129(METHOD Get attribute:C1169(Current method path:C1201;Attribute executed on server:K72:12))

/*
サーバー上で実行メソッド
*/

C_OBJECT:C1216($1;$request)
C_OBJECT:C1216($0;$response)

$request:=$1

C_COLLECTION:C1488($出身地;$ID)
$出身地:=$request.出身地
$ID:=$request.ID

$response:=New object:C1471("同郷人";ds:C1482.Customer.query("出身地  in :1";$出身地).minus(ds:C1482.Customer.query("ID  in :1";$ID)).toCollection())

/*
ヒント：サイズが気になるようであればBLOBに変換して圧縮すると良い
*/

$0:=$response