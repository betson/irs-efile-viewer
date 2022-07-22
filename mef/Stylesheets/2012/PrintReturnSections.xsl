---
---
<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<!-- Set image path -->
<xsl:param name="ImagePath">{{ site.github.url }}/mef/rrprd/common/images</xsl:param>
<xsl:variable name="TOCPathElims" select="/AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Eliminations" />
<xsl:variable name="TOCPathAdjs" select="/AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Adjustments" />
<xsl:variable name="TOCPathParent" select="/AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Parent" />
<xsl:variable name="TOCPathSubsidiary" select="/AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Subsidiary" />
<xsl:variable name="TOCGroupAttrVal" select="/AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/@group" />
<xsl:variable name="DispLabel">
	<xsl:choose>
		<xsl:when test="$TOCGroupAttrVal = 'NonSubcon'">
			<xsl:value-of select="'1120 Consolidation'" />
		</xsl:when>
		<xsl:when test="$TOCGroupAttrVal = '1120Subcon'">
			<xsl:value-of select="'1120 Sub-Consolidation'" />
		</xsl:when>
		<xsl:when test="$TOCGroupAttrVal = '1120LSubcon'">
			<xsl:value-of select="'1120-L Sub-Consolidation'" />
		</xsl:when>
		<xsl:when test="$TOCGroupAttrVal = '1120PCSubcon'">
			<xsl:value-of select="'1120-PC Sub-Consolidation'" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="'Consolidated'" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:variable>
<!-- ===== TEMPLATES CALLED FROM THE MAIN TEMPLATE - BEGIN ===== -->

<!-- Template to populate the consolidated div and link -->
<xsl:template name="PopulateConsolidated">
<div id="ConsolidatedDiv">
<nobr><xsl:if test="$TOCPathParent"><img src="{$ImagePath}/Linv.gif" class="styIconImg" alt="Consolidated Return" /></xsl:if><img src="{$ImagePath}/consolidated.gif" class="styIconImg" alt="Consolidated Return" /><span id="consolidated" class="styDataLabel" onmouseover="LabelOver( this.id );" onmouseout="LabelOut( this.id );" onclick="LabelClick( this.id );PostGetPrintDocListForm( 'consolidated', '' );" title="Select to list documents in consolidated return"><xsl:value-of select="$DispLabel" /></span></nobr>
</div>
</xsl:template>

<!-- Template to populate the eliminations div and link -->
<xsl:template name="PopulateEliminations">
<div id="ElimsDiv">
<nobr><xsl:choose><xsl:when test="$TOCPathParent or $TOCPathAdjs"><img src="{$ImagePath}/T.gif" class="styIconImg" alt="Eliminations" /></xsl:when><xsl:otherwise><img src="{$ImagePath}/L.gif" class="styIconImg" alt="Parent Return" /></xsl:otherwise></xsl:choose><img src="{$ImagePath}/parent.gif" class="styIconImg" alt="Eliminations" /><span id="eliminations" class="styDataLabel" onmouseover="LabelOver( this.id );" onmouseout="LabelOut( this.id );" onclick="LabelClick( this.id );PostGetPrintDocListForm( 'eliminations', '' );" title="Select to list documents in Eliminations section">Eliminations</span></nobr>
</div>
</xsl:template>

<!-- Template to populate the adjustments div and link -->
<xsl:template name="PopulateAdjustments">
<div id="AdjsDiv">
<nobr><xsl:choose><xsl:when test="$TOCPathParent"><img src="{$ImagePath}/T.gif" class="styIconImg" alt="Adjustments" /></xsl:when><xsl:otherwise><img src="{$ImagePath}/L.gif" class="styIconImg" alt="Parent Return" /></xsl:otherwise></xsl:choose><img src="{$ImagePath}/parent.gif" class="styIconImg" alt="Adjustments" /><span id="adjustments" class="styDataLabel" onmouseover="LabelOver( this.id );" onmouseout="LabelOut( this.id );" onclick="LabelClick( this.id );PostGetPrintDocListForm( 'adjustments', '' );" title="Select to list documents in Adjustments section">Adjustments</span></nobr>
</div>
</xsl:template>

