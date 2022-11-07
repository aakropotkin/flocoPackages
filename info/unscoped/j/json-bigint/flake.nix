{

  inputs.packument.url   = "https://registry.npmjs.org/json-bigint?rev=36-86d6eca757e744c89aa18250e2002c3c";
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
    ident = "json-bigint";
    ldir  = "info/unscoped/j/json-bigint";
    inherit packument fetchInfo;
  } // latest';

}
