$(document).ready(function () {
    var cachedData = localStorage.getItem('cryptoData');

    if (cachedData) {
        var response = JSON.parse(cachedData);
        updateCryptoPrices(response);
    } else {
        fetchCryptoData();
    }
});

function fetchCryptoData() {
    var liveprices = {
        "async": true,
        "crossDomain": true,
        "url": "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,binancecoin,solana,ripple,cardano,dogecoin,tron,chainlink,polkadot&vs_currencies=usd",
        "method": "GET",
        "headers": {}
    };

    $.ajax(liveprices).done(function (response) {
        console.log(response);

        localStorage.setItem('cryptoData', JSON.stringify(response));

        updateCryptoPrices(response);
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.log("Error:", errorThrown);
    });
}

function updateCryptoPrices(response) {
    $("#bitcoin").text(response.bitcoin.usd);
    $("#ethereum").text(response.ethereum.usd);
    $("#bnb").text(response.binancecoin.usd);
    $("#solana").text(response.solana.usd);
    $("#xrp").text(response.ripple.usd);
    $("#cardano").text(response.cardano.usd);
    $("#dogecoin").text(response.dogecoin.usd);
    $("#tron").text(response.tron.usd);
    $("#chainlink").text(response.chainlink.usd);
    $("#polkadot").text(response.polkadot.usd);
}

function switchTab(tabId) {
    document.querySelectorAll('.crypto-list').forEach(tab => {
        tab.classList.remove('active');
    });

    document.getElementById(tabId).classList.add('active');
}

window.addEventListener('load', function () {
    switchTab('top-10');
});


