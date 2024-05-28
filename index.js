const express = require('express');
const swipl = require('swipl');
const cors = require('cors'); // Importamos el middleware 'cors'

const app = express();
const port = 3000;

// Usamos el middleware 'cors' para permitir solicitudes de origen cruzado
app.use(cors());

// Cargar el archivo Prolog
swipl.call('consult(\'aves.pl\')');

// Endpoint para obtener la lista de aves
app.get('/aves', (req, res) => {
    const query = new swipl.Query('ave(Ave)');
    let aves = [];
    
    let result;
    while (result = query.next()) {
        aves.push(result.Ave);
    }
    query.close();

    res.json(aves);
});

// Endpoint para obtener información detallada de un ave
app.get('/aves/:nombre', (req, res) => {
    const ave = req.params.nombre;
    const query = new swipl.Query(`info(${ave}, Tamano, Habitat, Poblacion, Alimentacion)`);

    let result = query.next();
    query.close();

    if (result) {
        res.json(result);
    } else {
        res.status(404).send('Ave no encontrada');
    }
});

// Endpoint para verificar si un ave está en peligro de extinción
app.get('/en_peligro_extincion/:nombre', (req, res) => {
    const ave = req.params.nombre;
    const query = new swipl.Query(`en_peligro_extincion(${ave})`);

    let result = query.next();
    query.close();

    res.json({ en_peligro_extincion: !!result });
});

// Endpoint para verificar si un ave es de un estado específico de México
app.get('/ave_de_estado/:nombre/:estado', (req, res) => {
    const ave = req.params.nombre;
    const estado = req.params.estado;
    const query = new swipl.Query(`ave_de_estado(${ave}, ${estado})`);

    let result = query.next();
    query.close();

    res.json({ ave_de_estado: !!result });
});

// Iniciar el servidor
app.listen(port, () => {
    console.log(`Servidor escuchando en http://localhost:${port}`);
});
