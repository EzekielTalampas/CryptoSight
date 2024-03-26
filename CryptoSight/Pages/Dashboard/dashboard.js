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
    // Hide all tab content sections
    document.querySelectorAll('.crypto-list').forEach(tabContent => {
        tabContent.style.display = 'none';
    });

    // Remove 'active' class from all tab buttons
    document.querySelectorAll('.tabs .tab').forEach(tabButton => {
        tabButton.classList.remove('active');
    });

    // Show the selected tab content
    document.getElementById(tabId).style.display = 'block';

    // Add 'active' class to the clicked tab button
    // Assuming tab buttons have an ID corresponding to the tab content with '-btn' suffix
    document.getElementById(tabId + '-btn').classList.add('active');
}

// Initialize the tabs on window load
window.addEventListener('load', function () {
    switchTab('top-10'); // Default to showing 'Top 10'
});
function switchTab(tabId) {
    // Hide all tab content sections
    document.querySelectorAll('.crypto-list').forEach(tabContent => {
        tabContent.style.display = 'none';
    });

    // Remove 'active' class from all tab buttons
    document.querySelectorAll('.tabs .tab').forEach(tabButton => {
        tabButton.classList.remove('active');
    });

    // Show the selected tab content
    document.getElementById(tabId).style.display = 'block';

    // Add 'active' class to the clicked tab button
    // Assuming tab buttons have an ID corresponding to the tab content with '-btn' suffix
    document.getElementById(tabId + '-btn').classList.add('active');
}

// Initialize the tabs on window load
window.addEventListener('load', function () {
    switchTab('top-10'); // Default to showing 'Top 10'
});




