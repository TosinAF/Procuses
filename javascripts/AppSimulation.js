function changeImageTo(image_src) {
    $("#app-image").attr('src', image_src);
}

function changeImageMapTo(image_map) {
    $("#app-image").attr('usemap', image_map);
}

function changeImageAttr(image_src, image_map) {
	changeImageTo(image_src);
	changeImageMapTo(image_map);
}