{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/define-property?_rev=16-bd49c8ee4ad8c41867d7a3d2270fbc79";
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
    ident = "define-property";
    ldir  = "info/unscoped/d/define-property";
    inherit packument fetchInfo;
  } // latest';

}
