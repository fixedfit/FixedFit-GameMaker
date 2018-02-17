if ds_map_find_value(async_load, "id") == httpWeather
    {
    var status = ds_map_find_value(async_load, "status");
    if status == 0
       {
       var path = ds_map_find_value(async_load, "result");
       temperature=string(round(readWeatherFile(path)))+"°";
       }
    }