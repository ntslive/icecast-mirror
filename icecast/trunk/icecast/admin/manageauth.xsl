<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output method="html" indent="yes" />
<xsl:template match = "/icestats" >
<html>
<head>
<title>Icecast Streaming Media Server</title>
<link rel="stylesheet" type="text/css" href="/style.css" />
</head>
<body bgcolor="black">
	<center>
	<table border="0" cellpadding="1" cellspacing="3">
	<tr>        
	    <td align="center">
		<a class="nav" href="listmounts.xsl">List MountPoints</a> | 
        	<a class="nav" href="moveclients.xsl">Move Listeners</a> | 
        	<a class="nav" href="stats.xsl">Stats</a> | 
        	<a class="nav" href="/status.xsl">Status Page</a>
	    </td></tr>
	</table>
	</center>
<table border="0" width="90%%">
<tr>
<td width="50"></td>
<td>
<h2>Show defined users</h2>
<div class="roundcont">
<div class="roundtop">
<img src="/corner_topleft.jpg" class="corner" style="display: none" />
</div>
<div class="newscontent">
<xsl:for-each select="iceresponse">
<xsl:value-of select="message" /> 
</xsl:for-each>
<xsl:for-each select="source">
<h3>
<xsl:if test="server_name"><xsl:value-of select="server_name" /> </xsl:if>
(<xsl:value-of select="@mount" />)</h3>
	<table border="0" cellpadding="1" cellspacing="5" bgcolor="444444">
	<tr>        
	    <td align="center">
		<a class="nav2" href="listclients.xsl?mount={@mount}">Show Listeners</a> | 
        	<a class="nav2" href="moveclients.xsl?mount={@mount}">Move Listeners</a> | 
        	<a class="nav2" href="killsource.xsl?mount={@mount}">Kill Source</a>
	    </td></tr>
	</table>
<br></br>
<form method="GET" action="manageauth.xsl">
<table cellpadding="2" cellspacing="4" border="0" >
		<tr>
				<td ><b>User Id</b></td>
				<td ><b>Password</b></td>
				<td ></td>
		</tr>
<xsl:variable name = "themount" ><xsl:value-of select="@mount" /></xsl:variable>
<xsl:for-each select="User">
		<tr>
				<td><xsl:value-of select="username" /></td>
				<td><xsl:value-of select="password" /></td>
				<td><a class="nav2" href="manageauth.xsl?mount={$themount}&amp;username={username}&amp;action=delete">delete</a></td>
		</tr>
</xsl:for-each>
		<tr>
				<td ><input type="text" name="username" /></td>
				<td ><input type="text" name="password" /></td>
		</tr>
		<tr>
				<td colspan="2"><input type="Submit" name="Submit" value="Add New User" /></td>
		</tr>
</table>
<input type="hidden" name="mount" value="{@mount}"/>
<input type="hidden" name="action" value="add"/>
</form>
<br></br>
<br></br>
</xsl:for-each>
</div>
<div class="roundbottom">
<img src="/corner_bottomleft.jpg" class="corner" style="display: none" />
</div>
</div>
<br></br><br></br>
</td>
<td width="50"></td>
</tr>
</table>
<div class="poster">
<img align="left" src="/icecast.png" />Support icecast development at <a class="nav" href="http://www.icecast.org">www.icecast.org</a></div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
