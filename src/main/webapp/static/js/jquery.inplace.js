/**
* Jquery Inplace Editor v3
* by Tibor Karcsics
* email: mycroft84gmail.com
* 
* Useage: The first class elemet will be the input name.
* With: Input:text
* 		Input:checkbox
* 		Textarea
* 		Select
* 		Select - Multiple -> only focusOut event
*/
    
;(function($){
	
	//get classList
	function getClassList(target)
   	{
		return target.attr('class').split(/\s+/);
   	}
   	
   	//IE Fix - trim() method add
   	if(typeof String.prototype.trim !== 'function') {
 		 String.prototype.trim = function() {
    	 return this.replace(/^\s+|\s+$/g, ''); 
	  }
	}
	
	 var methods = {
	    init : function( options ) {
		
		var defaults =   {
		   inputClass: 'inplace',
		   selectClass: 'inplace-select',
		   textareaClass: 'inplace-textarea',
		   checkboxClass: 'inplace-checkbox',
		   checkboxTrue: 'True',
		   checkboxFalse: 'False',
		   titleMessage: 'Click to edit...',
		   submitMessage: 'Blur or enter to submit...',
		   before: function(data){},
		   callback: function(data){}
   	   }
   	   
   	   var opts = $.extend(defaults, options);
   	   
   	   return $(this).each(function(){
   		   $this = $(this);
   		   var o = $.meta ? $.extend({}, opts, $this.data()) : opts;
   		   var classList = getClassList($this);
   		   var className = classList[0];
   		   
   		   $('.'+className).data('inplace',{
			   target: $this,
			   options: o
			});
		   $this.inplace('destroy');
		   
			$this.css({
					'cursor':'pointer'
			});
			
			$(this).attr('title',o.titleMessage);
			if (!$(this).hasClass(o.selectClass))
			{
				var text = ($(this).find('.'+o.inputClass+'-content').length == 0) ? $(this).html() : $(this).find('.'+o.inputClass+'-content').html();
				var value = text;
				if ($(this).hasClass(o.checkboxClass))
				{
					value = (text == o.checkboxTrue) ? 'true' : 'false';
				}
				$(this).html("<div class='"+o.inputClass+"-content'>"+text+"</div><input type='hidden' class='"+o.inputClass+"-hidden' name='"+className+"' value='"+value+"'></input>");
				$(this).find("."+o.inputClass+"-content").css({
					'max-height': '200px',
					'min-height': '15px',
					'overflow': 'auto'					
				});
			}
			
			if ($(this).hasClass(o.selectClass))
			{
				if ($(this).find('.'+o.inputClass+'-content').length != 0)
				{
				   var select =  $(this).find("."+o.inputClass+"-selectdata > select");
				   $(this).find('.'+o.inputClass+'-content').remove();
				   $(this).find('.'+o.inputClass+'-hidden').remove();
				   $(this).find('.'+o.inputClass+'-selectdata').remove();
				   $(this).html(select);
				}
				
				var select = $(this).find('select');
				var options = select.find('option:selected');
				if (options.length != 0)
				{
					var text_array = new Array();
					var value_array = new Array();
					$.each(options,function(index,value){
						text_array.push($(value).text());
						value_array.push($(value).val());
					});
					
					var text = text_array.join('<br>');
					var value = value_array.join(',');
					
				} else {
					var text = select.find('option:first').text();
					var value = select.find('option:first').val();
				}
				var clone = select.clone();
				select.remove();
				var row = "<div class='"+o.inputClass+"-content'>"+text+"</div>";
				row+= "<input type='hidden' class='"+o.inputClass+"-hidden' name='"+className+"' value='"+value+"'>";
				row+= "<span class='"+o.inputClass+"-selectdata' style='display:none'></span>";
				$(this).html(row);
				$(this).find("."+o.inputClass+"-content").css({
					'max-height': '200px',
					'min-height': '15px',
					'overflow': 'auto'					
				});
				$(this).find("."+o.inputClass+"-selectdata").html(clone);
			}
				
			$this.click(function(event){
				$(this).attr('title',o.submitMessage);
				var classList = getClassList($(this));
				var className = classList[0];
				var content = $(this).find("."+o.inputClass+"-content");
				var text = content.html();
				var value = $(this).find("."+o.inputClass+"-hidden").val();
				
				if ($(this).find('.'+o.inputClass+'-content input, .'+o.inputClass+'-content select, .'+o.inputClass+'-content textarea').length == 0)
				{
					var itemData = $('.'+className).data('inplace');
					itemData.oldValue = value;
					itemData.oldText = text;
					$('.'+className).data('inplace',itemData);
				}
				
				
				if ($(this).find("."+o.inputClass+"-input").length == 0)
				{
					
					if (!$(this).hasClass(o.textareaClass) && !$(this).hasClass(o.selectClass) && !$(this).hasClass(o.checkboxClass))
					{
						content.html("<input type='text' class='"+o.inputClass+"-input' id='"+className+"' value='"+text+"'></input>");
						content.find('input').css({'margin':'0','padding':'0'}).focus().select();
						
						
					}
					
					if ($(this).hasClass(o.textareaClass))
					{
						content.html("<textarea class='"+o.inputClass+"-input' id='"+className+"'>"+text.replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/\&lt\;br\&gt\;/g,'\n')+"</textarea>");
						content.find('textarea').css({'margin':'0','padding':'0','background-color':'white','width':200,'height':100}).focus().select();
						
					}
					
					if ($(this).hasClass(o.selectClass))
					{
						var select = $(this).find("."+o.inputClass+"-selectdata > select");
						content.html(select.clone().show().addClass(o.inputClass+"-input").attr('id',className));
						content.find("option").attr('selected',false);
						$.each(value.split(','),function(index,o_value){
							content.find("option[value='"+o_value+"']").attr('selected',true);	
						})
						content.find('select').css({'margin':'0','padding':'0'}).focus();
						
					}
					
					if ($(this).hasClass(o.checkboxClass))
					{										
						content.html("<input type='checkbox' class='"+o.inputClass+"-input' value='"+text+"' id='"+className+"'></input>");
						if (text == o.checkboxTrue) content.find("input[type='checkbox']").prop('checked','checked');
						else content.find("input[type='checkbox']").prop('checked','');
						content.find("input[type='checkbox']").focus();
						
					}
										
					data = {'item':$(this).find("."+o.inputClass+"-input")};
					o.before.call(this,data);
				}
				else
				{
										
					data = {'item':$(this).find("."+o.inputClass+"-input")};
					o.before.call(this,data);
				}
				
				
			});
		    
		    
		    $("."+o.inputClass+"-input",$this).live('focusout keyup change click',function(event){
				var parent = $(this).parents().eq(1);
				var classList = getClassList(parent);
				var className = classList[0];
				var itemData = $('.'+className).data('inplace');
				var disabled = false;
				var widgets = $(".ui-widget:not('.ui-dialog, .ui-button, .ui-tabs, , .ui-pnotify-container, .ui-accordion')");
				widgets.each(function(){
					if ($(this).css('display') != 'none' && !$(this).hasClass('ui-dialog')) disabled = true;
				})
		   		if (!disabled && (event.type == 'focusout' || (event.type == 'keyup' && event.which == 13 && !parent.hasClass(o.textareaClass))))
				{
					if (!parent.hasClass(o.selectClass) && !parent.hasClass(o.checkboxClass))
					{
						var text = $(this).val();
						parent.find("."+o.inputClass+"-content").html(text.trim().replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/\n/g,'<br>'));
						parent.find("."+o.inputClass+"-hidden").val(text.trim().replace(/\n/g,'<br>'));
						
						parent.attr('title',o.titleMessage);
						data = {'newValue': text.trim().replace(/\n/g,'<br>'),
								'oldValue':	itemData.oldValue,
								'event': (event.type == 'focusout') ? 'focusout' : 'keyup',
								'target': parent};
						
						o.callback.call(this,data);
					}   
					
					if (parent.hasClass(o.selectClass))
					{
						if (event.type == 'focusout' || ((event.type != 'keyup' && event.which != 13) && $(this).prop('multiple')))
						{
							var options = $(this).find(':selected')
							var text_array = new Array();
							var value_array = new Array();
							$.each(options,function(index,value){
								text_array.push($(value).text());
								value_array.push($(value).val());
							})
							var text = text_array.join('<br>');
							var value = value_array.join(',');
							
							parent.find("."+o.inputClass+"-content").html(text);
							parent.find("."+o.inputClass+"-hidden").val(value);
							
							parent.attr('title',o.titleMessage);
							data = {'newValue': value,
									'oldValue':	itemData.oldValue,
									'event': (event.type == 'focusout') ? 'focusout' : 'keyup',
									'target': parent};
							
							o.callback.call(this,data);
						}
					}
					
					if (parent.hasClass(o.checkboxClass))
					{
						if (parent.find("input[type='checkbox']").prop('checked'))
						{
							parent.find("."+o.inputClass+"-content").html(o.checkboxTrue);
							parent.find("."+o.inputClass+"-hidden").val(true);
							
							parent.attr('title',o.titleMessage);
							data = {'newValue': 'true',
									'oldValue':	itemData.oldValue,
									'event': (event.type == 'focusout') ? 'focusout' : 'keyup',
									'target': parent};
						}
						else
						{
						   parent.find("."+o.inputClass+"-content").html(o.checkboxFalse);
						   parent.find("."+o.inputClass+"-hidden").val(false);
						   
						   parent.attr('title',o.titleMessage);
						   	data = {'newValue': 'false',
						   			'oldValue':	itemData.oldValue,
						   			'event': (event.type == 'focusout') ? 'focusout' : 'keyup',
						   			'target': parent};
						}  
						
						o.callback.call(this,data);
					}
					
				}
				
				if (!disabled && (event.type == 'keyup' && event.which == 27))
				{
					   parent.find("."+o.inputClass+"-content").html(itemData.oldText);	
					   parent.find("."+o.inputClass+"-hidden").val(itemData.oldValue);
					   
					   parent.attr('title',o.titleMessage);
					   data = {	'newValue': itemData.oldValue,
					   			'oldValue':	itemData.oldValue,
					   			'event': 'keyup',
					   			'target': parent};
					   o.callback.call(this,data);
				}
				
				if (!disabled && (event.type == 'change'))
				{
					if (parent.hasClass(o.selectClass) && !$(this).prop('multiple'))
					{
						var options = $(this).find(':selected')
						var text_array = new Array();
						var value_array = new Array();
						$.each(options,function(index,value){
							text_array.push($(value).text());
							value_array.push($(value).val());
						})
						var text = text_array.join('<br>');
						var value = value_array.join(',');
						
						parent.find("."+o.inputClass+"-content").html(text);
						parent.find("."+o.inputClass+"-hidden").val(value);
						
						parent.attr('title',o.titleMessage);
						data = {'newValue': value,
								'oldValue':	itemData.oldValue,
								'event': 'change',
								'target': parent};
						o.callback.call(this,data);
					}
					
					 if (parent.hasClass(o.checkboxClass))
					{
						if (parent.find("input[type='checkbox']").prop('checked'))
						{
							parent.find("."+o.inputClass+"-content").html(o.checkboxTrue);
							parent.find("."+o.inputClass+"-hidden").val(true);
							data = {'newValue': 'true',
									'oldValue':	itemData.oldValue,
									'event': 'change',
									'target': parent};
						}
						else
						{
						   parent.find("."+o.inputClass+"-content").html(o.checkboxFalse);
						   parent.find("."+o.inputClass+"-hidden").val(false);
						   	data = {'newValue': 'false',
						   			'oldValue':	itemData.oldValue,
						   			'event': 'change',
						   			'target': parent};
						}
						
						parent.attr('title',o.titleMessage);
						o.callback.call(this,data);
					}
					
				}
			});
		});
			
	    },
	    destroy : function( ) {
	    	var data = $(this).data('inplace');
	    	var o = data.options;
	    	
	    	if ($(this).find('.'+o.inputClass+'-content').length != 0)
	    	{
	    		var text = (!$(this).hasClass(o.selectClass)) ? $(this).find('.'+o.inputClass+'-content').html() : $(this).find('select:first').clone();
				
				$(this).html(text).removeAttr('title').css('cursor','default');
				$("."+o.inputClass+"-input",$(this)).die('focusout keyup change');
				$(this).unbind('click');
			}
	    },
	    
	    val : function( ) {
	    	var classList = getClassList($(this));
	    	var itemClass = classList[0];
			
			return $("input[name='"+itemClass+"']").val();
	    },
	    
	    update : function(value) {
	    	if ($(this).length != 0)
	    	{
	    		var classList = getClassList($(this));
				var className = classList[0];
				var itemData = $('.'+className).data('inplace');
				
				var o = itemData.options;
				var text = value;
				
				if ($(this).hasClass(o.checkboxClass))
				{
					text = (value == true || value == 'true' || value == 1 || value == '1') ? o.checkboxTrue : o.checkboxFalse;
					value = (value == true || value == 'true' || value == 1 || value == '1') ? 'true' : 'false';
				}

				if ($(this).hasClass(o.selectClass))
				{
					var select = $(this).find('.'+o.inputClass+'-selectdata > select');	
					var temp_array = value.replace(/ /g,'').split(',');
					var value_array = new Array();
					var text_array = new Array();
					select.find("option").each(function(){
					  if ($.inArray($(this).val(),temp_array) > -1)
					  {
					  		value_array.push($(this).val());
							text_array.push($(this).text());
					  }
					  
					  value = value_array.join(',');
					  text = text_array.join('<br>');
					});
				}
				
				$(this).find("input[type='hidden']").val(value);
				$(this).find("input[type='hidden']").prev().html(text);
			} else {
				$.error('Target not found!');
			}
	    }
	  };
	
	$.fn.inplace = function(method)
	{
	     // Method calling logic
	    if ( methods[method] ) {
	      return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
	    } else if ( typeof method === 'object' || ! method ) {
	      return methods.init.apply( this, arguments );
	    } else {
	      $.error( 'Method ' +  method + ' does not exist on jQuery.inplace' );
	    }
	}
		
})(jQuery)