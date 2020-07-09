//%attributes = {"invisible":true,"preemptive":"capable"}
ASSERT:C1129(Application type:C494=4D Remote mode:K5:5)

C_OBJECT:C1216($file)

$file:=Folder:C1567(fk logs folder:K87:17).file("ORDA.txt")
$file.delete()

ds:C1482.startRequestLog($file)

SHOW ON DISK:C922($file.platformPath)