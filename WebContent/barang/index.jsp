<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="com.frexesc.model.BarangBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../header.jsp" />
<script src="../js/ajaxShop.js"></script>
<title>Gallery</title>

<script type="text/javascript">
	var run = false;
	function fitbarang(obj) {
		fitimg(obj, 180, 175, true, true, false);
	}
	function backToPict(id) {
		if (!run) {
			var x, y, vara, varb, varc, vard;
			vara = 0;
			varb = 0;
			for (x = 0; x <= 11; x++) {
				setTimeout(
						function() {
							if (x == 0)
								run = true;
							document.getElementById('cart' + id).style.opacity = 1 - (0.1 * vara);
							if (vara == 10)
								addClass(document.getElementById('cart' + id),
										" hidden");
							vara++;
							console.log(x + ' : cart' + id);
						}, (50 * (varb + 1)));
				varb++;
			}
			setTimeout(
					function() {
						varc = 0;
						vard = 0;
						for (y = 0; y <= 11; y++) {
							setTimeout(
									function() {
										if (varc == 0)
											removeClass(
													document
															.getElementById('item'
																	+ id),
													"hidden");
										document.getElementById('item' + id).style.opacity = 0.1 * varc;
										varc++;
										console.log(y + ' : item' + id);
										if (varc == 11)
											run = false;
									}, (120 + (50 * (vard + 1))));
							vard++;
						}
					}, 600);
		}
	}
	function goToCart(id) {
		if (!run) {
			var x, y, vara, varb, varc, vard;
			vara = 0;
			varb = 0;
			for (x = 0; x <= 11; x++) {
				setTimeout(
						function() {
							if (vara == 0)
								run = true;
							document.getElementById('item' + id).style.opacity = 1 - (0.1 * vara);
							if (vara == 10)
								addClass(document.getElementById('item' + id),
										" hidden");
							vara++;
							console.log(x + ' : item' + id);
						}, (50 * (varb + 1)));
				varb++;
			}
			setTimeout(
					function() {
						varc = 0;
						vard = 0;
						for (y = 0; y <= 11; y++) {
							setTimeout(
									function() {
										if (varc == 0)
											removeClass(
													document
															.getElementById('cart'
																	+ id),
													"hidden");
										document.getElementById('cart' + id).style.opacity = 0.1 * varc;
										varc++;
										console.log(y + ' : cart' + id);
										if (varc == 11)
											run = false;
									}, (120 + (50 * (vard + 1))));
							vard++;
						}
					}, 600);
		}
	}
</script>

</head>
<body>
	<jsp:include page="../layout.jsp" />
	<%
		@SuppressWarnings("unchecked")
		ArrayList<BarangBean> barangBean = (ArrayList<BarangBean>) request
				.getAttribute("items");
	%>
	<%
		if (barangBean == null)
			barangBean = new ArrayList<BarangBean>();
	%>
	
	<div class='header_divider'>
		<% if (request.getAttribute("category_name") == null ) { %>
		<h1 class='header'>All Categories</h1>
		<% } else { %>
		<h1 class='header'><%= request.getAttribute("category_name") %></h1>
		<% } %>
	</div>
	
		<%
			String previous = "";
			String previous2 = "";
			if (request.getParameter("sort") != null) {
				previous = "&sort=" + request.getParameter("sort");
			}
			if (request.getParameter("jenisSort") != null) {
				previous = previous + "&jenisSort=" + request.getParameter("jenisSort");
			}
			if (request.getParameter("name") != null) {
				previous = previous + "&name=" + request.getParameter("name");
				previous2 = "&name=" + request.getParameter("name");
			}
			if (request.getParameter("category") != null) {
				previous = previous + "&category=" + request.getParameter("category");
				previous2 = previous2 + "&category=" + request.getParameter("category");
			}
			if (request.getParameter("price") != null) {
				previous = previous + "&price=" + request.getParameter("price");
				previous2 = previous2 + "&price=" + request.getParameter("price");
			}
		%>
	
	Sort By: <br />
	Nama : (<a href="?sort=1&jenisSort=1<%= previous2 %>">ASC</a>,<a href="?sort=1&jenisSort=2<%= previous2 %>">DESC</a>) <br />
	Kategori : (<a href="?sort=2&jenisSort=1<%= previous2 %>">ASC</a>,<a href="?sort=2&jenisSort=2<%= previous2 %>">DESC</a>) <br />
	Harga : (<a href="?sort=3&jenisSort=1<%= previous2 %>">ASC</a>,<a href="?sort=3&jenisSort=2<%= previous2 %>">DESC</a>) <br />

	<table cellpadding="0" cellspacing="1">
		<tr bgcolor="blue">
			<td width="150" align="center">Nama Barang</td>
			<td style="table-layout: fixed; width: 200px;" align="center">Gambar
				Barang</td>
			<td width="100" align="center">Harga</td>
			<td width="100" align="center">Stok</td>
			<td width="100" align="center">Jumlah Beli</td>
			<td width="100" align="center">Aksi</td>
		</tr>
		<%
			for (int i = 0; i < barangBean.size(); i++) {
		%>
		<%
			BarangBean b = barangBean.get(i);
		%>
		<tr>
			<td align="center"><a href="./detail?id=<%=b.getId()%>"><%=b.getName()%></a>
			</td>
			<td align="center" style="table-layout: fixed; width: 200px;">
				<center>
					<img src="../img/barang/<%=b.getPicture()%>" width="20%"
						height="20%">
				</center>
			</td>
			<td align="center"><%=b.getPrice()%></td>
			<td align="center"><div id="jumlah_barang_<%=b.getId()%>"><%=b.getTotal_item()%></div></td>
			<td align="center"><input type="text" name="qty" size="8"
				id="qty_<%=b.getId()%>" value="0">
			<input type="hidden" name="deskripsi_tambahan" id="deskripsi_tambahan">
			</td>
			<td align="center"><input class="button" type="button" value="Tambah ke Cart"
				id="beli"
				onClick="onAddToCart('http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/barang/addCart', <%=b.getId()%> ); return false;"></td>
		</tr>
		<%
			}
		%>
	</table>
		<%
			for (int i = 0; i < Math.round(Math.ceil(Double.parseDouble((String) request.getAttribute("total_pages")) / 10)); i++) {
		%>
			<a href="?page=<%= i+1 %><%= previous %>"><%= i+1 %> </a>
		<%
			}
		%>
	<br />
	Klik <a href="./cart">disini</a> untuk masuk ke shopping cart <br />
	<jsp:include page="../footer.jsp" />
</body>
</html>