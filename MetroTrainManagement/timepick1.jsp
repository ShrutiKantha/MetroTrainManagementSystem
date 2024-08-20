<TABLE BORDER=4 BGCOLOR=CYAN>
<TR><TD>
<FORM NAME="clock_form">
<INPUT TYPE=TEXT NAME="clock" SIZE=25>
</FORM>
<SCRIPT LANGUAGE="JavaScript">
<!-- Hide from non JavaScript browsers
function clockTick()
{
currentTime = new Date();
document.clock_form.clock.value = " "+currentTime;
document.clock_form.clock.blur();
setTimeout("clockTick()", 1000);
}
clockTick();
// End of clock -->
</SCRIPT>
</TD></TR>
</TABLE>
