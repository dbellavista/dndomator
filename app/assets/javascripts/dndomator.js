function create_encounter_creation(target_exp) {

      var target = target_exp;

      function toggleImage($check) {
        id = $check.attr('id').split("_")[1];
        if(typeof id === 'undefined') {
          return;
        }
        if($check.is(":checked")) {
          image = $('#imgmonster_' + id).val();
          $('#imgmonster_container').append('<img src="'+image+'" id="img_'+id+'" />');
        } else {
          $('img#img_' + id).remove();
        }
      }

      function refreshExp() {

        total_exp = 0;

        $('.monster-check').each(function (){
          id = $(this).attr('id').split("_")[1];
          exp = parseInt($('#expmonster_' + id).val()) || 0;
          n = parseInt($('#nummonster_' + id).val()) || 0;

          if($(this).is(":checked")) {
            total_exp += exp * n;
          }
        });
        $('#computed-exp').val(total_exp);
        var i = 0;
        for(; i < target.length; i++) {
          if(target[i] > total_exp) {
            break;
          }
        }
        $('#target-lev').html(i);
      }

      $(".monster-check").each(function() {
        toggleImage($(this));
        refreshExp();
      });

      $('.monster-check').click(function() {
        toggleImage($(this));
        refreshExp();
      });

      $(".nummonster").change(function(e) {
        refreshExp();
      });
}

function create_fighter(data, className) {
  var html = '\
    <div id="fighter" class="'+className+' ">\
			<dt id="name">\
        ' + data['name'] + '\
        <span id="bloodied" class="text-warning">B</span>\
        <span id="dying" class="text-error">D</span>\
        <span id="death" class="muted">DT</span>\
        <input type="hidden" id="maxhp" value = "0" />\
        <input type="text" id="hp" class="input-mini hp" value = "0" />\
        \
      </dt>\
      <dd id="chars">\
        <form class="form-inline">\
          <label for="initiative">I:</label>\
          <input type="text" id="initiative" class="input-mini" value="0" />\
          <label for="recharge">RR:</label>\
          <input type="text" id="recharge" class="input-mini" />\
          <label for="attackroll">AR:</label>\
          <input type="text" id="attackroll" class="input-mini" />\
          <label for="damage">D:</label>\
          <input type="text" id="damage" class="input-mini damage" />\
          <textarea rows=3 id="notes" style="vertical-align: top;"></textarea>\
        </form>\
      </dd>\
		</div>\
            ';
  return html;
}

function initEncounter(encounter_path, heroes_path) {
  $('#encounter_commands').prepend('\
      <div id="encounter-nav" class="well">\
        <div id="start">\
          <button id="start_button" class="btn btn-primary">Start encounter</button>\
        </div>\
        <div id="turn">\
          <button id="next" class="btn btn-primary">Next Turn</button>\
          <h2 id="timeout" class="text-error"></h2>\
        </div>\
      </div>\
		');

	//$('#encounter_commands').affix();

  $('#encounter_container').append('<div class="span10"><dl id="encounter"></dl></div>');

  // Monsters
  $.getJSON(encounter_path, function(data) {
    $.each(data["monsters"], function(key, val) {
      if(val["kind"] == "creature") { 
        var html = create_fighter(val, 'monster');
        $("#encounter").append(html);
      }
    });
    // Heroes
    $.getJSON(heroes_path, function(data) {
      $.each(data, function(key, val) {
        var html = create_fighter(val, 'hero');
        $("#encounter").append(html);
      });
      // Start encounter
      encounter();
    });
  });
}

function encounter() {

	// Document ready
	var countdown;

	$("#turn").hide();
	updateFlags();
	rollInitiative();

	function rollDice(v, n) {
		v = typeof v !== 'undefined' || v <= 0 ? v : 1;
		n = typeof n !== 'undefined' || n <= 0 ? n : 1;

		res = new Array()
			for(var i = 0; i < n; i++) {
				res.push(Math.floor((Math.random()*v)+1));
			}

		if(n == 1) {
			return res[0];
		}
		return res;	
	}

	function startCountDown() {
		clearInterval(countdown);
		var count = 10;
		$("#timeout").toggleClass("expired", false);
		countdown = setInterval(function() {
			$("#timeout").html(count + " s");
			if(count == 0) {
				$("#timeout").toggleClass("expired", true);
				clearInterval(countdown);
			}
			count -= 1;
		}, 1000);
	}

	function nextTurn() {
		$next = $(".current + #fighter");
		$(".current:first").removeClass("current");
		if($next.length == 0) {
			$next = $("#fighter:first");
		}
		$next.addClass("current");
		$next.find("#recharge")[0].value = rollDice(6);
		$next.find("#attackroll")[0].value = rollDice(20);

    $('html, body').animate({
      scrollTop: $next.offset().top - 50
    }, 500);

		startCountDown();
	}

	// Start click: order by initiative
	$("#start_button").click(function() {
		$("#encounter").children("#fighter").sort(function(a, b) {
			return $(b).find('#initiative')[0].value - $(a).find('#initiative')[0].value;
		}).appendTo('#encounter');
		$("#start").hide();
		$("#turn").show();
		$("input#initiative").prop('disabled', true);
		nextTurn();
	});
	// Next click: select the next fighter
	$("#next").click(function() {
		nextTurn();
	});

	function rollInitiative($fighter) {
		if(typeof $fighter === 'undefined') {
			$("#encounter").children("#fighter").each(function(i, e) {
				rollInitiative($(e));
			});
			return;
		}

		$init = $fighter.find("#initiative");
		$init[0].value = rollDice(20);

	}

	function updateFlags($fighter) {
		if(typeof $fighter === 'undefined') {
			$("#encounter").children("#fighter").each(function(i, e) {
				updateFlags($(e));
			});
			return;
		}

		$fighter.find("#dying").hide();
		$fighter.find("#death").hide();
		$fighter.find("#bloodied").hide();

		$maxhp = $fighter.find("#maxhp");
		if($maxhp.length == 0) {
			return;
		}
		var maxHp = parseInt($maxhp.val());
		var hp = parseInt($fighter.find("#hp").first().val());
		if(isNaN(hp) || isNaN(maxHp)) {
			return;
		}

		if(hp <= maxHp / 2 && hp > 0) {
			$fighter.find("#bloodied").show();
		} else if(hp <= 0 && hp > -maxHp/2) {
			$fighter.find("#dying").show();
		} else if(hp <= -maxHp/2) {
			$fighter.find("#death").show();
		}

	}

	$(".hp").keypress(function(e) {
		code= (e.keyCode ? e.keyCode : e.which);
		if(code != 13) {
			return;
		}
		var hp = parseInt($(this).val());
		if(isNaN(hp)) {
			return;
		}
		$(this).siblings("#maxhp").val(hp);
		// Update flags
		updateFlags($(this).parents("#fighter"));
		$(this).blur();

	});

	$(".damage").keypress(function(e) {
		code= (e.keyCode ? e.keyCode : e.which);
		if(code != 13) {
			return;
		}
		$hp = $(this).parents("#fighter").find("#hp").first();
		var currDamage = parseInt($(this).val());
		$(this).val("");
		if(isNaN(currDamage)) {
			return;
		}

		var hp = parseInt($hp.val());
		if(isNaN(hp)) {
			return;
		}
		$hp.val(hp - currDamage);
		// Update flags
		updateFlags($(this).parents("#fighter"));

		$(this).blur();
	});

}
