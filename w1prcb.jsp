function GetId(idname,win)
 {
  idname=idname+""
  if ( idname.indexOf(":") > -1 ) idname=ParseTxt(idname,":",1,1)
  if (typeof idname == 'undefined' ) return null
  if ( idname == "" ) return null
  if (typeof win == 'undefined' ) win=self
  return win.document.getElementById(idname)
 }
