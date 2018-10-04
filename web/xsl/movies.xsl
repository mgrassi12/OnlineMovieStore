<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:nsm="http://www.uts.edu.au/31284/oms">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>      
            <head>
                <link rel="stylesheet" href="blockbuster.css" type="text/css"></link>
            </head>     
            <body>
                <h1>Movies</h1>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="nsm:movies" >
        <table width = "100%">
            <thead>
                <tr>
                    <th></th>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Release Date</th>
                    <th>Price</th>
                    <th>Available Copies</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates />
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="nsm:movie">
        <tr>
            <td>
                <input type="radio" name="selectedmovie"/>
            </td>
            <td>
                <xsl:value-of select="nsm:title"/>
            </td>
            <td>
                <xsl:value-of select="nsm:genre"/>
            </td>
            <td>
                <xsl:value-of select="nsm:releasedate" />
            </td>
             <td>
                <xsl:value-of select="nsm:price" />
            </td>
            <td>
                <xsl:value-of select="nsm:availablecopies" />
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>