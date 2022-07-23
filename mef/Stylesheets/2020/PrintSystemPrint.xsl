<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<script language="JavaScript" type="text/javascript">
var printStarted = false;

function handleBlur() {
  return;
}

function handleFocus() {
  if ( printStarted ) top.close();
  return;
}

function init() {
  parent.PrintMessage.document.forms["printCancelForm"].printCancel.style.visibility = "hidden";
  parent.PrintMessage.setPrintMessage( "Printing in progress..." );
  printStarted = true;
  return;
}
</script>
</head>

<body onload="this.focus();init();self.print();" onblur="handleBlur();" onfocus="handleFocus();">
</body>

</html>

</xsl:template>
</xsl:stylesheet>