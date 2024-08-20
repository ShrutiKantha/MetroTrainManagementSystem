<HTML xmlns:t = "urn:schemas-microsoft-com:time">
<HEAD>
	<TITLE>Slide Show Using HTML+TIME Transitions</TITLE>
  <STYLE>
    .time    {behavior: url(#default#time2);}
    #oDiv1   
    {
    font-size:28pt;
    font-family: arial; 
    font-weight:bold;
    color: #000000;  
    background-color: #ffffcc;
    border:3px solid gold;
    position:absolute;
    top:20px;
    left:20px;
    height:300px;
    width:400px;
    padding:20px
    }
    #oDiv2
    {
    font-family: arial; 
    font-weight:bold;
    font-size: 28pt;
    background-color: #e4e4e4; 
    border:3px solid #666666;
    position:absolute;
    top:20px;
    left:20px;
    height:300px;
    width:400px;
    padding:20px;
    color:red
    }
    #oDiv3
    {
    color: white; 
    font-family: arial; 
    font-weight:bold;
    font-size: 28pt;
    background-color: #3366CC; 
    border:3px solid #666666;
    padding: 20;
    position:absolute;
    top:20px;
    left:20px;
    height:300px;
    width:400px;
    }
  </STYLE>
  
  <SCRIPT>
  function fnGo(direction)
  {
  // divCollection holds the collection of DIVS in the slide show.
  var divCollection = oWrapperDiv.childNodes;
  var ColLength = divCollection.length;
        for(i=0; i<ColLength; i++)
        {
            if (divCollection(i).style.zIndex == 2)
            {
                if (direction == "forward" && i!=2)
                {
                    var next = i + 1;
                }
                else if (direction == "back" && i!=0)
                {
                    var next = i - 1;
                }
                else
                    break;
                // Loop below sets all DIVS to low z-index.
                for(j=0; j<ColLength; j++)
                {
                    divCollection(j).style.zIndex = 0;
                } 
                // Last DIV is set to next highest z-index.       
                divCollection(i).style.zIndex = 1;
                // The DIV that is to transition in is set to highest z-index.
                divCollection(next).style.zIndex = 2;                                             
                var transitionFilterCol = divCollection(next).childNodes;
                var nextTransitionFilter = new Object();
                // Create a reference to the next TRANSITIONFILTER.
                nextTransitionFilter = transitionFilterCol(0);
                var nextDiv = new Object();
                // Create a reference to the next DIV.
                nextDiv = divCollection(next);
                // Begin the next transitionFilter.
                nextTransitionFilter.beginElement();
                // Begin the next DIV
                nextDiv.beginElement();
                break;
            }
        }    
  }
  </SCRIPT>  
  <?import namespace = t urn = "urn:schemas-microsoft-com:time" 
    implementation = "#default#time2" />
  
/HEAD>
<BODY TOPMARGIN=0 LEFTMARGIN=0 BGPROPERTIES="FIXED" LINK="#000000" VLINK="#808080" ALINK="#000000">
<%
slideShow[0] = "aaa.jpg", "aaa", "http://www.2webvideo.com", "_new", "top=250, left=300, width=500, height=300, location, resizable, scrollbars";
slideShow[1] = "bbb.jpg", "bbb";
slideShow[2] = "ccc.jpg", "ccc", "http://www.yahoo.com";
slideShow[3] = "ddd.jpg", "ddd", "http://www.google.com", "_new";
slideShow[4] = "eee.jpg", "eee";
slideShow[5] = "fff.jpg", "fff", "http://www.bing.com", "_new";

%>

</BODY>
</HTML>