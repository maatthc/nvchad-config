const what = require("./lixo2.js");
console.log("Olá, mundo!");

class Pessoa {
  constructor(nome) {
    this.nome = nome;
  }

  falar() {
    console.log(`Meu nome é ${this.nome}`);
  }
}

const init = () => {
  //init3(1, 2);
  readFile("/home/maat/lixo.json");
  console.log("Iniciando...");
};

const readFile = (filePath) => {
  const fs = require("fs");
  const data = fs.readFileSync(filePath, { encoding: "utf8", flag: "r" });
  console.log(data);
  //const jsonData = JSON.parse(data);
  //console.log(jsonData);
};
const init2 = () => {
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
  console.log("Iniciando...");
};

const init3 = (a, b) => {
  console.log("Iniciando..." + a + b);
};

init();
