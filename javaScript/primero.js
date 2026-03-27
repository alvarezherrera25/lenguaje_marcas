const persona= {
    id: 1, 
    nombre: "Alfredo"
}
//objeto -> json : json.stringify
const mijson = JSON.stringify(persona);     
console.log("paso a json, mijson")

// o tambine -> console.log("paso a json", JSON.stringify(persona));

//json -> objeto :
console.log("de json a objeto", JSON.parse(mijson));

//console.log("hola"); 
//alert("hola"); 