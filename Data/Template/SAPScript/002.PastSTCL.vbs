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
session.findById("wnd[0]/tbar[1]/btn[25]").press
session.findById("wnd[1]/usr/sub:SAPLSPO4:0300/ctxtSVALD-VALUE[0,21]").text = "01"
session.findById("wnd[1]/usr/sub:SAPLSPO4:0300/ctxtSVALD-VALUE[1,21]").text = "HZ"
session.findById("wnd[1]/usr/sub:SAPLSPO4:0300/ctxtSVALD-VALUE[1,21]").setFocus
session.findById("wnd[1]/usr/sub:SAPLSPO4:0300/ctxtSVALD-VALUE[1,21]").caretPosition = 2
'session.findById("wnd[1]/tbar[0]/btn[0]").press
