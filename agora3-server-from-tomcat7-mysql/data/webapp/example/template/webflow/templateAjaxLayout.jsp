<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<table style="border:none;" cellpadding="0" cellspacing="0" width="100%" >
	<tbody>
		<tr>
			<td>
				<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
					  <tr>
					    <td class="titulo1"><tiles:getAsString name="titulo-wizard" /></td>
					  </tr>
					  <tr>
					    <td class="titulo2"><tiles:getAsString name="titulo-ecra" /></td>
					  </tr>
					</tbody>
				</table>					
			</td>
		</tr>
		<tr>
			<td>
				<tiles:get name="body" flush="false" />
			</td>
		</tr>
	</tbody>
</table>