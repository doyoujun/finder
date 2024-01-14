function setupPagination(targetId) {
    // This function sets up pagination for the specified target element by ID
    $(document).ready(function () {
        var $setRows = $('#' + targetId); // Use the targetId parameter

        var rowPerPage = 4;

        if (!rowPerPage) {
            alert('Sorry, but we can\'t display "0" rows per page. Please try again.');
        }

        var $products = $setRows; // Use the target element
        $products.after('<div id="nav">');

        var $tr = $products.find('.eventList-content');
        var rowTotals = $tr.length;

        var pageTotal = Math.ceil(rowTotals / rowPerPage);
        var i = 0;
/*
        $('<a href="#"></a>').
            attr('rel', 0).
            html('<').
            appendTo('#nav');*/

        for (; i < pageTotal; i++) {
            $('<a href="#"></a>').
                attr('rel', i).
                html(i + 1).
                appendTo('#nav');
        }

/*        $('<a href="#"></a>').
            attr('rel', pageTotal - 1).
            html('>').
            appendTo('#nav');*/

        $tr.addClass('off-screen').
        slice(0, rowPerPage).
        removeClass('off-screen');

        var $pagingLink = $('#nav a');
        $pagingLink.on('click', function (evt) {
            evt.preventDefault();
            var $this = $(this);
            if ($this.hasClass('active')) {
                return;
            }
            $pagingLink.removeClass('active');
            $this.addClass('active');

            var currPage = $this.attr('rel');
            var startItem = currPage * rowPerPage;
            var endItem = startItem + rowPerPage;

            $tr.css('opacity', '0.0').
            addClass('off-screen').
            slice(startItem, endItem).
            removeClass('off-screen').
            animate({ opacity: 1 }, 300);
        });

        $pagingLink.filter(':first').addClass('active');
    });
}