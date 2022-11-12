{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/enzyme?_rev=158-33ed4597ccea96ce31931f50d73d15dc";
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
    ident = "enzyme";
    ldir  = "info/unscoped/e/enzyme";
    inherit packument fetchInfo;
  } // latest';

}
