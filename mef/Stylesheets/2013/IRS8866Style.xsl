<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="IRS8866Style">
  <!-- CSS Styles Go Here -->
  /* BEGIN PAGE SPECIFIC STYLES */
  .styForm8866GenericCell {   /* Form Name */
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    .styForm8866DarkHeaderCell{
      background-color: <xsl:value-of select="$UserPref/View/TableHeaderBgColor"/>; 
    }
  /* END PAGE SPECIFIC STYLES */
</xsl:template>
</xsl:stylesheet>



