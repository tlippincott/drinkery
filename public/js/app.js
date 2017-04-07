$('.form').find('input, textarea').on('keyup blur focus', function (e) {

  var $this = $(this),
      label = $this.prev('label');

    if (e.type === 'keyup') {
      if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
      if( $this.val() === '' ) {
        label.removeClass('active highlight');
      } else {
        label.removeClass('highlight');
      }
    } else if (e.type === 'focus') {

      if( $this.val() === '' ) {
        label.removeClass('highlight');
      }
      else if( $this.val() !== '' ) {
        label.addClass('highlight');
      }
    }

});

$('.tab a').on('click', function (e) {

  e.preventDefault();

  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');

  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();

  $(target).fadeIn(600);

});

$('.send-id').on('click', function() {
  var drinkid = $('.send-id').data('id');

  $.ajax({
    url: '/favorite',
    type: 'POST',
    datatype: 'JSON',
    data: {id: drinkid},
    success: function(result) {
      $('.send-id').addClass("delete-id").removeClass("send-id");
      $('.delete-id').html('Remove from Favorites');
    },
    error: function(error) {
      console.log(error);
    }
  })

});

$('.delete-id').on('click', function() {
  var drinkid = $('.delete-id').data('id');

  $.ajax({
    url: '/favorite',
    type: 'DELETE',
    datatype: 'JSON',
    data: {id: drinkid},
    success: function(result) {
      $('.delete-id').addClass("send-id").removeClass("delete-id");
      $('.send-id').html('Save as Favorite');
    },
    error: function(error) {
      console.log(error);
    }
  })

});
