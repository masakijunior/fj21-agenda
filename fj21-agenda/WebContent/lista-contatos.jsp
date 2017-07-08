<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL forEach</title>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<c:import url="cabecalho.jsp" />

	<!-- cria o DAO -->
	
<%--	<jsp:useBean id="dao" class="br.com.caelum.agenda.dao.ContatoDao" /> --%>

	<table border="1">
		<th>Nome</th>
		<th>Email</th>
		<th>Endereço</th>
		<th>Data de nascimento</th>

		<!-- percorre contatos montando as linhas da tabela -->
		<c:forEach var="contato" items="${contatos}" varStatus="id">
			<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }">
				<td>${contato.nome}</td>				
				<td>									
<%-- 				<c:if test="${not empty contato.email}"> --%>
<%-- 				<a href="mailto:${contato.email}">${contato.email}</a>				 --%>
<%-- 				</c:if>				 --%>
<%-- 				<c:if test="${empty contato.email}"> --%>
<!-- 				E-mail não informado -->
<%-- 				</c:if> --%>				
				<c:choose>
				<c:when test="${not empty contato.email}">				
				<a href="mailto:${contato.email}">${contato.email}</a>
				</c:when>
				<c:otherwise>
				E-mail não informado.
				</c:otherwise>
				</c:choose>											
				</td>
				<td>${contato.endereco}</td>
				<td>				
				<fmt:formatDate value="${contato.dataNascimento.time}" pattern="dd/MM/yyyy" />				
<%-- 				<td>${contato.dataNascimento.time}</td> --%>
				</td>
				<td>			
				<a href="mvc?logica=RemoveContatoLogic&id=${contato.id}">Remover</a>
				</td>							
			</tr>
		</c:forEach>
	</table>
	
	<c:import url="rodape.jsp" />
		
</body>
</html>