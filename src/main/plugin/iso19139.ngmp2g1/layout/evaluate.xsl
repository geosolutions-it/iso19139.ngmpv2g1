<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gts="http://www.isotc211.org/2005/gts"
                xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmx="http://www.isotc211.org/2005/gmx"
                xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:gn="http://www.fao.org/geonetwork"
                xmlns:saxon="http://saxon.sf.net/" extension-element-prefixes="saxon"
                exclude-result-prefixes="#all">

  <xsl:import href="../../iso19139/layout/evaluate.xsl"/>

  <!-- The following templates usually delegates all to iso19139. -->
  <xsl:template name="evaluate-iso19139.ngmp2g1">
    <xsl:param name="base" as="node()"/>
    <xsl:param name="in"/>

    <xsl:call-template name="evaluate-iso19139">
      <xsl:with-param name="base" select="$base"/>
      <xsl:with-param name="in" select="$in"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="evaluate-iso19139.ngmp2g1-boolean">
  <xsl:param name="base" as="node()"/>
  <xsl:param name="in"/>

  <xsl:call-template name="evaluate-iso19139-boolean">
    <xsl:with-param name="base" select="$base"/>
    <xsl:with-param name="in" select="$in"/>
  </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>