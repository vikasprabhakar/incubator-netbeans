  var ctverec = "ctverec in global";
var obdelnik = "obdelnik in global";

var a = x / 2/ 5 /6 ;

x = /eeeee/i
+ 2 / 5

adad = /sdsdsd/;

/dfdfdf/

// nice and simple function
function println(text) {
    document.writeln(text + "<br/>");
}

/*
 * another nice and simple function
 */
function addSpace(count) {
    var space = "";
    for(i = 0; i < count; i++) {
        space += "&nbsp;";
    }
    return space;
}

function Ridic(name, surname){
    this.name =  name;
    this.surname = surname;

    this.getName = function() {
        return /*this is ugly comment*/this.name;
    }
}

function Kolo () {
    var ctverec = "ctverect in kolo";
    this.trojuhelnik = "trojuhelnik";

    this.description = function () {
        println(obdelnik);
        println("kulate kolo " + // trailing comment
ctverec);
    }
}

Kolo.prototype.getColor = function () {
    println("Kolo.getColor is called:");
    println(addSpace(4) + ctverec);
    println(addSpace(4) + this.trojuhelnik);
    return "black";
}

Kolo.prototype.isEmpty = function () {
    return "is not empty";
}


Ridic.prototype.getSurname = function () {
    return this.surname;
}

var motor =  {
    pocetValcu : 8,
    vykon: "22kfdafa",
    getDescription: function () {
        println ('Pocet valcu: ' + this.pocetValcu + ' s vykonem: ' + this.vykon);
    }
}


myKolo = new Kolo();
println("auto");
myKolo.description();
println(myKolo.getColor());
println(myKolo.isEmpty());

myMotor = motor;
myMotor.getDescription();


ridic = new Ridic('Petr', 'Hejl');
println(ridic.getName() + " " + ridic.getSurname());