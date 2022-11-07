{

  inputs.packument.url   = "https://registry.npmjs.org/varint?rev=30-8d806b101a69adff83647577f9bff48d";
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
    ident = "varint";
    ldir  = "info/unscoped/v/varint";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
