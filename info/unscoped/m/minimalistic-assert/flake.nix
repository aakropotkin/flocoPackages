{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/minimalistic-assert?_rev=7-2fdf64247e05eddfed773bede5f06e27";
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
    ident = "minimalistic-assert";
    ldir  = "info/unscoped/m/minimalistic-assert";
    inherit packument fetchInfo;
  } // latest';

}
