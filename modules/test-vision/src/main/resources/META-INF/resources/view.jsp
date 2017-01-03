<%@ include file="/init.jsp" %>

<portlet:actionURL var="testVisionActionURL" name="processAction"/>

<aui:form name="fm_validate_vision" method="post"  action="<%=testVisionActionURL.toString()%>">
	<aui:input name="campoUnico" type="text" value="" label="Campo Prueba">
		<aui:validator name="required" />
	</aui:input>
    <aui:button class="btn pull-right" name="nextStep" type="button" value="Probar" onclick="validateVisionForm();" /> 
</aui:form>
	
<aui:script use="liferay-form,aui-form-validator">
var form = Liferay.Form.get('<portlet:namespace />fm_validate_vision');
console.log('validateVisionForm form ' + form);
var formValidator = form.formValidator;
Liferay.provide(window, 'validateVisionForm', function() {
	console.log('validateVisionForm');
	console.log('validateVisionForm formValidator ' + formValidator);
	formValidator.validate();
	var hasError = formValidator.hasErrors();
	console.log('validateVisionForm hasError ' + hasError);
	if (!hasError) {
			A.one('#<portlet:namespace/>fm_validate_vision').submit();
			console.log('prueba Exitosa!');
	}
});


</aui:script>