(function( $ ) {

  var timer,
      stored_keys = null,

  Regulate = {

    longPoll: function longPoll( force, callback ){
      var i, text = $('#page_view').val(),

          // This RegEx will catch anything inside the `{{ }}`
          m = /\{\{(\w|\s)*\}\}/g,
          // A more generic mustache `{ }` grab
          clean_key = /[\{,\}]/g,

          keys = [],
          invalid_keys = [],
          deleted_keys = [],

          // To import data, we've attached an object to `window.existing_custom_fields`
          existing_keys = existing_custom_fields || {},

          // Define a blacklist of keys we know we'll never want
          blacklist = ['{{view}}', '{{title}}'],

          // This assigns our initial match of all keys in the textarea
          initial_match = text.match( m ) || [],

          // This allows to skip the early return
          f = force || false;

      // Prevent this core of this from running while someone's typing
      if( $('#page_view').hasClass('active') && f === false) {
        // Set the timer agains and return early
        timer = setTimeout( longPoll , 1e3);
        return false;
      }

      // Loop through the keys that our regex grabbed, and determine if they're ok to use
      $.each( initial_match, function( i, v ) {
          var invalid = false;

          // Keys can't be in the blacklist, also don't double up the errors
          if( ~blacklist.indexOf( v ) && !~invalid_keys.indexOf( v ) ) {
            invalid = true;
            invalid_keys.push({ 'key':v, 'msg': 'The key '+v+' is reserved.' });
          }

          // Keys can't contain spaces
          if( /\s/.test(v) && !~invalid_keys.indexOf( v ) ) {
            invalid = true;
            invalid_keys.push({ 'key':v, 'msg': 'The key '+v+' contains a space. It can\'t do that.' });
          }

          // Keys can't start with a number
          if( /\{\{\d/.test(v) && !~invalid_keys.indexOf( v ) ) {
            invalid = true;
            invalid_keys.push({ 'key':v, 'msg': 'The key '+v+' starts with a number. It can\'t do that.' });
          }

          // If we're still valid after this, add the key into the keys array
          if( invalid === false ) {
            keys.push( v );
          }
      });

      // Loops through the stored keys and checks for any deleted keys
      // stored_key[] - keys[] == any deleted keys
      if( stored_keys !== null ) {
        i = stored_keys.length;
        while(i--){
          if( ! ~keys.indexOf( stored_keys[i] ) ) {
            deleted_keys.push( stored_keys[i] );
            // Remove the label and text area within #edit_regions
            $('#edit_regions .'+ stored_keys[i].replace( clean_key, "") ).remove();
          }
        }
      }

      // Loop through the valid keys and add labels and textareas for them
      $.each( keys, function( i, v ) {
        var new_key = v.replace( clean_key, ""),

            textarea = $("<textarea>", {
              'name': 'page[edit_regions][' + new_key + ']',
              'class': new_key,
              'value': existing_keys[new_key] || 'Default Text for '+v
            }),

            label = $("<label>", {
              'for': 'page[edit_regions][' + new_key + ']',
              'text': new_key.replace(/_/g, " "),
              'class': new_key
            });

        if( $('textarea').hasClass( new_key )) {
          return;
        }

        // Add our textarea to the end of #edit_regions, and inset it's label before it
        textarea.appendTo('#edit_regions').before(label);
      });

      // Make any old errors go away
      $('#custom_field_errors').empty();

      // Add error messages for an invalid keys
      $.each( invalid_keys, function( i, v ) {
        if( v.key !== "{{title}}" ) {
          $('#custom_field_errors').append(v.msg+"</br>");
        }
      });

      // Globally persist our keys for the next pass
      stored_keys = keys;

      // Set a 1 second timer
      timer = setTimeout( longPoll , 1e3);

      if( $.isFunction( callback ) ){
        callback();
      }
    },

    init: function(){
      var buffer;

      // Start the party with checking the form's inital value
      Regulate.longPoll();

      // Forces the longPoll to run one more time before you submit the form
      $('form').bind('submit', function( e ){
        e.preventDefault();

        var f = e.target;

        clearTimeout( timer );

        Regulate.longPoll( null, function(){
          $(f).unbind('submit').submit();
        });

      });

      // Runs the longPoll if `}}` is entered into the form
      $(window).bind('keyup', function(e) {
        if( e.keyCode == 221 && buffer == 221 ) {
          Regulate.longPoll( true );
        }

        buffer = e.keyCode;
      });

      // Prevents the longPoll from running if you're focused on the textarea
      $('#page_view').bind('focus blur', function(e){
        $(this).toggleClass('active');
      });
    }

  };

  $( Regulate.init );

  window.Regulate = Regulate;

})(jQuery);
