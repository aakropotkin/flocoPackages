{

  inputs.packument.url   = "https://registry.npmjs.org/fs-minipass?rev=37-0b9ce8af18f9073bab7bba962d8e90d9";
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
    ident = "fs-minipass";
    ldir  = "info/unscoped/f/fs-minipass";
    inherit packument fetchInfo;
  } // latest';

}
