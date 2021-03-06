($.fn.serializeObject = function() {
			    var o = {};
			    var a = this.serializeArray();
			    $(this).find('input[type="hidden"], input[type="text"], input[type="password"], input[type="checkbox"]:checked, input[type="radio"]:checked, select, textarea, th, p, form, table, div').each(function() {
			        if ($(this).attr('type') == 'hidden') { //if checkbox is checked do not take the hidden field
			            var $parent = $(this).parent();
			            var $chb = $parent.find('input[type="checkbox"][name="' + this.name.replace(/\[/g, '\[').replace(/\]/g, '\]') + '"]');
			            if ($chb != null) {
			                if ($chb.prop('checked')) return;
			            }
			        }
			        if (this.name === null || this.name === undefined || this.name === '') return;
			        var elemValue = null;
			        if ($(this).is('select')) elemValue = $(this).find('option:selected').val();
			        else elemValue = this.value;
			        if (o[this.name] !== undefined) {
			            if (!o[this.name].push) {
			                o[this.name] = [o[this.name]];
			            }
			            o[this.name].push(elemValue || '');
			        } else {
			            o[this.name] = elemValue || '';
			        }
			    });
			    return o;
 });