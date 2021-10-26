var cart = {
    init: function () {
        cart.regEvents();
    },
    regEvents: function () {
        $('#btnContinue').off('click').on('click', function () {
            window.location.href = "/";
        });
        $('#btnPayment').off('click').on('click', function () {
            window.location.href = "/thanh-toan";
        });
        $('#btnUpdate').off('click').on('click', function () {
            var listProduct = $('.txtQuantity');
            var cartList = [];
            $('.abc').each(function () {
                var item = $(this); //this should represent one row
                var andar = item.find('input[name=firstname]').val();
                var andar1 = item.find('input[name=hiddenname]').val();
                var andar2 = item.find('input[name=lastname]').val();
                console.log(andar);
                console.log(andar1);
                console.log(andar2);
                cartList.push({
                    Size: andar,
                    Quantity: andar2,
                    Product: {
                        ID: andar1
                    }
                });

            });
            //$.each(listProduct, function (i, item) {
            //    var txtQuantity = $(item).val();
            //    console.log(txtQuantity);
            //    var txtProductId = $(item).data('id');
            //    cartList.push({
            //        Quantity: txtQuantity,
            //        Product: {
            //            ID: txtProductId
            //        }
            //    });
            //});

            $.ajax({
                url: '/Cart/Update',
                data: { cartModel: JSON.stringify(cartList) },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        alert("Cập nhật thành công");
                        window.location.href = "/gio-hang";
                    }
                }
            })
        });

        $('#btnDeleteAll').off('click').on('click', function () {


            $.ajax({
                url: '/Cart/DeleteAll',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }
            })
        });

        $('.btn-delete').off('click').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                data: { id: $(this).data('id') },
                url: '/Cart/Delete',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }
            })
        });
    }
}
cart.init();