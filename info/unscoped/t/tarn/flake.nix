{

  inputs.packument.url   = "https://registry.npmjs.org/tarn?rev=25-b6fd468a69da0909d76056e4fa3a88e4";
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
    scope = null;
    ident = "tarn";
    ldir  = "info/unscoped/t/tarn";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
