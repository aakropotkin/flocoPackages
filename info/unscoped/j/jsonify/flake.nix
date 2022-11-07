{

  inputs.packument.url   = "https://registry.npmjs.org/jsonify?rev=10-0abf6c4adc20ce71617d73f63e4cd761";
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
    ident = "jsonify";
    ldir  = "info/unscoped/j/jsonify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
