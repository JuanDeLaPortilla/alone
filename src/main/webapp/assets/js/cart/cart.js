const items = document.getElementById('items')
const footer = document.getElementById('footer')
const templateFooter = document.getElementById('template-footer').content
const templateCarrito = document.getElementById('template-carrito').content
const fragment = document.createDocumentFragment()
let carrito = {}

// Eventos
items.addEventListener('click', e => {
    btnAumentarDisminuir(e)
})

// Traer productos
const addProduct = async () => {
    const res = await fetch('/cart&action=find&id=' + this.dataset.id);
    const data = await res.json()
    // console.log(data)
    setCarrito(data)
}

const setCarrito = producto => {
    if (carrito.hasOwnProperty(producto.id)) {
        producto.cantidad = carrito[producto.id].cantidad + 1
    }

    carrito[producto.id] = {...producto}

    pintarCarrito()
}

const pintarCarrito = () => {
    items.innerHTML = ''

    Object.values(carrito).forEach(producto => {
        templateCarrito.querySelector('.descripcion').textContent = producto.descripcion
        templateCarrito.querySelector('.categoria').textContent = producto.categoria
        templateCarrito.querySelector('.cantidad').textContent = producto.cantidad
        templateCarrito.querySelector('.precio').textContent = producto.precio * producto.cantidad

        //botones
        templateCarrito.querySelector('.bi-file-minus-fill').dataset.id = producto.id
        templateCarrito.querySelector('.bi-file-plus-fill').dataset.id = producto.id

        const clone = templateCarrito.cloneNode(true)
        fragment.appendChild(clone)
    })
    items.appendChild(fragment)

    pintarFooter()
}

const pintarFooter = () => {
    footer.innerHTML = ''

    if (Object.keys(carrito).length === 0) {
        footer.innerHTML = `
        <th scope="row" colspan="5">Carrito vacío, comienza a comprar</th>
        `
        return
    }

    // sumar cantidad y sumar totales
    const nCantidad = Object.values(carrito).reduce((acc, {cantidad}) => acc + cantidad, 0)
    const nPrecio = Object.values(carrito).reduce((acc, {cantidad, precio}) => acc + cantidad * precio, 0)
    // console.log(nPrecio)

    templateFooter.querySelector('.total').textContent = nPrecio

    const clone = templateFooter.cloneNode(true)
    fragment.appendChild(clone)

    footer.appendChild(fragment)

    const boton = document.querySelector('#vaciar-carrito')
    boton.addEventListener('click', () => {
        carrito = {}
        pintarCarrito()
    })

}

const btnAumentarDisminuir = e => {
    // console.log(e.target.classList.contains('btn-info'))
    if (e.target.classList.contains('bi-file-plus-fill')) {
        const producto = carrito[e.target.dataset.id]
        producto.cantidad++
        carrito[e.target.dataset.id] = {...producto}
        pintarCarrito()
    }

    if (e.target.classList.contains('bi-file-minus-fill')) {
        const producto = carrito[e.target.dataset.id]
        producto.cantidad--
        if (producto.cantidad === 0) {
            delete carrito[e.target.dataset.id]
        } else {
            carrito[e.target.dataset.id] = {...producto}
        }
        pintarCarrito()
    }
    e.stopPropagation()
}
