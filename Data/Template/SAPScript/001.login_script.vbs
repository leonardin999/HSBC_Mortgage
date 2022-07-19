If Not IsObject(application) Then
   Set SapGuiAuto  = GetObject("SAPGUI")
   Set application = SapGuiAuto.GetScriptingEngine
End If
If Not IsObject(connection) Then
   Set connection = application.Children(0)
End If
If Not IsObject(session) Then
   Set session    = connection.Children(0)
End If
If IsObject(WScript) Then
   WScript.ConnectObject session,     "on"
   WScript.ConnectObject application, "on"
End If
session.findById("wnd[0]").maximize
session.findById("wnd[0]/usr/txtRSYST-BNAME").text = "{sap_user}"
session.findById("wnd[0]/usr/pwdRSYST-BCODE").text = "{sap_password}"
session.findById("wnd[0]/tbar[0]/okcd").text = "{sap_client}"
session.findById("wnd[0]/usr/pwdRSYST-BCODE").setFocus
session.findById("wnd[0]/usr/pwdRSYST-BCODE").caretPosition = 6
session.findById("wnd[0]").sendVKey 0
on error resume next
session.findById("wnd[1]/usr/radMULTI_LOGON_OPT1").select
session.findById("wnd[1]/tbar[0]/btn[0]").press
if err.number = 0 then  
end if
on error goto 0
session.findById("wnd[0]/tbar[0]/okcd").text = "{sap_client}"
session.findById("wnd[0]/usr/ctxtS_ZBRAND-LOW").setFocus
session.findById("wnd[0]/usr/ctxtS_ZBRAND-LOW").caretPosition = 0