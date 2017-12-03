$(document).ready(function () {
    $(document).on("scroll", onScroll);
    displayResult('north');
    
    //smoothscroll
    $('.navbar-collapse ul li a').on('click', function (e) {
        e.preventDefault();
        $(document).off("scroll");
        
        $('.navbar-collapse ul li a').each(function () {
            $(this).removeClass('navactive');
        })
        $(this).addClass('navactive');
     
        var target = this.hash,
            menu = target;
        $target = $(target);
        $('html, body').stop().animate({
            'scrollTop': $target.offset().top + 2
        }, 500, 'swing', function () {
            window.location.hash = target;
            $(document).on("scroll", onScroll);
        });
    });

    
    $('#pagination-demo').twbsPagination({
        totalPages: 20,
        // the current page that show on start
        startPage: 1,

        // maximum visible pages
        visiblePages: 5,

        initiateStartPageClick: true,

        // template for pagination links
        href: false,

        // variable name in href template for page number
        hrefVariable: '{{number}}',

        // Text labels
        first: 'First',
        prev: 'Previous',
        next: 'Next',
        last: 'Last',

        // carousel-style pagination
        loop: false,

        // callback function
        onPageClick: function (event, page) {

            var activeTab = $(".tab-content").find(".active");
            var id = activeTab.attr('id');
            alert(id);
            $('.page-active').removeClass('page-active');
            $('#'+ id +' #page'+page).addClass('page-active');
        },

        // pagination Classes
        paginationClass: 'pagination',
        nextClass: 'next',
        prevClass: 'prev',
        lastClass: 'last',
        firstClass: 'first',
        pageClass: 'page',
        activeClass: 'active',
        disabledClass: 'disabled'

    });

    //on document ready
    // add first dist display block
    


    // //display Modal
    // $('.singleRecep').each(function(index, ele) {
    //     $(ele).click(function() {
    //         alert("show");
    //         var modalId = $(this).data('id');

    //         $("#"+modalId).modal("show");
        
    //         $("#Recipes").addClass("after_modal_appended");
    
    //         //appending modal background inside the blue div
    //         $('.modal-backdrop').appendTo('#Recipes');   
    
    //         //remove the padding right and modal-open class from the body tag which bootstrap adds when a modal is shown
    //         $('body').removeClass("modal-open")
    //         // $('body').css("padding-right","");
    //     })
    // });

    // // //Remove text content
    // $("#page2").contents().filter(function () {
    //     return this.nodeType === 3; 
    // }).remove();


});

function onScroll(event){
    var scrollPos = $(document).scrollTop();
    $('.collapse navbar-collapse ul li a').each(function () {
        var currLink = $(this);
        var refElement = $(currLink.attr("href"));
        if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
            $('.collapse navbar-collapse ul li a').removeClass("navactive");
            currLink.addClass("navactive");
        }else{
            currLink.removeClass("navactive");
        }
    });
}


    //Load XML and XSLT
    function loadXMLDoc(filename){
        if (window.ActiveXObject){
            xhttp = new ActiveXObject("Msxml2.XMLHTTP");
        }else{
            xhttp = new XMLHttpRequest();
        }
        xhttp.open("GET", filename, false);
        try {xhttp.responseType = "msxml-document"} catch(err) {} // Helping IE11
        xhttp.send("");
        return xhttp.responseXML;
    }

    function displayResult(location){
           var xml = loadXMLDoc("xml/recipe.xml");
           var id = "";
           var locationList = {
                  north: 'xsl/north.xsl',
                  south: 'xsl/south.xsl',
                  hot: 'xsl/hot.xsl',
                  sweet: 'xsl/sweet.xsl',
                  tangy: 'xsl/tangy.xsl',
           }

            if(location=='north'){
                id = "tab-north";
            }else if(location=='south') {
                id = "tab-south";
            }else if(location=='hot') {
                id = "hot";
            }else if(location=='sweet') {
                id = "sweet";
            }else if(location=='tangy') {
                id = "tangy";
            }

         xsl = loadXMLDoc(locationList[location]);
         document.getElementById(id).innerHTML = " ";

      // code for IE
    if (window.ActiveXObject || xhttp.responseType == "msxml-document"){
        alert(id);
          ex = xml.transformNode(xsl);
          document.getElementById(id).innerHTML = ex;
    }

    // code for Chrome, Firefox, Opera, etc.
    else if (document.implementation && document.implementation.createDocument){
        alert(id);
        xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl);
        resultDocument = xsltProcessor.transformToFragment(xml, document);
        document.getElementById(id).appendChild(resultDocument);
        $('#'+ id +' #page1').addClass('page-active');
    }
    // alert("hgghhhjhj");
    // removeText(id);
  }     