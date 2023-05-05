function GetId(idname,win) // --- get element by id in defined window
 {
  idname=idname+""
  if ( idname.indexOf(":") > -1 ) idname=ParseTxt(idname,":",1,1)
  if (typeof idname == 'undefined' ) return null
  if ( idname == "" ) return null
  if (typeof win == 'undefined' ) win=self
  return win.document.getElementById(idname)
 }

function GetVl(idname,win) // --- get element value by id in defined window
 {
   var Type=""
   if (typeof idname == 'undefined' ) return ""
   if ( idname == "" ) return ""

   if (typeof win == 'undefined' ) win=self
   if (win == '' ) win=self

   if ( idname.indexOf(":")>-1)
   {
     Type=ParseTxt(idname,":",2,2)
     idname=ParseTxt(idname,":",1,1)
     //alert("Type="+Type+" idname="+idname )
   }

   if ( Type == "D" ) { return Dat(idname,win) }

   if ( Type == "T" ) { return Time(idname,win) }


   var a=GetId(idname,win);
   var vl
   if ( a===null || a=== undefined ) return "";
   //alert("  value="+a.value )
   if ( a.type == "checkbox" || a.type == "radio" )
      {
        if ( a.checked ) { vl = '1' }
        else { vl='0' }
      }

   else if ( a.type == "select" )
     { vl=a.options[selectedIndex].value }

   else { vl= a.value }

   return vl
 }

function ClearNum(txt) // -- clear txt from nonumber symbols
{
   var i,txt1,smb;
   var j=0
   var flag=0
   txt1=""
   for (i=0; i<txt.length; i++)
   {
    smb=txt.charCodeAt(i)
    if (smb == 62 ) { j=0 }
    if (smb>44 && smb < 58 )
     {
      if ( smb == 45 && j > 0 ) {}
      else if ( smb == 47 ) {}
      else if ( smb == 46 && flag ==1 ) {}
      else {
       if ( j==0 ) txt1=""
       j=j+1
       if ( smb == 46 && flag == 0 ) { flag = 1 }
       txt1=txt1+txt.substr(i,1)
      }
     }
   }
   return txt1
}

function ParseTxt(Str,Dlm,Start,Fin) // -- parse Str string by delimiter Dlm from number Start( begin from 1 )  to number Fin
 {
  Str=Str+'';
  var arr=new Array(80);
  arr=Str.split(Dlm);
  var st;
  var i;
  if (Str.indexOf(Dlm)<0 && Start===1) {return Str;}
  if (Str.indexOf(Dlm)<0 && Start>1) {return '';}
  if (Start<1) {Start=1;}
  if (Fin>arr.length) {Fin=arr.length;}
  if (Start>arr.length) {return '';}
  st=arr[Start-1];
  for (i=Start;i<Fin;i++)
    {
       st=st+Dlm+arr[i];
    }
  return st;
 }
                          
function getCookie(c_name) // -- get cookie by name
{
 if (document.cookie.length>0)
  {
   c_start=document.cookie.indexOf(c_name + "=");
   if (c_start!==-1)
     {
      c_start=c_start + c_name.length+1 ;
      c_end=document.cookie.indexOf(";",c_start);
      if (c_end==-1) c_end=document.cookie.length;
      return unescape(document.cookie.substring(c_start,c_end));
     }
  }
 return "";
}


function setCookie(c_name,value,expiredays) // --  set cookie with name c_name to value to expiredays days
 {
  var exdate=new Date();
  exdate.setDate(exdate.getDate()+expiredays);
  var vl=c_name+"="+escape(value)+((expiredays==null) ? "" :";expires="+exdate.toGMTString())
  //alert("cookie_name:"+c_name+"  cookie_vl:"+vl)
  document.cookie=vl
 }
