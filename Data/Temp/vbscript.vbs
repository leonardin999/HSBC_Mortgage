Set Arg = WScript.Arguments
Dim fileName,modulePath
If Arg.length > 0 Then
fileName = Replace(Arg(0),"&nbsp;"," ")
modulePath = Replace(Arg(1),"&nbsp;"," ")
Else
fileName = ""
modulePath = ""
End If
Set excelApp = getObject(,"Excel.Application")
For each item in excelApp.Workbooks	
If fileName<>"" And InStr(item.name,fileName) Then
item.Activate
End If
Next
For each item in excelApp.VBE.ActiveVBProject.VBComponents
If item.Name = "FPTMarcoModule" Then
excelApp.VBE.ActiveVBProject.VBComponents.Remove(item)
End If	
Next
excelApp.VBE.ActiveVBProject.VBComponents.Import modulePath