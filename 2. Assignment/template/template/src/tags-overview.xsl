<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html"/>
    <xsl:template match="art">
        <html>
            <head>
                <title>Art - Tags Overview</title>
                <style>
                    body {
                    font-family: Verdana, sans-serif;
                    }
                    table {
                    font-family: Verdana, sans-serif;
                    border-collapse: collapse;
                    width: 31em;
                    }

                    td, th {
                    border: 1px solid #080808;
                    padding: 8px;
                    vertical-align: top;
                    }

                    tr:hover {background-color: #fdf3fd;}

                    th {
                    padding-top: 2px;
                    padding-bottom: 2px;
                    text-align: center;
                    background-color: #6c3b6c;
                    color: white;
                    }
                </style>
            </head>
            <body>
                <h1>Tags Overview</h1>
                <hr/>
                <xsl:apply-templates select="//tag[@tagname]"/>
            </body>
        </html>
    </xsl:template>

    <!-- Main Layout for Tag's -->
    <xsl:template match="tag">

        <h2>
            <xsl:value-of select="@tagname"/>
        </h2>
        <b>
            <xsl:text>Description:</xsl:text>
        </b>
        <br/>
        <xsl:if test=". != ''">
            <xsl:value-of select="."/>
        </xsl:if>
        <br/>
        <br/>
        Below is a list of all Artists or Exhibitions tagged with <xsl:value-of select="@tagname"/>, either directly, or indirectly via association from their creators or creations.
        <br/>

        <xsl:if test="normalize-space(.) = ''">
            <xsl:text>"No further information on </xsl:text><xsl:value-of select="@tagname"/>
        </xsl:if>

        <table>
            <tbody>
                <tr>

                    <xsl:call-template name="info">
                        <xsl:with-param name="mode" select="'artist'"/>
                        <xsl:with-param name="tagname" select="@tagname"/>
                    </xsl:call-template>

                    <xsl:call-template name="info">
                        <xsl:with-param name="mode" select="'objects'"/>
                        <xsl:with-param name="tagname" select="@tagname"/>
                    </xsl:call-template>

                </tr>
            </tbody>
        </table>

        <hr/>

    </xsl:template>

    <!-- Layout for one Artist -->
    <xsl:template match="artist">
        <xsl:value-of select="name"/>
        <xsl:text> ( </xsl:text>
        <xsl:value-of select="lived/@from"/>

        <xsl:if test="lived/@to">
            <xsl:text> to </xsl:text>
            <xsl:value-of select="lived/@to"/>
        </xsl:if>

        <xsl:text>, born in </xsl:text>
        <xsl:value-of select="lived/@birthplace"/>
        <xsl:text> )</xsl:text>
    </xsl:template>

    <!-- Layout for one Exhibition -->
    <xsl:template match="object">

        <xsl:variable name="artist">
            <xsl:value-of select="label/by"/>
        </xsl:variable>

        <tr>
            <td>
                <b>
                    <xsl:text>Title: </xsl:text>
                </b>
                <xsl:value-of select="title"/>
                <xsl:text>, </xsl:text>
                <b>
                    <xsl:text>Type: </xsl:text>
                </b>
                <xsl:value-of select="upper-case(name(kind/child::*[1]))"/>
                <br/>
                <br/>
                <b>
                    <xsl:text>Label: </xsl:text>
                </b>
                <br/>
                <i>
                    <xsl:value-of select="label"/>
                </i>
                <br/>
                <br/>
                <b>
                    <xsl:text>Created by: </xsl:text>
                </b>
                <ul>
                    <li>
                        <xsl:choose>
                            <xsl:when test="//artists//name = label/by">
                                <xsl:apply-templates select="//artist[name = $artist]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="label/by"/>
                                <xsl:text> (Unregistered Artist)</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </li>
                </ul>
            </td>
        </tr>
    </xsl:template>

    <!-- Template for Artists and Exhibitions Column -->
    <xsl:template name="info">

        <xsl:param name="mode"/>
        <xsl:param name="tagname"/>

        <xsl:if test="$mode = 'artist'">
            <xsl:if test="(//artists//t = $tagname) or ( //objects//t = $tagname and //objects//by = artists/artist/name )">
                <td>
                    <table>
                        <thead>
                            <th><h3>Artists</h3></th>
                        </thead>

                        <tbody>
                        <xsl:for-each
                                select="//artist[.//t = $tagname or (//objects//t = $tagname and .//by = //artists//name)]">
                            <xsl:sort select="name"/>
                            <tr>
                                <td>
                                    <xsl:apply-templates select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>

                        <td>
                            <b>
                                <xsl:text>
                                    Found:
                                </xsl:text>
                            </b>
                            <xsl:value-of
                                    select="count(//artists[.//t = $tagname or (//objects//t = $tagname and .//by = //artists//name)])"/>
                            <xsl:text> Artist(s)</xsl:text>
                        </td>
                        </tbody>
                    </table>
                </td>
            </xsl:if>
        </xsl:if>

        <xsl:if test="not($mode) or not($mode = 'artist')">
            <xsl:if test="(//objects//t = $tagname) or (//artists//t = $tagname and //artists//name = //objects//by)">
                <td>
                    <table>
                        <thead>
                            <th>
                                <h3>Exhibition</h3>
                            </th>
                        </thead>

                        <tbody>

                        <xsl:for-each
                                select="//object[.//t = $tagname or //artists//t = $tagname and //artists//name = .//by]">
                            <xsl:sort select="label/year[1]"/>
                            <xsl:apply-templates select="."/>
                        </xsl:for-each>
                        <td>

                            <b>
                                <xsl:text>Found: </xsl:text>
                            </b>

                            <xsl:value-of
                                    select="count(//object[.//t = $tagname or //artists//t = $tagname and //artists//name = .//by])"/>
                            <xsl:text> Exhibition(s)</xsl:text>

                        </td>
                        </tbody>
                    </table>
                </td>
            </xsl:if>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
