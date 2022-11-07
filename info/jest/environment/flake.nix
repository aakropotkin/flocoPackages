{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/environment?rev=116-3b6d4ce96f040188b7902c38e5f327b2";
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
    scope = "@jest";
    ident = "@jest/environment";
    ldir  = "info/jest/environment";
    inherit packument fetchInfo;
  } // latest';

}
