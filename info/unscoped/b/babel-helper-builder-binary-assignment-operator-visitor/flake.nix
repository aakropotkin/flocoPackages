{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helper-builder-binary-assignment-operator-visitor?rev=89-8783cbb76f4d40782a9cb8b83cc321f3";
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
    ident = "babel-helper-builder-binary-assignment-operator-visitor";
    ldir  = "info/unscoped/b/babel-helper-builder-binary-assignment-operator-visitor";
    inherit packument fetchInfo;
  } // latest';

}
