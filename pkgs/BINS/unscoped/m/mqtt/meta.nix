{ version }: {

  bin = let
    mqtt = if 0 <= ( builtins.compareVersion "4.0.1" version )
           then "mqtt.js"
           else "bin/mqtt.js";
  in {
    mqtt_pub = "bin/pub.js";
    mqtt_sub = "bin/sub.js";
    inherit mqtt;
  };

}
