/*! jQuery Scroll Snap 1.0.0 | MIT *
 * https://github.com/jpcurrier/jquery-scroll-snap !*/
( function( $ ){
  $.fn.expansionGrid = function( options ){

    // default options
    var settings = $.extend({
      position: false,
      positionOffset: 0
    }, options );

    return this.each( function(){
      var $grid = $( this ),
        initMarginBottom = parseInt( $( this ).children( 'li' ).css( 'margin-bottom' ) );

      $grid.find( '.expansion-grid-reveal' ).append( '<button class="close"></button>' );

      function spaceGrid(){
        var revealSpace = $grid.children( '.active' ).find( '.expansion-grid-reveal' ).outerHeight( true ) + initMarginBottom;

        $grid.children( 'li' ).each( function(){
          if( $( this ).offset().top == $grid.children( '.active' ).offset().top )
            $( this ).animate( { 'margin-bottom': revealSpace }, 400 );
          else
            $( this ).animate( { 'margin-bottom': initMarginBottom }, 400 );
        } );
      }
      function close(){
        $grid.removeClass( 'open-item' );
        $grid.children( 'li' ).removeClass( 'active' )
          .animate( { 'margin-bottom': initMarginBottom }, 200 );
      }

      $grid.find( '.expansion-grid-switch' ).on( 'click', function(){
        var $clicked = $( this ).parent(),
          revealSpace = $( this ).siblings( '.expansion-grid-reveal' ).outerHeight( true ) + initMarginBottom;

        // open
        if( !$clicked.hasClass( 'active' ) ){
          $grid.addClass( 'open-item' );
          $grid.children( '.active' ).removeClass( 'active' );
          $clicked.addClass( 'active' );
          $grid.children( 'li' ).each( function(){
            if( $( this ).offset().top == $clicked.offset().top )
              $( this ).animate( { 'margin-bottom': revealSpace }, 200 );
            else
              $( this ).animate( { 'margin-bottom': initMarginBottom }, 200 );
          } );

          // position
          if( settings.position ){
            $grid.children( 'li' ).promise().done( function(){
              $( 'html, body' ).animate( { scrollTop: $clicked.offset().top + settings.positionOffset }, 400 );
            } );
          }

        }

        // close
        else
          close();
      } );

      // close button
      $grid.find( 'button.close' ).on( 'click', function(){
        close();
      } );

      // resize
      var delay;
      $( window ).on( 'resize', function(){
        clearTimeout( delay );
        delay = setTimeout( function(){
          if( $grid.children( '.active' ).length )
            spaceGrid();
        }, 200 );
      } );
    } );
  };
} )( jQuery );