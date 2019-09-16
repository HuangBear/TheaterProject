(function($) {

	$.fn.simpleCarouselInit = function(params) {
    if (!params.collection) return console.log('No collection exists for carousel! Please check your configurations.'); // exits if no image collection exists

    var defaults = {
      dotClass: 'dot',
      useDots: true,
      speed: 1000,
      direction: 'forward',
      useArrows: false,
      currentImage: 0,
    }

    var configObject = $.extend(defaults, params); // sets default values unless params are passed

    this.each(function() {
      var Carousel = $(this);

      // Set Carousel Image by Index
      function setCarouselImage(i) {
        i = i || 0; // selected index or default 0
        Carousel.css("background-image", "url(" + configObject.collection[i] + ")"); // updates background-image
        if(configObject.useDots) updateDot(); // updates dot if used
        if(configObject.onChange) configObject.onChange();
      };

      // Carousel Image Directions
      var carouselImage = {
        forward: function() {
          configObject.currentImage += 1;
          if (configObject.currentImage == configObject.collection.length) configObject.currentImage = 0;
        },
        backward: function() {
          configObject.currentImage -= 1;
          if (configObject.currentImage < 0) configObject.currentImage = configObject.collection.length - 1;
        },
        random: function() {
          configObject.currentImage = Math.floor(Math.random() * (configObject.collection.length - 1)) + 0;
        }
      }

      // CAROUSEL TICKER REPEATED ON CAROUSEL SPEED
      function tick() {
        // selects direction
        switch(configObject.direction) {
          case 'forward':
            carouselImage.forward();
            break;
          case 'backward':
            carouselImage.backward();
            break;
          case 'random':
            carouselImage.random();
            break;
          default:
            carouselImage.forward();
        }
        setCarouselImage(configObject.currentImage); // sets carousel background image
      }

      // PERTAINING TO DOTS
        function getDots() { // ADDS DOTS TO THE CAROUSEL
          var dots = '';
          for(var i = 0; i<configObject.collection.length; i++) {
            dots += '<li class="' + configObject.dotClass + '"></li>'
          };
          return dots;
        };
        function updateDot() { // UPDATES DOTS CLASS FOR SELECTED FRAME
          for (var i=0; i < (configObject.collection.length + 1); i++) {
            $($(this).selector + ' ol li:nth-child(' + i + ')').removeClass('selected'); // removes all selected classes
          };
          $($(this).selector + ' ol li:nth-child(' + (configObject.currentImage + 1) + ')').addClass('selected'); // adds selected class on current dot
        };

        function appendDots() {
          Carousel.append('<ol>' + getDots()  + '</ol>');
        };

        if(configObject.useDots) appendDots();

        $().ready(function() { // CLICKS A DOT
            Carousel.on('click', 'li', function() {
              if(configObject.onDotClick) configObject.onDotClick();
              stopCarousel(); // stops carousel
              configObject.currentImage = $(this).index(); // changes current image index to clicked dot
              setCarouselImage(configObject.currentImage); // changes background image of carousel
              updateDot(); // updates dot
            });
        });
      // END DOTS

      // PERTAINING TO ARROWS
        function appendArrows() { // ADDS ARROWS TO THE CAROUSEL
          Carousel.append('<div class="left-arrow"></div>');
          Carousel.append('<div class="right-arrow"></div>');
        }
        function clickArrow(direction) { // ARROW CLICK FUNCTION
          stopCarousel(); // stops carousel
          if(direction == 'left') carouselImage.backward();
          if(direction == 'right') carouselImage.forward();
          setCarouselImage(configObject.currentImage); // changes background image of carousel
          if(configObject.useDots) updateDot();
        };
        $().ready(function() { // CLICKS AN ARROW
            Carousel.on('click', '.left-arrow', function() {
              if(configObject.onLeftArrowClick) configObject.onLeftArrowClick();
              clickArrow('left');
            });
            Carousel.on('click', '.right-arrow', function() {
              if(configObject.onRightArrowClick) configObject.onRightArrowClick();
              clickArrow('right');
            });
        });
      // END ARROWS

      // STARTS CAROUSEL
      function startCarousel() {
        configObject.mainTimer = setInterval(function(){
          tick();
        }, configObject.speed);
        if(configObject.onStart) configObject.onStart();
      };

      // STOPS CAROUSEL
      function stopCarousel() {
          clearInterval(configObject.mainTimer);
          if(configObject.onStop) configObject.onStop();
      }

      if(configObject.useArrows) appendArrows();
      setCarouselImage(configObject.currentImage);
      startCarousel();

    });

    return this; // allows chaining
  };
})(jQuery);
