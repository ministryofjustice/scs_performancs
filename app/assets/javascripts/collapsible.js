jQuery(function ($){
  "use strict";

  var addObjective = function ( event ){
    event ? event.preventDefault() : '';

    if(!$('.smart-objectives tbody tr').last().hasClass('hidden'))
      return false;

    $('.smart-objectives tbody tr.hidden').first().removeClass('hidden');

    // make sure only the last line has a remove objective link
    $('.smart-objectives .control-column a').addClass('hidden');
    $('.smart-objectives tbody tr').not('.hidden').last().find('.control-column a').removeClass('hidden');

    checkAddDisabledObjectives();
  };

  var removeObjective = function (event){
    event.preventDefault();

    var $row = $('.smart-objectives tbody tr').not('.hidden').last();
    $row.find('.control-column a').addClass('hidden');
    $row.addClass('hidden');
    $row.prev().find('.control-column a').removeClass('hidden');

    checkAddDisabledObjectives();
  };

  var checkAddDisabledObjectives = function (){
    if( !$('.smart-objectives tbody tr').last().hasClass('hidden') ){
      $('.add-objective.button').addClass('disabled');
    } else {
      $('.add-objective.button').removeClass('disabled');
    }
  };

  var revealFilledRows = function (event){
    var $rows = $($('.smart-objectives tbody tr').toArray().reverse());
    var $contentRows = $rows.filter(function (index, row){
      var $row = $(row);
      var hasContent = $row.find('textarea').map(function (x,y){ return $(y).val(); }).toArray().join('').length > 0;
      if( hasContent ){
        return row;
      }
    });

    while( $contentRows.filter(function (i,x){ return $(x).hasClass('hidden') }).length > 0 ){
      addObjective();
    }
  };

  if( $('.objective-row-1').length > 0 ){
    for( var i = 2; i <= 10; i++ ){
      $('.objective-row-' + i).addClass('hidden');
    }

    $('.control-column').removeClass('hidden');
    $('.smart-objectives-controls').removeClass('hidden');

    $('.add-objective').click(addObjective);
    $('.remove-objective').click(removeObjective);

    revealFilledRows();
  }


});
