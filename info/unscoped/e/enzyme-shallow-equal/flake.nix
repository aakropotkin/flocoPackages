{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/enzyme-shallow-equal?_rev=17-d4f7bc9f2ea266a189c2be75d79d0bb8";
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
    ident = "enzyme-shallow-equal";
    ldir  = "info/unscoped/e/enzyme-shallow-equal";
    inherit packument fetchInfo;
  } // latest';

}
