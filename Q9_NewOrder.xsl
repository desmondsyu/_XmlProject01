<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="/orders">
    <html>
      <head>
        <style>
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
          }
          th {
            background-color: #f2f2f2;
          }
          .not-available {
            background-color: #ffcccc;
          }
        </style>
      </head>
      <body>
        <h1>Order Information</h1>
        <table>
          <tr>
            <th>Order ID</th>
            <th>Customer Name</th>
            <th>Email</th>
            <th>Status</th>
            <th>Shipping Cost</th>
          </tr>
          <xsl:apply-templates select="order"/>
        </table>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="order">
    <tr>
      <td><xsl:value-of select="@oid"/></td>
      <td><xsl:value-of select="customerInfo/customerName"/></td>
      <td><xsl:value-of select="customerInfo/email"/></td>
      <td><xsl:value-of select="status"/></td>
      <td>
        <xsl:choose>
          <xsl:when test="shipping">
            <xsl:value-of select="shipping"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>Shipping cost not specified</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </td>
    </tr>
    <tr>
      <td colspan="5">
        <table>
          <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Status</th>
          </tr>
          <xsl:apply-templates select="item">
            <xsl:sort select="name"/>
          </xsl:apply-templates>
        </table>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template match="item">
    <tr>
      <td><xsl:value-of select="@itemid"/></td>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="price"/></td>
      <td><xsl:value-of select="qty"/></td>
      <td>
        <xsl:if test="@instock='N'">
          <xsl:text>Not Available</xsl:text>
        </xsl:if>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