<!-- Template to populate the parent div and link -->
<xsl:template name="PopulateParent">
<div id="ParentDiv">
<nobr><xsl:choose><xsl:when test="$TOCPathSubsidiary"><img src="{$ImagePath}/T.gif" class="styIconImg" alt="Parent Return" /></xsl:when><xsl:otherwise><img src="{$ImagePath}/L.gif" class="styIconImg" alt="Parent Return" /></xsl:otherwise></xsl:choose><img src="{$ImagePath}/parent.gif" class="styIconImg" alt="Parent" /><span id="parent" class="styDataLabel" onmouseover="LabelOver( this.id );" onmouseout="LabelOut( this.id );" onclick="LabelClick( this.id );PostGetPrintDocListForm( 'parent', '' );" title="Select to list documents in parent return">Parent</span></nobr>
</div>
</xsl:template>


<!-- Template to populate the subsidiary twistie, folder and div -->
<xsl:template name="PopulateSubsidiaries">

<!-- Subsidiary Folder BEGINS -->
<div id="SubsidiaryFolder">
<nobr><img src="{$ImagePath}/Lplus.gif" id="SubsidiaryTwistieImg" class="styIconImg" alt="Select to expand Subsidiaries folder" onclick="ToggleFolder();" /><img src="{$ImagePath}/folderclosed.gif" id="SubsidiaryFolderImg" class="styIconImg" alt="Select to expand Subsidiaries folder" ondblclick="ToggleFolder();" /><span id="subsidiaries" class="styTogglerLabel" title="Select to expand Subsidiaries folder" onmouseover="LabelOver( this.id )" onmouseout="LabelOut( this.id )" ondblclick="LabelClick( this.id );ToggleFolder();">Subsidiaries</span></nobr>
</div>
<!-- Subsidiary Folder ENDS -->

<!-- Subsidiary Area BEGINS -->
<div id="SubsidiaryArea" style="display:none;">

<!-- Each Subsidiary BEGINS -->
<xsl:for-each select="/AppData/SubmissionReferenceAndSummary/ReturnTableOfContents/Subsidiary">
<xsl:variable name="SubsidiaryEIN" select="Document[1]/@displayId" />
<div id="SubsidiaryDiv{$SubsidiaryEIN}">
<nobr><span style="width:16px;"></span><xsl:choose><xsl:when test="position() != last()"><img src="{$ImagePath}/T.gif" class="styIconImg" alt="Subsidiary {$SubsidiaryEIN}" /></xsl:when><xsl:otherwise><img src="{$ImagePath}/L.gif" class="styIconImg" alt="Subsidiary {$SubsidiaryEIN}" /></xsl:otherwise></xsl:choose><img src="{$ImagePath}/subsidiary.gif" class="styIconImg" alt="Subsidiary {$SubsidiaryEIN}" /><span id="Subsidiary{$SubsidiaryEIN}-{position()}" class="styTogglerLabel" title="Select to list documents in Subsidiary {$SubsidiaryEIN}" onmouseover="LabelOver( this.id )" onmouseout="LabelOut( this.id )" onclick="LabelClick( this.id );PostGetPrintDocListForm( 'subsidiary', '{$SubsidiaryEIN}-{position()}' );">Subsidiary <xsl:value-of select="$SubsidiaryEIN" /></span></nobr>
</div>
</xsl:for-each>
<!-- Each Subsidiary ENDS -->

</div>
<!-- Subsidiary Area ENDS -->

</xsl:template>

<!-- ===== TEMPLATES CALLED FROM THE MAIN TEMPLATE - ENDS ===== -->



<!-- ===== MAIN TEMPLATE - BEGINS ===== -->

<!-- Main template -->
<xsl:template match="/">

<html>
<head>
<!-- Set Document Title -->
<title>Print Window Sidebar</title>
<!-- No Browser Caching -->
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<!-- No Proxy Caching -->
<meta http-equiv="Cache-Control" content="private" />
<!-- Define Character Set -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<!-- Set Description -->
<meta name="Description" content="Print Window Sidebar" />

