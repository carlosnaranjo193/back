const express = require('express');
const yup = require('yup');
const connection = require('./db'); 

const router = express.Router();

const schema = yup.object().shape({
  precio: yup
    .string()
    .required("El precio es obligatorio"),
  nombre: yup
    .string()
    .required("El nombre es obligatorio"),
  descripcion: yup
    .string()
    .required("La descripcion es obligatorio"),
  imagen: yup
    .string()
    .required("La imagen es obligatorio"),
  
})

router.get("/productos", (request, response) => {
  connection.query("SELECT * FROM productos ORDER BY id DESC", (error, result) => {
    if (error) {
      console.log("Error fetching clients", error);
    } else {
      response.json(result);
    }
  })

})

router.post("/producto", async (request, response) => {
  const datos = request.body

  try {
    const result = await schema.validate(datos) 
    console.log(result)

    const query =
      "INSERT INTO productos (precio, nombredelproducto, descripcion, imagenurl) VALUES (?, ?, ?, ?)"
      

    // Object.values(datos) es un array con los valores del objeto
    connection.execute(query, Object.values(datos), (error, result) => {
      if (error) {
        response.status(400).json({
          message: "Error al guardar el producto",
          error: error,
        })
      } else {
        response.json({
          message: "Producto guardado",
          data: result,
        })
      }
    })
  } catch (error) {
    console.log(error)
    response.status(400).json({
      message: error.message,
    })
  }
});

router.get("/producto/:id", (request, response) => {
  const { id } = request.params

  const query = "SELECT * FROM productos WHERE id = ?"

  connection.query(query, [id], (error, result) => {
    if (error) {
      response.status(400).json({
        message: "Error al obtener el producto",
        error,
      })
    } else {
      if (result.length > 0) {
        response.json(result[0])
      } else {
        response.status(404).json({
          message: "Producto no encontrado",
        })
      }
    }
  })
})

router.put("/producto/:id", async (request, response) => {
  const data = request.body
  const { id } = request.params

  try {
    await schema.validate(data)
    const query = "UPDATE productos SET precio = ?, nombre = ?, descripcion = ?, imagen = ?,  WHERE id = ?"

    connection.execute(query, Object.values(data).concat(id), (error, result) => {
      if (error) {
        response.status(400).json({
          message: "Error al actualizar el producto",
          error,
        })
      } else {
        response.json({
          message: "Producto actualizado",
          data: result,
        })
      }
    })
  } catch (error) {
    response.status(400).json({
      message: error.message,
    })
    return
  }


})

router.delete("/producto/:id", (request, response) => {
  const { id } = request.params

  const query = "DELETE FROM productos WHERE id = ?"

  connection.execute(query, [id], (error, result) => {
    if (error) {
      console.log('entra en delete fail ???', id)
      response.status(400).json({
        message: "Error al borrar el producto",
        error,
      })
    } else {
      console.log('entra en delete ok???', id)
      response.json({
        message: "Producto borrado",
        data: result,
      })
    }
  })
})

module.exports = router;
