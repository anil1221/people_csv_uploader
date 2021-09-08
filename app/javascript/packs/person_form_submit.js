export default function personFormSubmit() {
    $('.person-submit').on('click', function () {
        var uniq_class = $(this).attr('data-uniq-id');
        var first_name = $(uniq_class+ " #person_first_name").val();
        var last_name = $(uniq_class+ " #person_last_name").val();
        var email = $(uniq_class+ " #person_email").val();
        var phone = $(uniq_class+ " #person_phone").val();
        var uniq_id = $(uniq_class+ " #person_uniq_id").val();

        $.ajax({
            method: 'POST',
            url: '/create',
            data: { person: { first_name: first_name, last_name:last_name, email: email, phone: phone, uniq_id: uniq_id } },
            dataType: 'script'
        }).done(function (response) {
            // response
        }).fail(function (response) {
            alert(response.responseText)
        })
    })
}