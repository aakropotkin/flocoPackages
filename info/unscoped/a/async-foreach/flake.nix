{

  inputs.packument.url   = "https://registry.npmjs.org/async-foreach?rev=11-d3413f433464ea872d471c7923e05c65";
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
    ident = "async-foreach";
    ldir  = "info/unscoped/a/async-foreach";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
