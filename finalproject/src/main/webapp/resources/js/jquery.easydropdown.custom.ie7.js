var EasyDropDownInitInstances = {};
function EasyDropDownInit() {
    var easyDropDownSelector = $.easyDropDownSelector || "";
    $(easyDropDownSelector).show();
    $(".dropdown").show();
}