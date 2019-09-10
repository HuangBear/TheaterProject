(function($, undefined) {

  $.widget('otg.carousel', {
    version: '0.0.1',
    options: {
      images: [{
        src: 'images/placeholder.png',
        caption: 'No Images Loaded'}],
      useDots: false,
      useCaptions: false,
      useArrows: false,
      currentImageIndex: 0,
      interval: 3000,
      useThumbnails: false
    },

    _create: function () {
      // create markup and default states
        this.element.addClass('otg-carousel');
        this._createWrapper();
        if(this.options.useDots && this.options.images.length > 1) {
          this._createDots();
        };
        if(this.options.useArrows && this.options.images.length > 1) {
          this._createArrows();
        };
        if(this.options.useThumbnails && this.options.images.length > 1) {
          this._createThumbnails();
        };
        this.startTimer();
        this._renderMarkup();
        this._setImage(this.options.currentImageIndex);
        this._on({
          'click li': this._handleDotClick,
          'click .arrow': this._handleArrowClick
        });
    },

    _createWrapper: function() {
      var el = $('<div/>'),
          caption = $('<div/>');
      this.shell = el.clone().addClass('otg-carousel-shell');
      this.mask = el.clone().addClass('otg-carousel-mask');
      if(this.options.useCaptions) this.imageCaption = caption.clone().addClass('otg-image-caption');
    },

    _setImage: function(i) {
      // FIRST SLIDE INIT
      if(typeof this.previousSlide == 'undefined') {
        this.shell.css("background-image", "url(" + this.options.images[i].src + ")");
        this.mask.css("background-image", "url(" + this.options.images[i].src + ")");
      }

      //todo: add more transistions
      // FADES IMAGE
      if(typeof this.previousSlide == 'number') {
        this.mask.css("background-image", "url(" + this.options.images[this.previousSlide].src + ")").show();
        this.shell.css("background-image", "url(" + this.options.images[i].src + ")");
        this.mask.fadeOut('medium');
      };

      this.imageCaption.html(this.options.images[i].caption);

      this.previousSlide = i;
      if(this.options.useDots) this._setDot(this.options.currentImageIndex);
    },

    _renderMarkup: function() {
      this.shell.appendTo(this.element);
      this.mask.appendTo(this.element);
      if (this.options.useCaptions) this.imageCaption.appendTo(this.element);
    },

    _setOptions: function(options) {
      this._superApply(arguments); // calls set options method of parent widget ($.widget);
    },

    _setOption: function(key, val) {
      this._super(key, val); // calls set option method of parent widget ($.widget);
      this.stopTimer();
      this.shell.find('ol').remove();
      if(this.options.useDots) this._createDots();
      this._renderMarkup();
      this.startTimer();
    },

    _destroy: function() {
      this.element.removeClass('otg-carousel');
      this.element.empty();
    },

    _createDots: function() {
      var el = $('<li/>'),
          container = $('<ol/>').addClass('otg-dots'),
          widget = this;

          $.each(this.options.images, function(i, img) {
            var dot = el.clone().appendTo(container);
          });

          container.appendTo(this.element);
    },

    _setDot: function(i) {
      $(this.element).find('li').each(function() { // iterates of each dot and removes all selected classes
        $(this).removeClass('selected');
      });
      $(this.element).find('li').eq(i).addClass('selected'); // adds selected class to the dot that was clicked
    },

    _handleDotClick: function(e) {
      var imgIndex = $(e.target).closest('li').index(); // gets clicked dot index
      this.options.currentImageIndex = imgIndex;
      this._setImage(imgIndex); // sets current image with index
      this.stopTimer();
    },

    _createThumbnails: function() {
      var el = $('<li/>'),
          container = $('<ul/>').addClass('otg-thumbnails'),
          widget = this;

          $.each(this.options.images, function(i, img) {
            var dotWidth = (100/widget.options.images.length) + "%";
            var dot = el.clone().css(
              "background-image", "url(" + img.src + ")"
            ).css("width", dotWidth).appendTo(container);
          });

          container.appendTo(this.element);
    },

    _createArrows: function() {
      var leftArrow = $('<div/>').addClass('left-arrow arrow').appendTo(this.shell);
      var rightArrow = $('<div/>').addClass('right-arrow arrow').appendTo(this.shell);
    },

    _handleArrowClick: function(e) {
      this.stopTimer();
      var elm = this;
      if ($(e.target).hasClass('left-arrow')) {
        var newImageIndex = (elm.options.currentImageIndex - 1);
        if (newImageIndex < 0) {
          newImageIndex = (elm.options.images.length - 1);
        }
      }
      if ($(e.target).hasClass('right-arrow')) {
        var newImageIndex = (elm.options.currentImageIndex + 1);
        if (newImageIndex >= (elm.options.images.length-1)) {
          newImageIndex = 0;
        }
      }
      this.options.currentImageIndex = newImageIndex;
      this._setImage(this.options.currentImageIndex);
    },

    startTimer: function() {
      var imgCount = this.options.images.length;
      var elm = this;

      var ticker = function() {
        elm.options.currentImageIndex += 1;
        if(elm.options.currentImageIndex >= imgCount) elm.options.currentImageIndex = 0;
        elm._setImage(elm.options.currentImageIndex);
      }

      this.timer = setInterval(function() {ticker()}, this.options.interval);
    },

    stopTimer: function() {
      clearInterval(this.timer);
    }
  })
}(jQuery));
