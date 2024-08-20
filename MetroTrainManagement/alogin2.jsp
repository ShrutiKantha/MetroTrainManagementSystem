<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="css/bootstrap.min.css" />
<link type="text/css" href="css/bootstrap-timepicker.min.css" />
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="javascript" type="text/javascript" src="datetimepicker.js">
</script>

<script type="text/javascript">

function timepicker()
{
var d = new Date();
d.setMinutes(d.getMinutes() + timepicker.h);
var p = function(n){return ':' + (n < 10? '0' + n : n);
},
h = d.getHours(),
m = p(d.getMinutes()),
//s = p(d.getSeconds()),
ampm = h >= 24? 'PM' : 'AM';
h = h%24 || 24;
h = h < 10? '\xa0' + h : h;
document.forms[0].elements['timepick'].value = h + m;
timepicker.timer = setTimeout(timepicker, 1000);
};
timepicker.h = 0;
timepicker.updown = function(n)
{
clearTimeout(timepicker.timer);
timepicker.h += n;
timepicker();
};
window.onload = timepicker;
</script>
</head>
<body>

<form action="#">
<div>

<input style="font-family:monospace;" size=11 type="text" name="timepick">
<input type="button" value="/\" onclick="timepicker.updown(1);">
<input type="button" value="\/" onclick="timepicker.updown(-10);">

</div>
</form>
</body>
</html>