<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="orders">
    <html>
      <head>
      <!--CSS style for the table-->
        <style>
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h2>Order Details</h2>
        <table>
          <tr>
            <th>Order ID</th>
            <th>Customer Name</th>
            <th>Email</th>
            <th>Status</th>
            <th>Item Name</th>
            <th>Price</th>
            <th>Quantity</th>
          </tr>
          <!-- Applying the template to each order -->
          <xsl:apply-templates select="order"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <!-- Matching each order element -->
  <xsl:template match="order">
    <xsl:variable name="currentOrder" select="."/>
    <xsl:apply-templates select="item">
      <xsl:with-param name="oid" select="@oid"/>
      <xsl:with-param name="customerName" select="customerInfo/customerName"/>
      <xsl:with-param name="email" select="customerInfo/email"/>
      <xsl:with-param name="status" select="status"/>
    </xsl:apply-templates>
  </xsl:template>

  <!-- Match eaching item within an order -->
  <xsl:template match="item">
    <xsl:param name="oid"/>
    <xsl:param name="customerName"/>
    <xsl:param name="email"/>
    <xsl:param name="status"/>
    <tr>
      <td><xsl:value-of select="$oid"/></td>
      <td><xsl:value-of select="$customerName"/></td>
      <td><xsl:value-of select="$email"/></td>
      <td><xsl:value-of select="$status"/></td>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="price"/></td>
      <td><xsl:value-of select="qty"/></td>
      <td><xsl:value-of select="../shipping_details"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
