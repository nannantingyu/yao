var hotIndex = 1,
    newIndex = 1,
    recommendIndex = 1;
var goodsLayout = '<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"><div class="product">'
    + '<div class="image"><a href="/home/index/product/id/{$goods_id}.html"><img src="{$goods_img}" style="height: 160px;" /></a></div> '
    + '<div class="buttons"> <a class="btn cart" href="javascript: void(0);" onclick="addCart({$goods_id})"><span class="glyphicon glyphicon-shopping-cart"></span></a>'
    + '<a class="btn wishlist" href="/wish/{$goods_id}/"><span class="glyphicon glyphicon-heart"></span></a>'
    + '</div> <div class="caption"> <div class="name"><h3><a href="/home/index/product/id/{$goods_id}.html">{$goods_name}</a></h3>'
    + '</div> <div class="price">¥{$promote_price}<span>¥{$shop_price}</span></div> <div class="rating"><span class="glyphicon glyphicon-star"></span>'
    + '<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>'
    + ' </div> </div> </div>';


$(function(){

});

/**
 * 换一换功能
 * @param type
 */
function changeGoods(type){
    var index = type == 1? newIndex: (type == 2? hotIndex: recommendIndex);

    $.ajax({
        url: '/home/goods/changeGoods',
        data: {index: index, type: type},
        success: function (data){

        }
    })
}