/**
 * 
 */
$(document).ready(function() { 
	CKEDITOR.replace('CONTENT');
}); 


$('input[type=radio][name=pwdch]').on('click', function(){
		var pwdValue = $('input:radio[name="pwdch"]:checked').val();
	
	if(pwdValue == "lock"){
		$("#ak").show();
	} else{
		$("#ak").hide();
	}
});