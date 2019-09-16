$.fn.extend({
  simpleCarouselInit: function(configObject) {

    if (!configObject.collection) return console.log('No collection exists for carousel! Please check your configurations.'); // exits if no image collection exists

    // DEFAULTS
    configObject.mainClassName = configObject.mainClassName || 'carousel';
    configObject.dotClass = configObject.dotClass || 'dot';
    configObject.useDots = configObject.useDots || true;
    configObject.speed = configObject.speed || 1000;
    configObject.direction = configObject.direction || 'forward';
    configObject.useArrows = configObject.useArrows || false;

    var currentImage = configObject.startingImage || 0; // Starting Image Index
    var Carousel = $('.' + configObject.mainClassName);

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
        currentImage += 1;
        if (currentImage == configObject.collection.length) currentImage = 0;
      },
      backward: function() {
        currentImage -= 1;
        if (currentImage < 0) currentImage = configObject.collection.length - 1;
      },
      random: function() {
        currentImage = Math.floor(Math.random() * (configObject.collection.length - 1)) + 0;
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
      setCarouselImage(currentImage); // sets carousel background image
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
          $('ol li:nth-child(' + i + ')').removeClass('selected'); // removes all selected classes
        };
        $('ol li:nth-child(' + (currentImage + 1) + ')').addClass('selected'); // adds selected class on current dot
      };
      function appendDots() {
        Carousel.append('<ol>' + getDots()  + '</ol>');
      };
      if(configObject.useDots) appendDots();
      $().ready(function() { // CLICKS A DOT
          Carousel.on('click', 'li', function() {
            if(configObject.onDotClick) configObject.onDotClick();
            stopCarousel(); // stops carousel
            currentImage = $(this).index(); // changes current image index to clicked dot
            setCarouselImage(currentImage); // changes background image of carousel
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
        setCarouselImage(currentImage); // changes background image of carousel
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
      mainTimer = setInterval(function(){ tick() }, configObject.speed);
      if(configObject.onStart) configObject.onStart();
    }

    // STOPS CAROUSEL
    function stopCarousel() {
        clearInterval(mainTimer);
        if(configObject.onStop) configObject.onStop();
    }

    if(configObject.useArrows) appendArrows();
    setCarouselImage(currentImage);
    startCarousel();
  }
})
