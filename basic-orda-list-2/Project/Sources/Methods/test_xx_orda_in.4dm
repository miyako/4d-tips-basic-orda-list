//%attributes = {"invisible":true}
/*

the IN query fails on remote if the field does not have an index

*/

C_OBJECT:C1216($sel_1;$sel_2;$sel_3)
C_LONGINT:C283($len_1;$len_2;$len_3)
C_COLLECTION:C1488($col)

$col:=New collection:C1472("和歌山県";"島根県")

$col:=$col.orderBy(ck ascending:K85:9)
$sel_1:=ds:C1482.Customer.query("出身地 IN :1";$col)
$len_1:=$sel_1.length

$col:=$col.orderBy(ck descending:K85:8)
$sel_2:=ds:C1482.Customer.query("出身地 IN :1";$col)
$len_2:=$sel_2.length

$sel_3:=ds:C1482.Customer.query("出身地 == :1 or 出身地 == :2";$col[0];$col[1])
$len_3:=$sel_3.length