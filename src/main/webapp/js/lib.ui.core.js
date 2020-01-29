
/**
 * 序列化对象的信息(ajax传递json对象的时候，需要将信息组合成标准的json对象的格式)
 */
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};


/**获得Frame*/
function getFrame(frameId) {
	try {
		return document.getElementById(frameId).contentWindow;
	} catch (e) {
		return window.frames[frameId];
	}
}

/** 提交iframe中的form */
function submitFrameForm(frameId, formId) {
	try {
		document.getElementById(frameId).contentWindow.document.forms[formId].submit();
	} catch (e) {
		window.frames[frameId].document.forms[formId].submit();
	}
}

/**
 * 动态设置元素的高度
 */
function setElementHeight(ele, array, wrap, fixHeight) {
	var i, len;
	if (!fixHeight) {
		fixHeight = 0;
	}
	wrap = wrap || document.body;
	for (i = 0, len=array.length; i < len; ++i) {
		fixHeight += $(array[i]).outerHeight();
	}
	$(ele).height($(wrap).height() - fixHeight);
}

function loadGrid(){
	var $grid = $('.grid'), 
	$thead = $('.table-head',$grid),
	$tbody = $('.table-body',$grid),
	docWidth = $(document.body).width(),
	headWidth = $thead.find('table').outerWidth(),
	bodyWidth = $tbody.find('table').outerWidth(),
	headWidth = (headWidth > docWidth || headWidth + 17 > docWidth)
		? headWidth + 17 
		: docWidth,
	bodyWidth = (bodyWidth > docWidth || bodyWidth + 17 > docWidth)
		? bodyWidth + 17 
		: docWidth;

	$thead.width(headWidth);
	$tbody.width(bodyWidth);
	
	if(headWidth > docWidth){
		$grid.width(docWidth).css('overflow-x','auto');
		$tbody.height($tbody.height() - 17);
	}else{
		$grid.width(docWidth).css('overflow-x','hidden');		
	}
}

/**
 * 获取第一个多选按钮的值
 */
function getFirstID(){
	var chkValue,
		checkboxList = $('.grid').find('.table-body').find(':checkbox');
	
	if(checkboxList 
		&& checkboxList.filter(':checked').size() > 0){
		
		chkValue = checkboxList.filter(':checked').eq(0).val();
	}
	
	return chkValue;
}

/**
 * 单选或多选时，通过点击行选中
 */

$('.chk_tr').bind("click",function(e){
//	$(".grid .table-body tr").each(function(){  
//        $(this).children().click(function(e){
        	if($(e.target).parent(".grid .table-body tr").html()!=null){
	            $(e.target).parent().each(function(){  
	            	if($(this).find(":checkbox").html()!=null){	            		
		            	if($(this).find(":checkbox").is(":checked")){  
		                    $(this).find(":checkbox").attr("checked",false);  
		                }else{  
		                    $(this).find(":checkbox").attr("checked",true);  
		                }
		            }else{
		            	if($(this).find(":radio").is(":checked")){  
		                    $(this).find(":radio").attr("checked",false);  
		                }else{  
		                    $(this).find(":radio").attr("checked",true);  
		                }
		            }
	            });
        	}else if($(e.target).parent().parent(".grid .table-body tr").html()!=null){
        		$(e.target).parent().parent().each(function(){  
	            	if($(this).find(":checkbox").html()!=null){	            		
		            	if($(this).find(":checkbox").is(":checked")){  
		                    $(this).find(":checkbox").attr("checked",false);  
		                }else{  
		                    $(this).find(":checkbox").attr("checked",true);  
		                }
		            }else{
		            	if($(this).find(":radio").is(":checked")){  
		                    $(this).find(":radio").attr("checked",false);  
		                }else{  
		                    $(this).find(":radio").attr("checked",true);  
		                }
		            }
	            });
        	}else{
        		$(e.target).parent().parent().each(function(){
	        		if($(e.target).parent().parent().html().indexOf("checkbox")>0||$(e.target).parent().parent().html().indexOf("radio")>0){
	        			alert($(e.target).parent().parent().html());
	        			if($(e.target).parent().parent().find(":checkbox").html()!=null){
			                if($(e.target).parent().parent().find(":checkbox").is(":checked")){  
			                	$(e.target).parent().parent().find(":checkbox").attr("checked",false);  
			                }else{  
			                	$(e.target).parent().parent().find(":checkbox").attr("checked",true);  
			                }  
	        			}else{
			            	if($(e.target).parent().parent().find(":radio").is(":checked")){  
			            		$(e.target).parent().parent().find(":radio").attr("checked",false);  
			                }else{  
			                	$(e.target).parent().parent().find(":radio").attr("checked",true);  
			                }
			            }
	    			}else if($(e.target).parent().html().indexOf("checkbox")<=0&&$(e.target).parent().html().indexOf("radio")<=0){
		        			if($(this).find(":checkbox").html()!=null){
				                if($(this).find(":checkbox").is(":checked")){  
				                    $(this).find(":checkbox").attr("checked",false);  
				                }else{  
				                    $(this).find(":checkbox").attr("checked",true);  
				                }  
		        			}else{
				            	if($(this).find(":radio").is(":checked")){  
				                    $(this).find(":radio").attr("checked",false);  
				                }else{  
				                    $(this).find(":radio").attr("checked",true);  
				                }
				            }
	        			}
	            });
        	}
//        });    
//    });
});

