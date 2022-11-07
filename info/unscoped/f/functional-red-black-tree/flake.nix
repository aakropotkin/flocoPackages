{

  inputs.packument.url   = "https://registry.npmjs.org/functional-red-black-tree?rev=15-4a402b861062bda0f73a645f128146e3";
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
    ident = "functional-red-black-tree";
    ldir  = "info/unscoped/f/functional-red-black-tree";
    inherit packument fetchInfo;
  } // latest';

}
