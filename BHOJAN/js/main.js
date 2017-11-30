$(document).ready(function () {
    $(document).on("scroll", onScroll);
    
    //smoothscroll
    $('a[href^="#"]').on('click', function (e) {
        e.preventDefault();
        $(document).off("scroll");
        
        $('a').each(function () {
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

        totalPages: 5,
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

            $('.page-active').removeClass('page-active');
            $('#page'+page).addClass('page-active');
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
    displayResult('north');
    $('#page1').addClass('page-active');


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
           }

            if(location=='north'){
                id = "tab-north";
            }else if(location=='south') {
                id = "tab-south";
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
    }
    // alert("hgghhhjhj");
    removeText(id);
  }     


  function removeText(id){
    var idVal ='';
    if(idVal=="tab-north"){
        $('#' + id + ' .item')[11].nextSibling.nodeValue = '';
    }else{
        $('#' + id + ' .item')[11].nextSibling.nodeValue = '';
    }
  }