var option_del = function (option){
	$(option).find('.option-remove').click();
}
var option_undel = function (option){
	$(option).parents()[0].style.display=""
	$(option).children().eq(2).children().eq(0).val(false);;
}
var set_option_value = function(option,value){
	$(option).children().find('.option-field').val(value);
}
var lock_option = function(option){
	$(option).find('.option-field').prop("disabled","disabled");
}
var unlock_option = function(option){
	$(option).find('.option-field').removeAttr("disabled");
}
var unlock_button=function(button){
  button.removeAttr("disabled");
}
var lock_button = function(button){
  button.attr("disabled","disabled");
}
$(document).on('click', '.submit', function() {
	$.each($(".option"), function(index, option){
  		unlock_option(option);
  	});
})
$(document).on('click', '.check_box', function() {
	question = $(this).parents('.fields')[1];
	qtype = $(question).children().find('.qtype');
	if(qtype.val() == "MCQ" || qtype.val() == "True False") {
		check_boxes = $(question).children().find('.check_box')
		check_boxes.each(function() {
			$(this).prop("checked", false);
		})
		$(this).prop("checked", true);
	}
})
$(document).on('focusin', '.qtype', function(){
  $(this).data('val', $(this).val());
})
$(document).on('change', '.qtype', function(){
	var button=$(this).parent().parent().parent().parent().parent().find('.add');
	var prev = $(this).data('val');
  var current = $(this).val();
  var options = $(this).parents('.question').find('.option');
  	$.each(options, function(index, option){
  		option_del(option);
  	});
  if(prev=='True False'){
  	unlock_option(options[0]);
  	unlock_option(options[1]);
    unlock_button(button);
  }
  if(current=='True False'){
  	option_undel(options[0]);
  	option_undel(options[1]);
  	set_option_value(options[0],"True");
  	set_option_value(options[1],"False");
  	lock_option(options[0]);
  	lock_option(options[1]);
  	lock_button(button);
  }
  if(current=='MCQ'||current=='MAQ'){
  	if(prev=='True False'){
  		var count=$(this).parent().parent().parent().parent().parent().find('.option').length
  		for (var i=0;i<4-count;i++)button.click();
  	}
  	$.each(options,function(index,option){
  		option_undel(option);
  	})
  	set_option_value(options[0],$(options[0]).find('.option-field').eq(0).data('val'))
  	set_option_value(options[1],$(options[1]).find('.option-field').eq(0).data('val'))
  }
	$(this).data('val',$(this).val());
})
$(document).on('change', '.option-field', function(){
	current=$(this).parents('.fields').find('.qtype').eq(0).val();
	if(current=="MAQ"||current=="MCQ"){
		$(this).data('val',$(this).val());
	}
})
$(".question").ready(function(){
  $.each($(document).find('.option-field'),function(key,option){
  var button=$(this).parent().parent().parent().parent().find('.add');
  var qtype= $(this).parent().parent().parent().parent().find('.qtype').val();
   if(qtype!="True False")
    $(option).data('val',$(this).val());
   else {
    $(option).data('val',"");
    button.hide();
    }
  })
})
$(document).on('nested:fieldAdded:questions', function(event){
	var field = event.field;
	var add=field.find(".add");
	for (var i=0;i<4;i++)add.click();
})