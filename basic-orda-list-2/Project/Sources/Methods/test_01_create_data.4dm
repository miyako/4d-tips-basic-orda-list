//%attributes = {"invisible":true,"preemptive":"capable"}
/*
サンプルデータ生成サイト
https://hogehoge.tk/personal/generator/
*/

$file:=File:C1566("/RESOURCES/personal_infomation.xml")
If ($file.exists)
	$dom:=DOM Parse XML source:C719($file.platformPath)
	If (OK=1)
		  //インポート中はインデックス作成を停止する（プライマリーキー以外）
		TRUNCATE TABLE:C1051([Customer:1])
		PAUSE INDEXES:C1293([Customer:1])
		C_TEXT:C284($elementName)
		$node:=DOM Get first child XML element:C723($dom;$elementName)
		If ($elementName="personal-infomation")  //スペルミス（sic）
			While (OK=1)
				C_OBJECT:C1216($customer)
				$customer:=ds:C1482.Customer.new()
				ARRAY LONGINT:C221($types;0)
				ARRAY TEXT:C222($nodes;0)
				DOM GET XML CHILD NODES:C1081($node;$types;$nodes)
				For ($i;1;Size of array:C274($nodes))
					If ($types{$i}=XML ELEMENT:K45:20)
						C_TEXT:C284($name;$stringValue)
						DOM GET XML ELEMENT NAME:C730($nodes{$i};$name)
						DOM GET XML ELEMENT VALUE:C731($nodes{$i};$stringValue)
						$customer[$name]:=$stringValue
					End if 
				End for 
				C_OBJECT:C1216($status)
				$status:=$customer.save()
				If (Not:C34($status.success))
					TRACE:C157
				End if 
				$node:=DOM Get next sibling XML element:C724($node)
			End while 
		Else 
			TRACE:C157  //要素名に問題あり
		End if 
		
		DOM CLOSE XML:C722($dom)
		  //インポートが完了したところでインデックスを作成する
		RESUME INDEXES:C1294([Customer:1])
	End if 
End if 