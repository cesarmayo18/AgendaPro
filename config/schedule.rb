# Use this file to easily define all of your cron jobs.
#
set :environment, :development              #Configuración del entorno de desarrollo
set :output, "#{path}/log/cron_log.logs"    #Ruta de la salida en un archivo llamado cron_logs.logs
env :GEM_PATH, ENV['GEM_PATH']              

every 1.day, at: '11:59 pm' do

    command "echo '-----Usuarios ganan 10.000-----'"      #Imprime mensaje en la salida cron_logs.logs
    runner "User.recharge_balance"         #Ejecuta método dentro del proyecto

end

every 3.minutes do

    command "echo '-----Inicando juego-----'"      #Imprime mensaje en la salida cron_logs.logs
    runner "Game.play"         #Ejecuta método dentro del proyecto

end