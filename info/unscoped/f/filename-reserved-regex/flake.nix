{

  inputs.packument.url   = "https://registry.npmjs.org/filename-reserved-regex?rev=9-11e8fffeaac7b15f3d300f19a15ee2c7";
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
    ident = "filename-reserved-regex";
    ldir  = "info/unscoped/f/filename-reserved-regex";
    inherit packument fetchInfo;
  } // latest';

}
