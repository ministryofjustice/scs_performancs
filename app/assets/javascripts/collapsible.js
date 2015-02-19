/* global jQuery */

jQuery(function ($){
  'use strict';

  var addObjective = function ( event ){
    event ? event.preventDefault() : '';

    addRow('objective');
  };

  var addDevelopment = function ( event ){
    event ? event.preventDefault() : '';

    addRow('development');
  };

  var addRow = function ( type ){
    var klass = type === 'objective' ? '.smart-objectives'
                                     : '.development-needs';

    if(!$( klass + ' tbody tr' ).last().hasClass('hidden')){
      return false;
    }

    $( klass + ' tbody tr.hidden' ).first().removeClass('hidden');

    // make sure only the last line has a remove objective link
    $( klass + ' .control-column a' ).addClass('hidden');
    $( klass + ' tbody tr' )
      .not('.hidden')
      .last()
      .find('.control-column a')
      .removeClass('hidden');

    checkAddDisabledObjectives();
  };

  var removeObjective = function ( event ){
    event.preventDefault();

    removeRow('objective');
  };

  var removeDevelopment = function ( event ){
    event.preventDefault();

    removeRow('development');
  };

  var removeRow = function ( type ){
    var klass = type === 'objective' ? '.smart-objectives'
                                     : '.development-needs';

    var $row = $( klass + ' tbody tr' ).not('.hidden').last();
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

  var revealFilledRows = function (){
    $(['.smart-objectives', '.development-needs']).each(function (x, klass){
      var lastRow = $( klass + ' textarea').filter(function (i, obj){
        return $(obj).val().length > 0;
      }).last().closest('tr');

      while( lastRow.hasClass('hidden') ){
        klass === '.smart-objectives' ? addObjective() : addDevelopment();
      }
    });

  };

  if( $('.objective-row-1').length > 0 ){
    for( var i = 2; i <= 10; i++ ){
      $('.objective-row-' + i).addClass('hidden');
      $('.development-row-' + i).addClass('hidden');
    }

    $('.control-column').removeClass('hidden');
    $('.smart-objectives-controls').removeClass('hidden');

    $('.add-objective').click(addObjective);
    $('.remove-objective').click(removeObjective);

    $('.add-development').click(addDevelopment);
    $('.remove-development').click(removeDevelopment);

    revealFilledRows();
  }


});
