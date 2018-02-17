var loc = argument0;
httpWeather=http_get_file("http://api.openweathermap.org/data/2.5/weather?zip="+loc+"&APPID=4ebd3596288f474d93915703e0d4058b",working_directory+"weather.json"); 
