<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:exslt="http://icl.com/saxon">
  <!--

    Global variable defaults: May be overridden in the calling stylesheets

    -->
  <xsl:variable name="spaceBetweenLines" select="0"/>
  <xsl:variable name="debuggingColors" select="false()"/>
  <xsl:variable name="stubWidth" select="3"/>
  <xsl:variable name="displayLineHeights" select="false()"/>
  <xsl:variable name="standardLine" select="'StdLn'"/>
  <!--

    TextLine : Template to display one or more lines of text

    -->
  <xsl:template name="TextLine">
    <xsl:param name="text"/>
    <xsl:param name="verylong"/>
    <xsl:param name="overlong"/>
    <xsl:param name="slightlylong"/>
    <xsl:param name="nofloat"/>
    <xsl:param name="height"/>
    <xsl:param name="width"/>
    <xsl:param name="absRight"/>
    <xsl:param name="center"/>
    <xsl:variable name="numLines" select="count(exslt:node-set($text)/line)"/>
    <xsl:for-each select="$text/line">
      <span>
        <xsl:attribute name="style">position:relative;width:<xsl:value-of select="$stubWidth"/>mm;height:<xsl:value-of select="$height"/>mm;line-height:<xsl:value-of select="$height"/>mm;display:block;<xsl:if test="position()=last() and not($nofloat)">float:left;</xsl:if><xsl:if test="$debuggingColors">background-color:rgb(255,<xsl:value-of select="127 + 128 div $numLines * ($numLines - position())"/>,255);</xsl:if></xsl:attribute>
        <span>
          <xsl:attribute name="style">width:<xsl:value-of select="$width"/>mm;position:absolute;bottom:0mm;<xsl:if test="$absRight">right:0mm;</xsl:if><xsl:if test="$center">left:-<xsl:value-of select="($width - $stubWidth) div 2"/>mm;</xsl:if></xsl:attribute>
          <xsl:if test="$verylong">
            <xsl:attribute name="class">verylong</xsl:attribute>
          </xsl:if>
          <xsl:if test="$overlong">
            <xsl:attribute name="class">overlong</xsl:attribute>
          </xsl:if>
          <xsl:if test="$slightlylong">
            <xsl:attribute name="class">slightlylong</xsl:attribute>
          </xsl:if>
          <xsl:copy-of select="node()"/>
        </span>
      </span>
      <xsl:if test="position()!=last()">
        <!-- br/ -->
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <!--

    OneBox : Template for a single box, with data, with configurable left border and bottom border

    -->
  <xsl:template name="OneBox">
    <xsl:param name="data"/>
    <xsl:param name="className"/>
    <xsl:param name="boxWidth"/>
    <xsl:param name="boxHeight"/>
    <xsl:param name="bottomBorder"/>
    <xsl:param name="leftBorder"/>
    <xsl:param name="bgColor"/>
    <xsl:param name="align" select="'right'"/>
    <xsl:param name="posish" select="'absolute'"/>
    <xsl:param name="padding-top" select="'0'"/>
    <xsl:param name="topText"/>
    <div class="{$className}" style="width:{$boxWidth}mm;height:{$boxHeight}mm;padding:0;padding-top:{$padding-top}mm;border-bottom:{$bottomBorder}mm solid;position:relative;{$leftBorder}{$bgColor}">
      <xsl:if test="$topText">
        <span style="">
          <xsl:copy-of select="$topText"/>
        </span>
      </xsl:if>
      <span style="position:{$posish};bottom:0;right:{0-$borderWidth}mm;text-align:{$align};width:{$boxWidth - $borderWidth}mm;padding-left:{2*$borderWidth}mm;padding-right:{$borderWidth*4}mm">
        <xsl:copy-of select="$data"/>
      </span>
    </div>
  </xsl:template>
  <!--

    RightBoxes : Template for three boxes of various widths, generally at the right page margin

    -->
  <xsl:template name="RightBoxes">
    <xsl:param name="num"/>
    <xsl:param name="varBoxData"/>
    <xsl:param name="cBoxData"/>
    <xsl:param name="rnboxWidth"/>
    <xsl:param name="rvarboxWidth"/>
    <xsl:param name="rcboxWidth"/>
    <xsl:param name="boxHeight"/>
    <xsl:param name="bottomMM"/>
    <xsl:param name="noInternalLines"/>
    <xsl:param name="bgcolor"/>
    <xsl:param name="centerAll"/>
    <xsl:param name="rnGrey"/>
    <xsl:param name="percentageBox"/>
    <xsl:param name="noLeftBorder"/>
    <!-- global variable rnboxDefaultGreyAboveLastLine -->
    <xsl:call-template name="OneBox">
      <xsl:with-param name="data" select="$num"/>
      <xsl:with-param name="className" select="'sty4972RightNumBox'"/>
      <xsl:with-param name="boxWidth" select="$rnboxWidth"/>
      <xsl:with-param name="boxHeight" select="$boxHeight"/>
      <xsl:with-param name="bottomBorder" select="$bottomMM"/>
      <xsl:with-param name="bgColor">
        <xsl:choose>
          <xsl:when test="$rnGrey">
            background-color:<xsl:value-of select="$greyColor"/>;
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$bgcolor"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
      <xsl:with-param name="align" select="'center'"/>
      <xsl:with-param name="leftBorder">
        <xsl:if test="$noLeftBorder">border-left:0;</xsl:if>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="OneBox">
      <xsl:with-param name="data" select="$varBoxData"/>
      <xsl:with-param name="className" select="'sty4972AmountBox'"/>
      <xsl:with-param name="boxWidth">
        <xsl:choose>
          <xsl:when test="$percentageBox">
            <xsl:value-of select="$rvarboxWidth + $rcboxWidth"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$rvarboxWidth"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
      <xsl:with-param name="boxHeight" select="$boxHeight"/>
      <xsl:with-param name="bottomBorder" select="$bottomMM"/>
      <xsl:with-param name="leftBorder">
        <xsl:if test="$noInternalLines">border-left:0;</xsl:if>
      </xsl:with-param>
      <xsl:with-param name="bgColor" select="$bgcolor"/>
      <xsl:with-param name="align">
        <xsl:choose>
          <xsl:when test="$centerAll">center</xsl:when>
          <xsl:otherwise>right</xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:if test="not($percentageBox) and $rcboxWidth != 0">
      <xsl:call-template name="OneBox">
        <xsl:with-param name="data" select="$cBoxData"/>
        <xsl:with-param name="className" select="'sty4972AmountBox'"/>
        <xsl:with-param name="boxWidth" select="$rcboxWidth"/>
        <xsl:with-param name="boxHeight" select="$boxHeight"/>
        <xsl:with-param name="bottomBorder" select="$bottomMM"/>
        <xsl:with-param name="leftBorder">
          <xsl:if test="$noInternalLines">border-left:0;</xsl:if>
        </xsl:with-param>
        <xsl:with-param name="bgColor" select="$bgcolor"/>
        <xsl:with-param name="align">
          <xsl:choose>
            <xsl:when test="$centerAll">center</xsl:when>
            <xsl:otherwise>left</xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!--

    EmptyBoxes : Template for empty boxes to the right of inset boxes, like line 14 on form 4972

    -->
  <xsl:template name="EmptyBoxes">
    <xsl:param name="boxLevel"/>
    <xsl:param name="rboxWidth"/>
    <xsl:param name="inboxWidth"/>
    <xsl:param name="rnboxWidth"/>
    <xsl:param name="rcboxWidth"/>
    <xsl:param name="boxHeight"/>
    <xsl:param name="bottomMM"/>
    <xsl:param name="bgcolor"/>
    <xsl:if test="$boxLevel">
      <xsl:call-template name="RightBoxes">
        <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
        <xsl:with-param name="rvarboxWidth">
          <xsl:choose>
            <xsl:when test="$boxLevel > 1">
              <xsl:value-of select="$inboxWidth - $rnboxWidth - $rcboxWidth"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$rboxWidth - $rnboxWidth - $rcboxWidth"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
        <xsl:with-param name="boxHeight" select="$boxHeight"/>
        <xsl:with-param name="bottomMM" select="$bottomMM"/>
        <xsl:with-param name="rnGrey" select="1"/>
        <xsl:with-param name="bgcolor" select="$bgcolor"/>
      </xsl:call-template>
      <xsl:if test="$boxLevel > 1">
        <xsl:call-template name="EmptyBoxes">
          <xsl:with-param name="boxLevel" select="$boxLevel - 1"/>
          <xsl:with-param name="rboxWidth" select="$rboxWidth"/>
          <xsl:with-param name="inboxWidth" select="$inboxWidth"/>
          <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
          <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
          <xsl:with-param name="boxHeight" select="$boxHeight"/>
          <xsl:with-param name="bottomMM" select="0"/>
          <xsl:with-param name="bgcolor" select="$bgcolor"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
  </xsl:template>
  <!--

    FormLine: This is the master template that produces a single line of number - text - number - boxes

    -->
  <xsl:template name="FormLine">
    <xsl:param name="lineType" select="$standardLine"/>
    <xsl:param name="boxLevel" select="1"/>
    <xsl:param name="verylong"/>
    <xsl:param name="overlong"/>
    <xsl:param name="slightlylong"/>
    <xsl:param name="linenum1"/>
    <xsl:param name="lnalpha"/>
    <xsl:param name="linetext"/>
    <xsl:param name="numdots"/>
    <xsl:param name="withArrow"/>
    <xsl:param name="linenum2"/>
    <xsl:param name="showHeader"/>
    <xsl:param name="dataVal"/>
    <xsl:param name="cboxDataVal"/>
    <xsl:param name="noBottomLine" select="false()"/>
    <xsl:param name="verticalOffset" select="0"/>
    <xsl:param name="noInternalLines"/>
    <xsl:param name="noLeftBorder"/>
    <xsl:param name="backgroundColor"/>
    <xsl:param name="percentageBox"/>
    <xsl:param name="noSpaceAbove"/>
    <xsl:param name="rnboxGrey"/>
    <!-- Controls the portion above the first text line, i.e. beside the intra-line space -->
    <xsl:param name="rnboxGreyAbove"/>
    <!-- Controls the portion beside all text lines except the last -->
    <xsl:param name="rnboxGreyAboveLastLine"/>
    <xsl:param name="rnboxConnectsGreyAbove" select="false()"/>
    <xsl:param name="rnboxSingleHeight"/>
    <xsl:param name="rnboxNumOnLine" select="0"/>
    <xsl:param name="rnboxBlankByLine" select="0"/>
    <xsl:param name="noLeftBox"/>
    <xsl:param name="emptyBoxHasLineUnder" select="false()"/>
    <xsl:param name="emptyBoxHasGreyBG"/>
    <xsl:param name="centerAll"/>
    <xsl:param name="curlyBrace"/>
    <xsl:param name="lineBottomBorder"/>
    <xsl:param name="lineVertBorder"/>
    <xsl:param name="noPrintPad"/>
    <xsl:variable name="linetext1">
      <xsl:choose>
        <xsl:when test="count(exslt:node-set($linetext)/line)">
          <xsl:copy-of select="$linetext"/>
        </xsl:when>
        <xsl:otherwise>
          <line>
            <xsl:copy-of select="$linetext"/>
          </line>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="numTextLines" select="count(exslt:node-set($linetext1)/line)"/>
    <xsl:variable name="desLineHeight">
      <xsl:call-template name="CalcDesLineHeight">
        <xsl:with-param name="numTextLines" select="$numTextLines"/>
        <xsl:with-param name="noBottomLine" select="$noBottomLine"/>
      </xsl:call-template>
    </xsl:variable>
    <!-- xsl:variable name="desLineHeight" select="4.08"/ -->
    <xsl:variable name="stdLineHeight" select="$lineHeight - $borderWidth * 2"/>
    <xsl:variable name="lnboxWidth" select="$widths/rec[@linetype=$lineType]/@lnbox"/>
    <xsl:variable name="rboxWidth" select="$widths/rec[@linetype=$lineType]/@rbox"/>
    <xsl:variable name="rnboxWidth" select="$widths/rec[@linetype=$lineType]/@rnbox"/>
    <xsl:variable name="rcboxWidth" select="$widths/rec[@linetype=$lineType]/@rcbox"/>
    <xsl:variable name="inboxWidth" select="$widths/rec[@linetype=$lineType]/@rinbox"/>
    <xsl:variable name="cbboxWidth">
      <xsl:choose>
        <xsl:when test="exslt:node-set($widths)/rec[@linetype=$lineType]/@cbbox">
          <xsl:value-of select="$widths/rec[@linetype=$lineType]/@cbbox"/>
        </xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="totWidth">
      <xsl:choose>
        <xsl:when test="$widths/rec[@linetype=$lineType]/@totWidth">
          <xsl:value-of select="$widths/rec[@linetype=$lineType]/@totWidth"/>
        </xsl:when>
        <xsl:otherwise><xsl:value-of select="$pageWidth"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="printWidthPad">
      <xsl:choose>
        <xsl:when test="$noPrintPad">0</xsl:when>
        <xsl:otherwise>0.8</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="inline">
      <xsl:if test="$widths/rec[@linetype=$lineType]/@totWidth">display:inline;</xsl:if>
    </xsl:variable>
    <xsl:variable name="rvarboxWidth">
      <xsl:choose>
        <xsl:when test="2 > $boxLevel">
          <xsl:value-of select="$rboxWidth - $rnboxWidth - $rcboxWidth"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$inboxWidth - $rnboxWidth - $rcboxWidth"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="textWidth" select="$totWidth - $lnboxWidth * not($noLeftBox) - $rboxWidth - ($cbboxWidth + $inboxWidth) * ($boxLevel - 1)"/>
    <xsl:variable name="bgcolor">
      <xsl:if test="$backgroundColor">background-color:<xsl:value-of select="$backgroundColor"/>;</xsl:if>
    </xsl:variable>
    <xsl:variable name="boxHeight">
      <xsl:choose>
        <xsl:when test="$showHeader">
          <xsl:value-of select="$lineHeight * ($numTextLines - 1)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$lineHeight * $numTextLines"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="bottomMM" select="$borderWidth * not($noBottomLine)"/>
    <xsl:comment> Line <xsl:choose>
        <xsl:when test="$linenum2 and $linenum2 != ' '">
          <xsl:value-of select="$linenum2"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$linenum1"/>
          <xsl:value-of select="$lnalpha"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:comment>
    <xsl:if test="$spaceBetweenLines and not($noSpaceAbove)">
      <!-- If there is inter-line spacing, output a "line" with no lnbox number, no text, and only a right
           box set.  If boxLevel > 1 or the next rnbox should be grey, then the rnbox should be grey,
           otherwise normal -->
      <div class="s4972YNLine" style="width:{$totWidth + $printWidthPad}mm;height:{$spaceBetweenLines}mm;line-height:{$spaceBetweenLines}mm">
        <div class="styLNLeftNumBox" style="width:{$lnboxWidth}mm;height:{$spaceBetweenLines}mm;padding:0"/>
        <xsl:variable name="tlength"/>
        <div class="styLNDesc" style="width:{$totWidth - $lnboxWidth - $rboxWidth - $inboxWidth * $rnboxConnectsGreyAbove}mm;height:{$spaceBetweenLines}mm;padding:0"/>
        <xsl:if test="$rnboxConnectsGreyAbove">
          <xsl:call-template name="RightBoxes">
            <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
            <xsl:with-param name="rvarboxWidth" select="$inboxWidth - $rnboxWidth - $rcboxWidth"/>
            <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
            <xsl:with-param name="boxHeight" select="$spaceBetweenLines"/>
            <xsl:with-param name="bottomMM" select="0"/>
            <xsl:with-param name="rnGrey" select="true()"/>
            <xsl:with-param name="noInternalLines" select="$noInternalLines"/>
            <xsl:with-param name="bgcolor" select="$bgcolor"/>
          </xsl:call-template>
        </xsl:if>
        <xsl:call-template name="RightBoxes">
          <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
          <xsl:with-param name="rvarboxWidth" select="$rboxWidth - $rnboxWidth - $rcboxWidth"/>
          <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
          <xsl:with-param name="boxHeight" select="$spaceBetweenLines"/>
          <xsl:with-param name="bottomMM" select="0"/>
          <xsl:with-param name="rnGrey" select="$boxLevel > 1 or $rnboxGrey or $rnboxGreyAbove"/>
          <xsl:with-param name="percentageBox" select="$percentageBox"/>
          <xsl:with-param name="bgcolor" select="$bgcolor"/>
          <xsl:with-param name="noInternalLines" select="$noInternalLines or ($rboxWidth = 0)"/>
          <xsl:with-param name="noLeftBorder" select="$noLeftBorder or $rboxWidth = 0"/>
        </xsl:call-template>
      </div>
    </xsl:if>
    <xsl:variable name="bgcyellow">
      <xsl:if test="$debuggingColors">background-color:yellow;</xsl:if>
    </xsl:variable>
    <xsl:variable name="bgcskyblue">
      <xsl:if test="$debuggingColors">background-color:skyblue;</xsl:if>
    </xsl:variable>
    <xsl:variable name="bgcblue">
      <xsl:if test="$debuggingColors">background-color:blue;</xsl:if>
    </xsl:variable>
    <xsl:variable name="bgcaqua">
      <xsl:if test="$debuggingColors">background-color:aqua;</xsl:if>
    </xsl:variable>
    <!-- One div for the entire line -->
    <xsl:variable name="fullHeight" select="$lineHeight * $numTextLines"/>
    <div class="s4972YNLine" style="width:{$totWidth + $printWidthPad}mm;height:{$fullHeight}mm;line-height:{$stdLineHeight}mm;{$inline}{$lineVertBorder}{$lineBottomBorder}{$bgcyellow}">
      <!-- left-most line number box -->
      <xsl:if test="not($noLeftBox)">
        <xsl:call-template name="MakeLNBox">
          <xsl:with-param name="lnboxWidth" select="$lnboxWidth"/>
          <xsl:with-param name="fullHeight" select="$fullHeight"/>
          <xsl:with-param name="desLineHeight" select="$desLineHeight"/>
          <xsl:with-param name="bgcskyblue" select="$bgcskyblue"/>
          <xsl:with-param name="bottomMM" select="$bottomMM"/>
          <xsl:with-param name="verticalOffset" select="$verticalOffset"/>
          <xsl:with-param name="linenum1" select="$linenum1"/>
          <xsl:with-param name="numTextLines" select="$numTextLines"/>
          <xsl:with-param name="lnalpha" select="$lnalpha"/>
        </xsl:call-template>
      </xsl:if>
      <!-- main lines of text -->
      <div class="styLNDesc" style="width:{$textWidth}mm;height:{$fullHeight}mm;line-height:{$desLineHeight}mm;position:relative;{$bgcblue}">
        <span style="width:{$textWidth}mm;position:absolute;bottom:{$bottomMM + $verticalOffset}mm;{$bgcaqua}">
          <xsl:call-template name="TextLine">
            <xsl:with-param name="text" select="$linetext1"/>
            <xsl:with-param name="verylong" select="$verylong"/>
            <xsl:with-param name="overlong" select="$overlong"/>
            <xsl:with-param name="slightlylong" select="$slightlylong"/>
            <xsl:with-param name="height" select="$desLineHeight"/>
            <xsl:with-param name="width" select="$textWidth"/>
          </xsl:call-template>
          <!-- Dot leader and optional right-pointing triangle -->
          <xsl:if test="$numdots">
            <span class="styIRS4972DotLn" style="float:right">
              <xsl:call-template name="emitDots">
                <xsl:with-param name="numDots" select="$numdots"/>
              </xsl:call-template>
              <xsl:if test="$withArrow">
                <img class="tightRight" src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/>
              </xsl:if>
            </span>
          </xsl:if>
        </span>
      </div>
      <!-- Space for a curly brace if needed -->
      <xsl:if test="$cbboxWidth > 0.0 and $boxLevel > 1">
        <div class="styLNLeftNumBox" style="width:{$cbboxWidth}mm;height:{$boxHeight - 1}mm;background-color:transparent;position:relative">
          <xsl:if test="$curlyBrace">
            <xsl:call-template name="makeCurlyBrace">
              <xsl:with-param name="pstring" select="$curlyBrace"/>
              <xsl:with-param name="spanWidth" select="$cbboxWidth"/>
            </xsl:call-template>
          </xsl:if>
        </div>
      </xsl:if>
      <!-- Yes / No header boxes -->
      <xsl:if test="$showHeader">
        <xsl:call-template name="RightBoxes">
          <xsl:with-param name="varBoxData">
            <b>Yes</b>
          </xsl:with-param>
          <xsl:with-param name="cBoxData">
            <b>No</b>
          </xsl:with-param>
          <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
          <xsl:with-param name="rvarboxWidth" select="$rvarboxWidth"/>
          <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
          <xsl:with-param name="boxHeight" select="$lineHeight"/>
          <xsl:with-param name="bottomMM" select="$borderWidth"/>
          <xsl:with-param name="centerAll" select="1"/>
          <xsl:with-param name="noLeftBorder" select="$rboxWidth = 0"/>
        </xsl:call-template>
      </xsl:if>
      <!-- Space down $rnboxBlankByLine lines if the first $rnboxBlankByLine boxes are supposed to be blank -->
      <xsl:if test="$rnboxBlankByLine">
        <xsl:call-template name="RightBoxes">
          <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
          <xsl:with-param name="rvarboxWidth" select="$rvarboxWidth"/>
          <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
          <xsl:with-param name="boxHeight" select="$rnboxBlankByLine * $lineHeight"/>
          <xsl:with-param name="bottomMM" select="0"/>
          <xsl:with-param name="noInternalLines" select="true()"/>
          <xsl:with-param name="bgcolor" select="$bgcolor"/>
          <xsl:with-param name="rnGrey" select="false()"/>
          <xsl:with-param name="noLeftBorder" select="true()"/>
        </xsl:call-template>
        <xsl:call-template name="EmptyBoxes">
          <xsl:with-param name="boxLevel" select="$boxLevel - 1"/>
          <xsl:with-param name="rboxWidth" select="$rboxWidth"/>
          <xsl:with-param name="inboxWidth" select="$inboxWidth"/>
          <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
          <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
          <xsl:with-param name="boxHeight" select="$rnboxBlankByLine * $lineHeight"/>
          <xsl:with-param name="bottomMM" select="0"/>
        </xsl:call-template>
      </xsl:if>
      <!-- grey boxes above the actual boxes -->
      <xsl:if test="($rnboxGreyAboveLastLine or $rnboxSingleHeight or $rnboxNumOnLine > 1) and $boxHeight > $lineHeight">
        <xsl:call-template name="RightBoxes">
          <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
          <xsl:with-param name="rvarboxWidth" select="$rvarboxWidth"/>
          <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
          <xsl:with-param name="boxHeight">
            <xsl:choose>
              <xsl:when test="$rnboxNumOnLine">
                <xsl:value-of select="($rnboxNumOnLine - 1) * $lineHeight - ($rnboxBlankByLine * $lineHeight)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$boxHeight - $lineHeight - ($rnboxBlankByLine * $lineHeight)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
          <xsl:with-param name="bottomMM" select="0"/>
          <xsl:with-param name="noInternalLines" select="$noInternalLines or $rnboxSingleHeight"/>
          <xsl:with-param name="bgcolor" select="$bgcolor"/>
          <xsl:with-param name="percentageBox" select="$percentageBox"/>
          <xsl:with-param name="rnGrey" select="$rnboxGreyAboveLastLine or $rnboxNumOnLine"/>
          <xsl:with-param name="noLeftBorder" select="$rnboxSingleHeight"/>
        </xsl:call-template>
        <xsl:call-template name="EmptyBoxes">
          <xsl:with-param name="boxLevel" select="$boxLevel - 1"/>
          <xsl:with-param name="rboxWidth" select="$rboxWidth"/>
          <xsl:with-param name="inboxWidth" select="$inboxWidth"/>
          <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
          <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
          <xsl:with-param name="boxHeight">
            <xsl:choose>
              <xsl:when test="$rnboxNumOnLine">
                <xsl:value-of select="($rnboxNumOnLine - 1) * $lineHeight - ($rnboxBlankByLine * $lineHeight)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$boxHeight - $lineHeight - ($rnboxBlankByLine * $lineHeight)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
          <xsl:with-param name="bottomMM" select="0"/>
        </xsl:call-template>
      </xsl:if>
      <!-- finally, the actual right side boxes -->
      <xsl:call-template name="RightBoxes">
        <xsl:with-param name="num">
          <xsl:choose>
            <xsl:when test="$linenum2">
              <xsl:value-of select="$linenum2"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$linenum1"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="varBoxData">
          <xsl:if test="$displayLineHeights">
            <xsl:value-of select="format-number($desLineHeight,'0.00')"/> | 
          <xsl:value-of select="$boxHeight"/> | </xsl:if>
          <xsl:copy-of select="$dataVal"/>
        </xsl:with-param>
        <xsl:with-param name="cBoxData">
          <xsl:copy-of select="$cboxDataVal"/>
        </xsl:with-param>
        <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
        <xsl:with-param name="rvarboxWidth" select="$rvarboxWidth"/>
        <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
        <xsl:with-param name="boxHeight">
          <xsl:choose>
            <xsl:when test="$rnboxGreyAboveLastLine or $rnboxSingleHeight or $rnboxNumOnLine">
              <xsl:value-of select="$lineHeight"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$boxHeight"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="bottomMM" select="$bottomMM"/>
        <xsl:with-param name="noInternalLines" select="$noInternalLines or ($rboxWidth = 0)"/>
        <xsl:with-param name="bgcolor" select="$bgcolor"/>
        <xsl:with-param name="percentageBox" select="$percentageBox"/>
        <xsl:with-param name="rnGrey" select="$rnboxGrey"/>
        <xsl:with-param name="centerAll" select="$centerAll"/>
        <xsl:with-param name="noLeftBorder" select="$noLeftBorder or ($rboxWidth = 0)"/>
      </xsl:call-template>
      <xsl:call-template name="EmptyBoxes">
        <xsl:with-param name="boxLevel" select="$boxLevel - 1"/>
        <xsl:with-param name="rboxWidth" select="$rboxWidth"/>
        <xsl:with-param name="inboxWidth" select="$inboxWidth"/>
        <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
        <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
        <xsl:with-param name="boxHeight">
          <xsl:choose>
            <xsl:when test="$rnboxGreyAboveLastLine or $rnboxSingleHeight or $rnboxNumOnLine">
              <xsl:value-of select="$lineHeight"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$boxHeight"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="bottomMM" select="$borderWidth * $emptyBoxHasLineUnder"/>
        <xsl:with-param name="bgcolor">
          <xsl:if test="$emptyBoxHasGreyBG">background-color:<xsl:value-of select="$greyColor"/>;</xsl:if>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:if test="$rnboxNumOnLine > 0 and $numTextLines > $rnboxNumOnLine">
        <xsl:call-template name="EmptyBoxes">
          <xsl:with-param name="boxLevel" select="$boxLevel"/>
          <xsl:with-param name="rboxWidth" select="$rboxWidth"/>
          <xsl:with-param name="inboxWidth" select="$inboxWidth"/>
          <xsl:with-param name="rnboxWidth" select="$rnboxWidth"/>
          <xsl:with-param name="rcboxWidth" select="$rcboxWidth"/>
          <xsl:with-param name="boxHeight" select="$lineHeight * ($numTextLines - $rnboxNumOnLine)"/>
          <xsl:with-param name="bottomMM" select="$borderWidth * $emptyBoxHasLineUnder"/>
          <xsl:with-param name="bgcolor">
            <xsl:if test="$emptyBoxHasGreyBG">background-color:<xsl:value-of select="$greyColor"/>;</xsl:if>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- 

    emitDots : Template to produce a string of a specified number of periods 

    -->
  <xsl:template name="emitDots">
    <xsl:param name="numDots"/>
    <xsl:if test="$numDots">.<xsl:call-template name="emitDots">
        <xsl:with-param name="numDots" select="$numDots - 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!--

    PartHeader : Template to produce the header for each Part of the form

    -->
  <xsl:template name="PartHeader">
    <xsl:param name="partNum"/>
    <xsl:param name="text"/>
    <div style="width:{$pageWidth}mm;border-style:solid;border-bottom-width:{$borderWidth}mm;border-top-width:0;
          border-right-width:0;border-left-width:0;float:left;padding-top:0mm;line-height:4.06mm">
      <span class="styPartName" style="width:13mm;padding-bottom:{$borderWidth}mm">Part <xsl:value-of select="$partNum"/>
      </span>
      <span class="styPartDesc" style="width:170mm;font-size:12;font-weight:normal;padding-top:{$borderWidth}mm">
        <span style="width:3mm;font-size:10pt;height:0mm;vertical-align:top;"/>
        <xsl:copy-of select="$text"/>
      </span>
    </div>
  </xsl:template>
  <!-- 

    Table : Template to produce a page-wide table

    -->
  <xsl:template name="Table">
    <xsl:param name="lineType" select="$standardLine"/>
    <xsl:param name="linenum1"/>
    <xsl:param name="colWidths"/>
    <xsl:param name="centsWidths"/>
    <xsl:param name="colHeads"/>
    <xsl:param name="dataVal"/>
    <xsl:param name="leftBoxBlank"/>
    <xsl:param name="linesPerBox" select="2"/>
    <xsl:variable name="columnWidths">
      <xsl:call-template name="MakeWidths">
        <xsl:with-param name="wString">
          <xsl:value-of select="$colWidths"/>:</xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="centsBoxWidths">
      <xsl:call-template name="MakeWidths">
        <xsl:with-param name="wString">
          <xsl:value-of select="$centsWidths"/>:</xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="lnboxWidth" select="exslt:node-set($widths)/rec[@linetype=$lineType]/@lnbox"/>
    <!-- Display the line number and column headers -->
    <div style="width:{$pageWidth + 0.5}mm">
      <div class="styLNLeftNumBox" style="width:{$lnboxWidth}mm;height:12.75mm;border-bottom:{$borderWidth * not($leftBoxBlank)}mm solid;padding-top:2mm">
        <span style="width:{$lnboxWidth div 2 - 0.100001}mm;margin:0;text-align:right">
          <xsl:value-of select="$linenum1"/>
        </span>
        <span style="width:{$lnboxWidth div 2 - 0.100001}mm;margin:0"/>
      </div>
      <xsl:for-each select="exslt:node-set($colHeads)/col">
        <xsl:variable name="pos" select="position() + 1"/>
        <xsl:variable name="cwidth">
          <xsl:choose>
            <xsl:when test="position() = 1">
              <xsl:value-of select="exslt:node-set($columnWidths)/width[2] - $lnboxWidth + exslt:node-set($columnWidths)/width[1]"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$columnWidths/width[$pos]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="OneBox">
          <xsl:with-param name="data">
            <xsl:call-template name="TextLine">
              <xsl:with-param name="text">
                <xsl:copy-of select="line"/>
              </xsl:with-param>
              <xsl:with-param name="nofloat" select="true()"/>
              <xsl:with-param name="overlong" select="child::overlong"/>
              <xsl:with-param name="height" select="3.25"/>
              <xsl:with-param name="width" select="$cwidth"/>
              <xsl:with-param name="center" select="true()"/>
            </xsl:call-template>
          </xsl:with-param>
          <xsl:with-param name="className" select="'sty4972TableHeaderBox'"/>
          <xsl:with-param name="boxWidth" select="$cwidth"/>
          <xsl:with-param name="boxHeight" select="12.75"/>
          <xsl:with-param name="bottomBorder" select="$borderWidth"/>
          <xsl:with-param name="leftBorder">
            <xsl:if test="position()=1">
              <xsl:value-of select="'border-left:0;'"/>
            </xsl:if>
          </xsl:with-param>
          <xsl:with-param name="align" select="'center'"/>
          <xsl:with-param name="posish" select="'relative'"/>
          <xsl:with-param name="padding-top" select="'1.8'"/>
        </xsl:call-template>
      </xsl:for-each>
    </div>
    <!-- Display the row indicator and the values in each cell -->
    <div style="width:{$pageWidth + 0.5}mm">
      <xsl:for-each select="exslt:node-set($dataVal)/row">
        <xsl:call-template name="OneBox">
          <xsl:with-param name="data">
            <xsl:if test="not($leftBoxBlank)">
              <b>
                <xsl:number format="A"/>
              </b>
            </xsl:if>
          </xsl:with-param>
          <xsl:with-param name="align" select="'center'"/>
          <xsl:with-param name="leftBorder" select="'border-left:0;'"/>
          <xsl:with-param name="bottomBorder" select="$borderWidth * not($leftBoxBlank)"/>
          <xsl:with-param name="boxWidth" select="$columnWidths/width[1]"/>
          <xsl:with-param name="boxHeight" select="$lineHeight * $linesPerBox"/>
          <xsl:with-param name="className" select="'sty4972AmountBox'"/>
        </xsl:call-template>
        <xsl:for-each select="val">
          <xsl:variable name="pos" select="position() + 1"/>
          <xsl:call-template name="OneBox">
            <xsl:with-param name="data">
              <xsl:copy-of select="."/>
            </xsl:with-param>
            <xsl:with-param name="className" select="'sty4972AmountBox'"/>
            <xsl:with-param name="leftBorder">
              <xsl:if test="position() = 1 and $leftBoxBlank">border-left:0;</xsl:if>
            </xsl:with-param>
            <xsl:with-param name="boxWidth" select="$columnWidths/width[$pos]"/>
            <xsl:with-param name="boxHeight" select="$lineHeight * $linesPerBox"/>
            <xsl:with-param name="bottomBorder" select="$borderWidth"/>
            <xsl:with-param name="align">
              <xsl:choose>
                <xsl:when test="@align">
                  <xsl:value-of select="@align"/>
                </xsl:when>
                <xsl:otherwise>right</xsl:otherwise>
              </xsl:choose>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:for-each>
    </div>
  </xsl:template>
  <!-- 

    MakeWidths : Template to produce a temporary document with a list of width elements for table columns 

    -->
  <xsl:template name="MakeWidths">
    <xsl:param name="wString"/>
    <xsl:if test="$wString">
      <width>
        <xsl:value-of select="substring-before($wString, ':')"/>
      </width>
      <xsl:call-template name="MakeWidths">
        <xsl:with-param name="wString" select="substring-after($wString, ':')"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!-- 

    makeCurlyBrace : Template to produce a large curly brace 

    -->
  <xsl:template name="makeCurlyBrace">
    <xsl:param name="pstring"/>
    <xsl:param name="spanWidth"/>
    <xsl:param name="absLeft" select="0"/>
    <xsl:variable name="imgSrc" select="substring-before(substring-after($pstring, 'img:'), ';')"/>
    <xsl:variable name="wid" select="substring-before($imgSrc, 'x')"/>
    <xsl:variable name="hgt" select="substring-after($imgSrc, 'x')"/>
    <xsl:variable name="spaceAbove" select="substring-after($pstring, 'space-above:')"/>
    <span style="width:{$spanWidth}mm;height:{$hgt}mm;text-align:center;position:absolute;top:{$spaceAbove};left:{$absLeft}mm">
      <img alt="" src="{$ImagePath}/CurlyBrace{$imgSrc}mm.png" style="width:{$wid}mm;height:{$hgt}mm"/>
    </span>
  </xsl:template>
  <!--

    MakeYNCheckBox : Template to produce either a Yes checkbox or a No checkbox

    -->
  <xsl:template name="MakeYNCheckBox">
    <xsl:param name="isYes" select="false()"/>
    <xsl:param name="TargetNode"/>
    <xsl:param name="BackupName"/>
    <xsl:param name="spanStyle"/>
    <span>
      <xsl:call-template name="PopulateSpan">
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
      <xsl:if test="$spanStyle">
        <xsl:attribute name="style"><xsl:value-of select="$spanStyle"/></xsl:attribute>
      </xsl:if>
      <input type="checkbox" class="sty4972Ckbox" name="Checkbox">
        <xsl:choose>
          <xsl:when test="$isYes">
            <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
              <xsl:with-param name="BackupName" select="$BackupName"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PopulateNoCheckbox">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
              <xsl:with-param name="BackupName" select="$BackupName"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </input>
    </span>
    <label>
      <xsl:choose>
        <xsl:when test="$isYes">
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
            <xsl:with-param name="BackupName" select="$BackupName"/>
          </xsl:call-template>
          <b>Yes.</b>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
            <xsl:with-param name="BackupName" select="$BackupName"/>
          </xsl:call-template>
          <b>No.</b>
        </xsl:otherwise>
      </xsl:choose>
    </label>
  </xsl:template>
  <!--

    MakeBlankLines : Template to wrap a given value in <line></line> tags, and
                     to append additional empty <line/> tags as needed.

    -->
  <xsl:template name="MakeBlankLines">
    <xsl:param name="text"/>
    <xsl:param name="numLines" select="1"/>
    <line>
      <xsl:copy-of select="$text"/>
    </line>
    <xsl:if test="$numLines > 1">
      <xsl:call-template name="MakeBlankLines">
        <xsl:with-param name="numLines" select="$numLines - 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!--

    MakeLNBox : Template to populate a narrow box with the correct positioning to match the descriptive
                lines of text planned for the next column.  Supports two positions for line "numbers",
                one slightly left of center, the other slightly right.  (Typically used for lines like "10a",
                where the 1's places of all lines need to line up, and the a-b-c's need to line up.)

    -->
  <xsl:template name="MakeLNBox">
    <xsl:param name="lnboxWidth"/>
    <xsl:param name="linenum1"/>
    <xsl:param name="lnalpha"/>
    <xsl:param name="numTextLines"/>
    <xsl:param name="fullHeight"/>
    <xsl:param name="desLineHeight"/>
    <xsl:param name="bottomMM"/>
    <xsl:param name="verticalOffset"/>
    <xsl:param name="bgcskyblue"/>
    <xsl:param name="bottomBorder"/>
    <div class="styLNLeftNumBox" style="width:{$lnboxWidth}mm;height:{$fullHeight}mm;line-height:{$desLineHeight}mm;position:relative;{$bottomBorder}{$bgcskyblue}">
      <!-- for some reason two 5mm spans wrap in the printed output, so we have to fudge the actual width by
             a small amount to get the '5' and the 'a' onto the same line in the printed output -->
      <xsl:variable name="halfWidth" select="$lnboxWidth div 2 - 0.100001"/>
      <span style="width:{$halfWidth}mm;position:absolute;bottom:{$bottomMM + $verticalOffset}mm;left:0mm;text-align:right">
        <xsl:call-template name="TextLine">
          <xsl:with-param name="text">
            <xsl:call-template name="MakeBlankLines">
              <xsl:with-param name="text" select="$linenum1"/>
              <xsl:with-param name="numLines" select="$numTextLines"/>
            </xsl:call-template>
          </xsl:with-param>
          <xsl:with-param name="height" select="$desLineHeight"/>
          <xsl:with-param name="width" select="$halfWidth"/>
          <xsl:with-param name="nofloat" select="true()"/>
          <xsl:with-param name="absRight" select="true()"/>
        </xsl:call-template>
      </span>
      <span style="width:{$halfWidth}mm;position:absolute;bottom:{$bottomMM + $verticalOffset}mm;left:{$halfWidth}mm">
        <xsl:call-template name="TextLine">
          <xsl:with-param name="text">
            <xsl:call-template name="MakeBlankLines">
              <xsl:with-param name="text" select="$lnalpha"/>
              <xsl:with-param name="numLines" select="$numTextLines"/>
            </xsl:call-template>
          </xsl:with-param>
          <xsl:with-param name="height" select="$desLineHeight"/>
          <xsl:with-param name="width" select="$halfWidth"/>
          <xsl:with-param name="nofloat" select="true()"/>
        </xsl:call-template>
      </span>
    </div>
  </xsl:template>
  <!--

    CalcDesLineHeight : Template to extract the calculation of the desired line-height for use
                        in multiple templates.  
      Relies on two global variables:
        $lineHeight  : defines the standard spacing for the page, typically 4.2mm (21 / 5)
        $borderWidth : defines the width of the typical "1px" lines separating elements on the form
      Both of these variables are defined with default values in this file, but are expected to be
      overridden by definitions with higher import priority in the calling template.

    -->
  <xsl:template name="CalcDesLineHeight">
    <xsl:param name="numTextLines"/>
    <xsl:param name="noBottomLine"/>
    <xsl:value-of select="($lineHeight * $numTextLines - $borderWidth - $borderWidth * not($noBottomLine)) div $numTextLines"/>
  </xsl:template>
</xsl:stylesheet>
