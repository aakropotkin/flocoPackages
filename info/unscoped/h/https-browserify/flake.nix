{

  inputs.packument.url   = "https://registry.npmjs.org/https-browserify?rev=11-391e4dc3db687dda48a028aa46549586";
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
    ident = "https-browserify";
    ldir  = "info/unscoped/h/https-browserify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
