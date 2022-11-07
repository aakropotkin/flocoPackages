{

  inputs.packument.url   = "https://registry.npmjs.org/deep-is?rev=14-2ff71f9239e4d010adf4cede8202d226";
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
    ident = "deep-is";
    ldir  = "info/unscoped/d/deep-is";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
