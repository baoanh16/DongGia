$(document).ready(function () {
    $('body').on('change', '#customerSupportNav', function () {
        var customerSupportUrl = $(this).val();
        window.location.href = customerSupportUrl;
    });

    $('body').on('click', '.question', function () {
        var questionParent = $(this).parent();
        var questionNextElement = $(this).next();

        if (questionParent.hasClass('active')) {
            questionParent.removeClass('active');
            questionNextElement.slideUp(300);
        } else {
            $('.question').each(function (index, element) {
                $(element).parent().removeClass('active');
                $(element).next().slideUp(300);
            });
            questionParent.addClass('active');
            questionNextElement.slideDown(300);
        }
    });

    $('body').on('click', '.btn-map', function () {
        var mapUrl = $(this).attr('data-href');
        $.fancybox.open({
            src: mapUrl,
            type: 'iframe',
            opts: {
                "iframe": {
                    "css": {
                        "width": "80%",
                        "height": "80%"
                    }
                }
            }
        });
    });
});