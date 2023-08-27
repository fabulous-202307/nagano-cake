$(document).ready(function() {
  $('.slider').slick({
    infinite: true,
    variableWidth: true,
    centerMode: true,
    speed: 300,
    slidesToShow: 3,
    slidesToScroll: 1,
    dots: true,
    prevArrow: '<div class="slick-prev"></div>', // 前へボタンのHTMLコードを指定
    nextArrow: '<div class="slick-next"></div>', // 次へボタンのHTMLコードを指定
  });
});

