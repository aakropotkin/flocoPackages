{

  inputs.packument.url   = "https://registry.npmjs.org/aggregate-error?rev=13-9550c51017e511b91f322009133447fb";
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
    ident = "aggregate-error";
    ldir  = "info/unscoped/a/aggregate-error";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
