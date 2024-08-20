
<html>
<head>
<title>Add minutes to current times</title>
<script type="text/javascript">
    function addMinutes() {
        var todayDate = new Date();
        var mins = document.getElementById("mins").value;
        var hours = todayDate.getHours();
        var minutes = todayDate.getMinutes();
        var newMins = parseInt(minutes) + parseInt(mins);
        if (newMins > 59) {
            var hrs = parseInt(newMins / 60);
            var min = newMins - hrs * 60;
        } else {
            min = newMins;
            hrs = 0;
        }
        var newHrs = parseInt(hours) + parseInt(hrs);

        var seconds = todayDate.getSeconds();
        var format = "AM";

        if (newHrs > 11) {
            format = "PM";
        }
        if (newHrs > 12) {
            newHrs = newHrs - 12;
        }
        if (newHrs == 0) {
            newHrs = 12;
        }
        if (min < 10) {
            min = "0" + min;
        }
        document.write( + newHrs + " : " + min + "  "+ format);
                
    }
</script>
</head>
<body>
<%
String  str=(String)session.getAttribute("a2");
out.print(str);

%>
<h2>Add minutes to current date and display..</h2>
Enter minutes :
<input type="text" id="mins" value="<%=str%>">
<input type="button" value="Add Minutes" onclick= "addMinutes();">

</body>
</html>