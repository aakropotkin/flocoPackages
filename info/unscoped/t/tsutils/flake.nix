{

  inputs.packument.url   = "https://registry.npmjs.org/tsutils?rev=101-3245584c09f412cba535dd61045a5b03";
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
    ident = "tsutils";
    ldir  = "info/unscoped/t/tsutils";
    inherit packument fetchInfo;
  } // latest';

}