<style type="text/css" id="MainStyles">
body {   /* Global Styles */
  width: auto; height: auto;
  color: black; background-color: white;
  font-family: verdana, arial, sans-serif; font-size: 8pt;
  font-weight: normal; font-style: normal;
  line-height: normal; white-space: normal;
  text-align: left; text-indent: 0px; text-decoration: none;
  vertical-align: middle;
  margin-top: 6px; margin-bottom: 0px; margin-left: 6px; margin-right: 0px;
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: none; border-color: silver;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 2px;
  float: none; clear: none;
  display: block;
  cursor: auto;
}
.styIconImg {
  width: 16px; height: 16px;
  border-style: none; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  vertical-align: top;
}
.styTogglerLabel {
  background-color: white;
  height: 16px;
  font-weight: normal;
  border-style: none; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  padding-top: 0px; padding-bottom: 0px; padding-left: 3px; padding-right: 0px;
  vertical-align: middle;
  cursor: default;
}
.styDataLabel {
  background-color: white;
  height: 16px;
  font-weight: normal;
  border-style: none; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  padding-top: 0px; padding-bottom: 0px; padding-left: 3px; padding-right: 0px;
  vertical-align: middle;
  cursor: hand;
}
.styDataLabelHL {   /* Highlighted Data Label */
  background-color: <xsl:value-of select="/AppData/UserPreferences/View/SubmissionTreeMouseoverBgColor" />;
  height: 16px;
  font-weight: normal;
  border-style: none; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  padding-top: 0px; padding-bottom: 0px; padding-left: 3px; padding-right: 0px;
  vertical-align: middle;
  cursor: hand;
}
.styDataLabelClk {   /* Clicked Data Label */
  background-color: <xsl:value-of select="/AppData/UserPreferences/View/SubmissionTreeSelectedItemBgColor" />;
  height: 16px;
  font-weight: bold;
  border-style: none; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  padding-top: 0px; padding-bottom: 0px; padding-left: 3px; padding-right: 0px;
  vertical-align: middle;
  cursor: hand;
}
</style>


<script language="JavaScript" type="text/javascript">
var DisplaySectionId = "";  // Default return section ( consolidated | parent | subsidiary )
var subsidiariesExpanded = false;  // Default state of the Subsidiaries folder ( true for expanded | false for collapsed )
var expandedLbl = "Select to collapse Subsidiaries folder";  // title for expanded twistie, folder icon and subsidiaries label
var collapsedLbl = "Select to expand Subsidiaries folder";  // title for expanded twistie, folder icon and subsidiaries label

// Preload images
expandedTwistieImg = new Image();
expandedTwistieImg.src = "<xsl:value-of select='$ImagePath' />/Lminus.gif";
collapsedTwistieImg = new Image();
collapsedTwistieImg.src = "<xsl:value-of select='$ImagePath' />/Lplus.gif";

openFolderImg = new Image();
openFolderImg.src = "<xsl:value-of select='$ImagePath' />/folderopen.gif";
closedFolderImg = new Image();
closedFolderImg.src = "<xsl:value-of select='$ImagePath' />/folderclosed.gif";


// Set the properties of the Subsidiaries twistie, folder and label
function SetFolderProperties() {

  if ( subsidiariesExpanded ) {
    document.getElementById( "SubsidiaryTwistieImg" ).src = expandedTwistieImg.src;
    document.getElementById( "SubsidiaryTwistieImg" ).alt = expandedLbl;
    document.getElementById( "SubsidiaryFolderImg" ).src = openFolderImg.src;
    document.getElementById( "SubsidiaryFolderImg" ).alt = expandedLbl;
    document.getElementById( "subsidiaries" ).title = expandedLbl;
    document.getElementById( "SubsidiaryArea" ).style.display = "block";
  }
  else {
    document.getElementById( "SubsidiaryTwistieImg" ).src = collapsedTwistieImg.src;
    document.getElementById( "SubsidiaryTwistieImg" ).alt = collapsedLbl;
    document.getElementById( "SubsidiaryFolderImg" ).src = closedFolderImg.src;
    document.getElementById( "SubsidiaryFolderImg" ).alt = collapsedLbl;
    document.getElementById( "subsidiaries" ).title = collapsedLbl;
    document.getElementById( "SubsidiaryArea" ).style.display = "none";
  }
  return;
}

// Expand or collapse the Subsidiaries folder
function ToggleFolder() {

  if ( subsidiariesExpanded ) subsidiariesExpanded = false;
  else subsidiariesExpanded = true;

  SetFolderProperties();
  return;
}

