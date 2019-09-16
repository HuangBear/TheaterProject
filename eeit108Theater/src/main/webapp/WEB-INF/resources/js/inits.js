var carouselOptions = {
  collection: ['images/one.jpg', 'images/two.jpg', 'images/three.jpg', 'images/four.jpg', 'images/five.jpeg', 'images/six.jpg'],
  mainClassName: 'carousel',
  startingImage: 0, // optional: index of starting image
  useDots: true, // optional use dots true/false
  dotClass: 'dot', // optional classname for dots
  speed: 1000, // optional in milliseconds
  direction: 'forward', // optional: forward/backward/random
  useArrows: true, // optional arrows
  onChange: function() {console.log('Image Changed')}, // Triggered when carousel image changes
  onDotClick: function() {console.log('Dot Clicked')}, // Triggered when dot is clicked
  onLeftArrowClick: function() {console.log('Left Arrow Clicked')}, // Triggered when left arrow is clicked
  onRightArrowClick: function() {console.log('Right Arrow Clicked')}, // Triggered when right arrow is clicked
  onStart: function() {console.log('Carousel Started')}, // Triggered when carousel is loaded
  onStop: function() {console.log('Carousel Stopped')} // Triggered when carousel is loaded
};

$('.carousel').simpleCarouselInit(carouselOptions);
