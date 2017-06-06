<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for Form 6781 -->

<xsl:template name="IRS6781Style">
  .styIRS6781Attachment {   /* Attachment */
    font-family: "Arial Narrow"; font-size: 7pt;
    margin-left:3mm;
    text-align:left;
  }
  .styIRS6781INBox{ /*Employer ID number box*/
    font-size:6pt;
    font-weight: bold;
    float:left;
  }
  .styIRS6781PTNum{ /* Part Number */
    height:4mm; width:16mm;
    color:white;
    background-color:black;
    font-size: 9pt;
    font-weight:bold;
    text-align:center;
    float:left; clear: none;
  }
  .styIRS6781PTDesc{ /* Part Description */`
    font-size: 9pt; font-weight: bold; width:168mm;
  }
  .styIRS6781SectionDesc{ /* Section Title Description */
    font-size: 9pt; font-weight: bold; text-align:left;
    float: none;clear: none;
  }
  .styIRS6781TableCellPartIISectA {   /* Table Cell made for PartII SectA */
    width: 18.9mm;
    color: black;
    text-align: right;
    font-size:5pt;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  
</xsl:template>

</xsl:stylesheet>