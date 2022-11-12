{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/acorn-globals?_rev=35-7ae32677b283668dd02db79b7a7168d5";
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
    ident = "acorn-globals";
    ldir  = "info/unscoped/a/acorn-globals";
    inherit packument fetchInfo;
  } // latest';

}
