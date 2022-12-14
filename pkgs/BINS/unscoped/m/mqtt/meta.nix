{ version }: {

  binInfo.binPairs = let
    mqtt = if 0 <= ( builtins.compareVersions "4.0.1" version )
           then "mqtt.js"
           else "bin/mqtt.js";
  in {
    mqtt_pub = "bin/pub.js";
    mqtt_sub = "bin/sub.js";
    inherit mqtt;
  };

}
