/**
 * 
 */

var swiper = new Swiper(".mySwiper", {
  loop: true,
pagination: {
  el: ".swiper-pagination",
  dynamicBullets: true,
},

navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
  },
  autoplay: {
      delay: 3000,
  },
});

var swiper2 = new Swiper(".Recommend_product", {
  controller: {
    control: swiper3,
  },
  loop: false,
  slidesPerGroup: 4,
  slidesPerView: 4,
  spaceBetween: 30,
  centeredSlides: false,
  pagination: {
  el: ".swiper-pagination",
  dynamicBullets: true,
},

navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
  },
});

var swiper3 = new Swiper(".recommend_product_text", {
  controller: {
    control: swiper2,
  },
  loop: false,
  slidesPerGroup: 4,
  slidesPerView: 4,
  spaceBetween: 30,
  centeredSlides: false,
  pagination: {
  el: ".swiper-pagination",
  dynamicBullets: true,
  }
});

swiper2.controller.control = swiper3;
swiper3.controller.control = swiper2;


var swiper4 = new Swiper(".new_product_slide", {
  controller: {
    control: swiper5,
  },
  loop: false,
  slidesPerGroup: 4,
  slidesPerView: 4,
  spaceBetween: 30,
  centeredSlides: false,
  pagination: {
  el: ".swiper-pagination",
  dynamicBullets: true,
},

navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
  },
});

var swiper5 = new Swiper(".new_product_text", {
  controller: {
    control: swiper4,
  },
  loop: false,
  slidesPerGroup: 4,
  slidesPerView: 4,
  spaceBetween: 30,
  centeredSlides: false,
  pagination: {
  el: ".swiper-pagination",
  dynamicBullets: true,
  }
});



swiper4.controller.control = swiper5;
swiper5.controller.control = swiper4;


