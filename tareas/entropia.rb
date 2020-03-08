# ? Cuantos eventos estan participando
# ? cambiar mensajes de entrada
# x que no acepte caracteres, ni numeros, ni negativos, solo fracciones y decimales

require 'awesome_print'


while true
    puts "=" * 30
    puts "Ingrese los datos separados por comas"
    array = gets.chomp.split(",").map{|x| x.to_r }
    
    datosAceptables = true
    datosAceptables = !array.empty?

    array.each do |arr|
        if arr <= 0 || arr % 1 == 0
            datosAceptables = false
        end
    end

    if datosAceptables        
        break
    else
        puts "DATOS INCORRECTOS"
        puts ""
    end
end

array = array.map{|x| x.to_f }

puts "=" * 30
puts "Ingrese la base"
base = gets.chomp.to_i

iE = array.map{|x| Math.log(x, base) }.inject{|sum,x| sum + x } * -1

hashArray = {}
array.each do |e|
    if hashArray[ e ].nil?
        hashArray[ e ] = 0
    end

    hashArray[ e ] += 1
end


hE = 0.0
hashArray.each do |k, v|
    hE += (v * k) * Math.log(k, base)
end
hE *= -1

puts ""
puts "Datos otorgados #{ array }"
puts "Base #{ base }"
puts "Informacion mutua: #{ iE }"
puts "Entropia: #{hE}"

