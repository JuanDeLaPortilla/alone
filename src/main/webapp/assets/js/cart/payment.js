const confirmPayment = async () => {
    const location = window.location.hostname;
    const settings = {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
        },
        body: carrito
    };
    try {
        const fetchResponse = await fetch('cart?action=payment', settings);
        const data = await fetchResponse.json();
        console.log(data);
    } catch (e) {
        console.log(e);
    }

}