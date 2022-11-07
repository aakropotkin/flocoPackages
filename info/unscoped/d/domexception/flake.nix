{

  inputs.packument.url   = "https://registry.npmjs.org/domexception?rev=8-9199683effc007918d4d14991d569c6e";
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
    ident = "domexception";
    ldir  = "info/unscoped/d/domexception";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
