{

  inputs.packument.url   = "https://registry.npmjs.org/@serialport/bindings-cpp?rev=21-436eda3eef900ada71a2e59aa91c983f";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = "@serialport";
    ident = "@serialport/bindings-cpp";
    ldir  = "info/serialport/bindings-cpp";
    inherit packument fetchInfo;
  } // latest';

}
