let toRegister = false;

//on load
document.addEventListener('DOMContentLoaded', function () {
    //set selector to default position
    document.querySelector('.Selector').style.transform =
        'translateX(' + (document.querySelector('.LogInButton').offsetLeft - document.querySelector('#LogForm').offsetLeft) + 'px)';
    //on login click
    document.querySelector('.LogInButton').addEventListener('click', function () {
        if (!toRegister) return;
        toRegister = false;
        document.querySelector('.Selector').style.transform =
            'translateX(' + (document.querySelector('.LogInButton').offsetLeft - document.querySelector('#LogForm').offsetLeft) + 'px)';
        //hide hidden
        for (div of document.querySelectorAll('.Registration')) div.style.display = "none";
    })
    //on register click
    document.querySelector('.RegisterButton').addEventListener('click', function () {
        if (toRegister) return;
        toRegister = true;
        document.querySelector('.Selector').style.transform =
            'translateX(' + (document.querySelector('.RegisterButton').offsetLeft - document.querySelector('#LogForm').offsetLeft) + 'px)';
        //show hidden
        for (div of document.querySelectorAll('.Registration')) div.style.display = "block";
    })
})