// Check startup folder state
function CheckStartupFolderState() {

  if ( subsidiariesExpanded ) {
    subsidiariesExpanded = false;
    ToggleFolder();
  }

  return;
}

// Mouseover Label
function LabelOver( sectionId ) {
  if ( sectionId != DisplaySectionId ) document.getElementById( sectionId ).className = "styDataLabelHL";
  return;
}

// Mouseout Label
function LabelOut( sectionId ) {
  if ( sectionId != DisplaySectionId ) document.getElementById( sectionId ).className = "styDataLabel";
  return;
}

// Mouse Click Label
function LabelClick( sectionId ) {
  if ( sectionId != DisplaySectionId ) {
    if ( DisplaySectionId != "" ) document.getElementById( DisplaySectionId ).className = "styDataLabel";
    document.getElementById( sectionId ).className = "styDataLabelClk";
    DisplaySectionId = sectionId;
  }
  return;
}

// Post the form to populate the doclist in the right frame
function PostGetPrintDocListForm( returnSection, subsidiaryEIN ) {

  // Set the values of returnSection and subsidiaryEIN
  document.getPrintDocListForm.submissionSection.value = returnSection;
  document.getPrintDocListForm.subsidiaryEIN.value = subsidiaryEIN;

  // Debugging code: check post parameters before submitting form
/*
  var postFormVars = "";
  for ( i = 0; i &lt; document.getPrintDocListForm.length; i++ ) {
      postFormVars += "\n" + document.getPrintDocListForm.elements[i].name + " = " + document.getPrintDocListForm.elements[i].value;
  }
  alert ( postFormVars );
  // Debugging code ends
*/

  document.getPrintDocListForm.submit();
  return;
}

// Init function
function init() {
  CheckStartupFolderState();
  LabelClick( "consolidated" );
  PostGetPrintDocListForm( "consolidated", "" );
  return;
}
</script>


</head>

<body onload="init();">

<!-- Post this form to populate the print doc list frame on the right side of the print window -->
<form id="getPrintDocListForm" name="getPrintDocListForm" action="{{ site.github.url }}/mef/rrprd/sdi/proxy/getPrintSubDocList" method="post" target="PrintReturnDoclist">
  <input type="hidden" name="stage" value="{/AppData/Parameters/Stage}" />
  <input type="hidden" name="dln" value="{/AppData/Parameters/DLN}" />
  <input type="hidden" name="dlnChanged" value="{/AppData/Parameters/DLNChanged}" />
  <input type="hidden" name="dlnLatest" value="{/AppData/Parameters/DLNLatest}" />
  <input type="hidden" name="tin" value="{/AppData/Parameters/TIN}" />
  <input type="hidden" name="tinChanged" value="{/AppData/Parameters/TINChanged}" />
  <input type="hidden" name="tinLatest" value="{/AppData/Parameters/TINLatest}" />
  <input type="hidden" name="submissionKey" value="{/AppData/Parameters/SubmissionKey}" />
  <input type="hidden" name="acceptanceStatus" value="{/AppData/Parameters/AcceptanceStatus}" />
  <input type="hidden" name="submissionType" value="{/AppData/Parameters/SubmissionType}" />
  <input type="hidden" name="submissionVersion" value="{/AppData/Parameters/SubmissionVersion}" />
  <input type="hidden" name="submissionSection" value="" />
  <input type="hidden" name="subsidiaryEIN" value="" />
  <input type="hidden" name="contentAndSummaryKey" value="{/AppData/Parameters/ContentAndSummaryKey}" />
</form>

<!-- Populate Consolidated -->
<xsl:call-template name="PopulateConsolidated" />

<xsl:if test="$TOCPathElims"><xsl:call-template name="PopulateEliminations" /></xsl:if>

<xsl:if test="$TOCPathAdjs"><xsl:call-template name="PopulateAdjustments" /></xsl:if>

<!-- Populate Parent, if exists -->
<xsl:if test="$TOCPathParent"><xsl:call-template name="PopulateParent" /></xsl:if>

<!-- Populate subsidiaries, if exist -->
<xsl:if test="$TOCPathSubsidiary"><xsl:call-template name="PopulateSubsidiaries" /></xsl:if>

<br />

</body>

</html>

</xsl:template>
<!-- ===== MAIN TEMPLATE - ENDS ===== -->

</xsl:stylesheet>
