{

  inputs.packument.url   = "https://registry.npmjs.org/enzyme-shallow-equal";
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
