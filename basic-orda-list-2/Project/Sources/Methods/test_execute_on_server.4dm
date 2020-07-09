//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($customer)

$customer:=ds:C1482.Customer.get(1)

ASSERT:C1129($customer#Null:C1517)

$response:=a_function_example ($customer)