/**
 * 获取多选按钮所有选中的值
 */
function getAllID(){
	var chkArray = [],
		checkboxList = $('.grid').find('.table-body').find(':checkbox');
	
	if(checkboxList 
		&& checkboxList.filter(':checked').size() > 0){
		
		checkboxList.filter(':checked').each(function(){
			chkArray.push($(this).val());
		});
		
	}
	
	return chkArray.join();
}


function showMessage(config){
	var option = {
		type: 'success', //只能接受：'success'或者'error'
		msg:'操作成功！',
		speed:1500,
		handler: $.noop
	};
	
	$.extend(option,config);
	
	//如果没有提示信息层，则需要创建并追加到页面的body中。
	if($('.bgDiv',document.body).length === 0
		||$('.bgDiv',document.body).length === 0){
		
		var _html = [];
		_html.push('<div class="bgDiv"></div>');
		_html.push('<div class="message"></div>');
		
		var _doc = $(_html.join(''));
		
		$(document.body).append(_doc);
	}
	
	//获取提示信息层
	var $bgDiv = $('.bgDiv',document.body),
		$messageDiv = $('.message',document.body);
	
	$messageDiv.removeClass('success error');
	$messageDiv.addClass(option.type);
	$messageDiv.text(option.msg);
	
	//隐藏提示信息层
	if($bgDiv.is(':visible'))
		$bgDiv.hide();
	if($messageDiv.is(':visible'))
		$messageDiv.hide();
	
	//使提示信息在页面的中间显示
	var top = ($bgDiv.height() - $messageDiv.outerHeight()) * 0.5;
	var left = ($bgDiv.width() - $messageDiv.outerWidth()) * 0.5;
	
	//显示提示信息层
	$bgDiv.fadeTo('fast',0.33,function(){
		$messageDiv.css({
			'top': top+'px',
			'left': left+'px'
		}).show();
	});
	
	//关闭提示信息
	window.setTimeout(function(){
		$bgDiv.hide();
		$messageDiv.hide();
		option['handler']();
	}, option.speed);
}

function createFrameString(config) {
	var frameStr = [
		'<iframe id="',
		config.id,
		'" frameborder="0" src="',
		config.src,
		'" ></iframe>'

	].join('');
	return frameStr;
}

window.pagination = {
	getForm: function () {
		var formId = $('#_page_').attr('data-for');
		var form = $('#' + formId);
		if (!form.size()) {
			form = $('#_page_').closest('form');
		}
		return form;
	},
	pageSizeChange: function () {
		pagination.getForm().submit();
	},
	gotoNext: function (btn) {
		if ($(btn).hasClass('l-btn-disabled')) {
			return false;
		}
		var start = $('#_page_start').val();
		$('#_page_ .pagination-num').val(start - 0 + 1);
		pagination.getForm().submit();
	},
	gotoPre: function (btn) {
		if ($(btn).hasClass('l-btn-disabled')) {
			return false;
		}
		var start = $('#_page_start').val();
		$('#_page_ .pagination-num').val(start - 1);
		pagination.getForm().submit();
	},
	gotoFirst: function (btn) {
		if ($(btn).hasClass('l-btn-disabled')) {
			return false;
		}
		$('#_page_ .pagination-num').val(1);
		pagination.getForm().submit();
	},
	gotoLast: function (btn) {
		if ($(btn).hasClass('l-btn-disabled')) {
			return false;
		}
		var end = $('#_page_totalpage').val();
		$('#_page_ .pagination-num').val(end);
		pagination.getForm().submit();
	},
	refresh: function () {
		pagination.getForm().submit();
	}
};

$(function () {
	if ($('#_page_').size()) {
		var form = pagination.getForm();
		if (form.size()) {
			form.bind('submit', function () {
				var limit = $('#_page_ .pagination-page-list').val();
				var start = $('#_page_ .pagination-num').val();
				$('#_page_start').val(start);
				$('#_page_limit').val(limit);
				return true;
			});
		}
	}
});

