$("#new_user").validate({
    rules: {
        "user[name]": {
            required: true,
            maxlength: 30
        },
        "user[email]": {
            required: true,
            email: true
        },
        "user[password]": {
            required: true,
            minlength: 8
        },
        "user[password_confirmation]": {
            required: true,
            equalTo: "#user_password"
        }
    },
    messages: {
        "user[name]": {
            required: "Not blank",
            maxlength: "Too long"
        },
        "user[email]": {
            required: "Not blank",
            email: "Wrong format"
        },
        "user[password]": {
            required: "Not blank",
            minlength: "Too short"
        },
        "user[password_confirmation]": {
            required: "Not blank",
            minlength: "Password confirmation must same password"
        }
    }
});
