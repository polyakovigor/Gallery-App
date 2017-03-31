$( "#new_comment" ).submit(function( event ) {

    // Stop form from submitting normally
    event.preventDefault();

    // Get some values from elements on the page:
    var $form = $( this ),
        term = $form.find( "input[name='comment[body]']" ).val(),
        url = $form.attr( "action" );

    // Send the data using post
    var posting = $.post( url, { s: term } );

    // Put the results in a div
    posting.done(function( data ) {
        var content = $( data ).find( "#content" );
        $( ".comments" ).empty().append( content );
    });
    
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: success,
        dataType: dataType
    });
});

// <form action="/" id="searchForm">
//     <input type="text" name="s" placeholder="Search...">
//     <input type="submit" value="Search">
//     </form>
//     <!-- the result of the search will be rendered inside this div -->
// <div id="result"></div>